/**
 * dsbcheck.js - Funktionen für den Grundschutz-Check
 *
 * @file Umfasst die Funktionalitäten des Grundschutz-Checks für DSBs
 *
 * @requires assets/js/mains.js
 * @requires assets/js/datatables.min.js
 * @requires assets/js/datatables_german.json
 *
 * @author Dustin Gawron <dustin.gawron@uni-muenster.de>
 * @copyright (c) 2021 Westfälische Wilhelms-Universität Münster
 * @license AGPL-3.0-or-later <https://www.gnu.org/licenses/agpl.html>
 */
/**
 * Liste aller TOMs
 * @global
 * @type {Array}
 */
let tomsMapping = [];

/**
 * Bildet den Umsetzungsstand auf HTML ab
 * @global
 * @type {Object}
 */
let implementationMapping = {
  '-1': '<span class="text-info">Unbearbeitet</span>',
  '0': '<span class="text-danger">Nein</span>',
  '1': '<span class="text-success">Ja</span>',
  '2': '<span class="text-warning">Teilweise</span>',
  '4': '<span class="text-muted">Entbehrlich</span>'
};

/**
 * Punkte für verschiedene Umsetzungsstände
 * @global
 * @type {Object}
 */
let implementationPoints = {
  '-1': 0,
  '0': 0,
  '1': 1,
  '2': 0.5,
  '4': 1
};

/**
 * Fragt die TOMs einer Dokumentation und ihrer Abhängigkeiten ab
 * @param  {Number} docId ID der Dokumentation, die überprüft werden soll
 * @return {undefined}
 */
function getCombinedTOMs(docId) {
  setOverlay();

  $.post(backendPath, JSON.stringify({ 'action': 'tomcheck', 'id': docId, 'debug': debug })).done((data) => {
    if (!data['success']) {
      showError('Einsammeln der TOMs', data['error']);
      return;
    }

    // Seitentitel setzen
    $('#mainTitle').text(`${data.data.docs[docId].allgemein_bezeichnung} (#${docId})`);
    window.document.title += ` - Grundschutz-Check für ${data.data.docs[docId].allgemein_bezeichnung} (#${docId})`;

    // Gewähltes Risiko
    let docRiskLevel = parseInt(data.data.docs[docId].massnahmen_risiko);

    // Verwendungen der einzelnen Maßnahmen und Umsetzungspunkte zählen
    for (let tomKey in tomsMapping) {
      tomsMapping[tomKey].docCount = 0;
      tomsMapping[tomKey].docPoints = 0;

      // Maßnahmen für höhere Risiken überspringen
      if (parseInt(tomsMapping[tomKey].Risklevel) > docRiskLevel) continue;

      if (('massnahmen_' + tomsMapping[tomKey].Identifier) in data['data']['toms']) {
        tomsMapping[tomKey].docCount = data.data.toms['massnahmen_' + tomsMapping[tomKey].Identifier].length;

        if (tomsMapping[tomKey].docCount > 0) {
          for (let tomDoc of data.data.toms['massnahmen_' + tomsMapping[tomKey].Identifier]) {
            tomsMapping[tomKey].docPoints += implementationPoints[tomDoc.data];
          }
        }
      }
    }

    // Alle TOMs durchgehen und verwendete in Tabelle eintragen
    for (let tom of tomsMapping) {
      if (tom.docCount === 0) continue;

      // Einträge pro Kategorie und Punkte zählen
      let docCountCat = 0;
      let catPoints = 0;
      let tomCount = 0;
      for (let tomTemp of tomsMapping) {
        // Maßnahmen für höhere Risiken überspringen
        if (parseInt(tomTemp.Risklevel) > docRiskLevel) continue;

        if (tomTemp.Category === tom.Category && tomTemp.Subcategory === tom.Subcategory) {
          docCountCat += tomTemp.docCount;
          catPoints += (tomTemp.docCount !== 0 ? tomTemp.docPoints / tomTemp.docCount : 0);
          tomCount++;
        }
      }

      if (docCountCat === 0) continue;

      // Eintrag für jede Verwendung einr Maßnahme
      for (let tomDoc of data.data.toms['massnahmen_' + tom.Identifier]) {
        let tableCatHTML = `
         <td data-percentage="${Math.round((catPoints / tomCount) * 100)}">
           ${htmlEncode(tom.Subcategory)}
         </td>`;

        let tomMeasureHTML = `
         <td>
           ${htmlEncode(tom.Description)}
         </td>`;

        // Umsetzungsstand und Kommentar vorbereiten
        let tomStatus = implementationMapping[tomDoc.data];
        let tomComment = '';

        if (Object.keys(data.data.toms).includes('massnahmen_' + tom.Identifier + '_kommentar')) {
          for (let tempComment of data.data.toms['massnahmen_' + tom.Identifier + '_kommentar']) {
            if (tempComment.id === tomDoc.id) {
              tomComment = htmlEncode(tempComment.data.trim()).replace(/\n/g, '<br>');
              break;
            }
          }
        }

        // Zeilen in Tabelle schreiben
        $('#overalltoms tbody').append(`
        <tr>
          ${tableCatHTML}
          ${tomMeasureHTML}
          <td>
            ${tomStatus}
          </td>
          <td>
            <div class="well ${tomComment === '' ? 'hidden' : ''}" style="margin-bottom: 0px !important;padding: 10px !important;">${tomComment}</div>
          </td>
          <td><a href="?id=${tomDoc.id}#${'massnahmen_' + tom.Identifier}" target="secdoc_${tomDoc.id}">${htmlEncode(data.data.docs[tomDoc.id]['allgemein_bezeichnung'])}</a></td>
        </tr>`);
      }
    }

    $('#overalltoms').DataTable({
      'paging': false,
      'order': [1, 'asc'],
      'language': {
        'url': 'assets/js/datatables_german.json'
      },
      columnDefs: [
        { type: 'natural-nohtml', 'targets': '_all' }
      ],
      rowGroup: {
        dataSrc: 0,
        startRender: function(rows, group) {
          let groupHeading = `${group}`;
          let groupPecentage = $(rows.nodes()[0]).children().first().data('percentage');
          let groupPercentageHTML = `
         <div class="progress pull-right" style="width: 30%; margin-bottom: 0px;">
           <div class="progress-bar" role="progressbar" aria-valuenow="${groupPecentage}" aria-valuemin="0" aria-valuemax="100" style="width: ${groupPecentage}%;">
             <span class="sr-only">${groupPecentage}% fertiggestellt</span>
           </div>
         </div>
         `;
          return $(`<tr><td colspan="5">${groupHeading} ${groupPercentageHTML}</td></tr>`);
        }
      },
      dom: "<'row'<'col-sm-4'l><'col-sm-4 text-center'B><'col-sm-4'f>><'row'<'col-sm-12'tr>><'row'<'col-sm-5'i><'col-sm-7'p>>",
      buttons: [
        {
          extend: 'pdfHtml5',
          title: `Grundschutz-Check - ${data.data.docs[docId].allgemein_bezeichnung} (#${docId})`,
          text: '<i class="fa fa-file-pdf-o"></i> Tabelle als PDF speichern',
          orientation: 'landscape',
          customize: function(doc) {
            console.log(doc);
            for (let c = 0; c < doc.content[1].table.body.length; c++) {
              // Link zur Dokumentation ergänzen
              let tempHTML = $(doc.content[1].table.body[c][4].text);
              if (tempHTML.text() === '') continue;
              doc.content[1].table.body[c][4].text = tempHTML.text();
              doc.content[1].table.body[c][4].link = tempHTML.get(0).href.replace(/x?sso/i, 'www');
              doc.content[1].table.body[c][4].decoration = 'underline';

              // HTML aus Kommentar entfernen
              tempHTML = $(doc.content[1].table.body[c][3].text.replace(/<br>/g, '\n'));
              doc.content[1].table.body[c][3].text = tempHTML.text();

              // HTML aus Umsetzungsstand umwandeln
              tempHTML = $(doc.content[1].table.body[c][2].text);
              doc.content[1].table.body[c][2].text = tempHTML.text();
              if (tempHTML.hasClass('text-success')) doc.content[1].table.body[c][2].color = 'green';
              if (tempHTML.hasClass('text-danger')) doc.content[1].table.body[c][2].color = 'red';
              if (tempHTML.hasClass('text-warning')) doc.content[1].table.body[c][2].color = 'orange';
              if (tempHTML.hasClass('text-muted')) doc.content[1].table.body[c][2].color = 'grey';
            }
          },
          exportOptions: {
            stripHtml: false
          }
        }
      ]
    });
  }).fail((jqXHR, error, errorThrown) => {
    showError('Einsammeln der TOMs', false, { 'jqXHR': jqXHR, 'error': error, 'errorThrown': errorThrown });
  }).always(() => {
    setOverlay(false);
  });
}

/**
 * Fragt die aktuelle TOM-Liste ab und führt dann den Grundschutz-Check durch
 * @return {undefined}
 */
function fetchTOMListAndCheckTOMs() {
  $.getJSON(backendPath + '?action=gettoms' + (debug ? '&debug=true' : '')).done((data) => {
    if (!data['success']) {
      showError('Holen der TOMs', data['error']);
      setOverlay(false);
      return;
    }

    if (data['data'].length === 0) {
      showError('Holen der TOMs', 'TOM Liste ist leer!');
      setOverlay(false);
      return;
    }

    tomsMapping = data['data'];
    // Nach Identifier sortieren
    tomsMapping = tomsMapping.sort((a, b) => a.Identifier.localeCompare(b.Identifier, 'en', { numeric: true }));

    getCombinedTOMs(loadIdMain);
  }).fail((jqXHR, error, errorThrown) => {
    showError('Holen der TOMs', false, { 'jqXHR': jqXHR, 'error': error, 'errorThrown': errorThrown });
    setOverlay(false);
  });
}

setOverlay(true);
fetchTOMListAndCheckTOMs();
