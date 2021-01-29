/**
 * dsbview.js - Funktionen für die DSB-Ansicht
 *
 * @file Umfasst die Funktionalitäten der DSB-Ansicht
 *
 * @requires assets/js/mains.js
 * @requires assets/js/datatables.min.js
 * @requires assets/js/datatables_german.json
 *
 * @author Thorsten Küfer <thorsten.kuefer@uni-muenster.de>
 * @author Dustin Gawron <dustin.gawron@uni-muenster.de>
 * @copyright (c) 2018-2021 Westfälische Wilhelms-Universität Münster
 * @license AGPL-3.0-or-later <https://www.gnu.org/licenses/agpl.html>
 */

 /**
  * Aktuell ausgewählte Ebene
  * @global
  * @type {Number}
  */
 let selectedTier = 1;

/**
 * Erstellt und läd die kombinierte PDF der Verfahren herunter.
 * @return {undefined}
 */
function getCombinedPDF() {
 setOverlay();

 $.post(backendPath, JSON.stringify({'action':'gencombinedpdf', 'debug': debug})).done((data) => {
   if(!data['success']) {
     showError('Laden der PDF-Datei', data['error']);
     return;
   }

   // Base64 Kodierung umkehren und Blob zum Download erstellen
   let pdfData = atob(data['data']['pdf'].replace(/\s/g, ''));
   let pdfBuffer = new Uint8Array(new ArrayBuffer(pdfData.length));
   for(let i=0; i < pdfData.length; i++) {
     pdfBuffer[i] = pdfData.charCodeAt(i);
   }
   let blob = new Blob([pdfBuffer], {type: "application/pdf"});
   let lastUpdate = new Date();
   let fileTitle = 'SecDoc_VVT_' + lastUpdate.getFullYear() + ('0' + (lastUpdate.getMonth() + 1)).slice(-2) + ('0' + lastUpdate.getDate()).slice(-2) + ('0' + lastUpdate.getHours()).slice(-2) + ('0' + lastUpdate.getMinutes()).slice(-2) + '.pdf';

   // PDF-Anzeige starten (Unterscheidung, ob Edge genutzt wird)
   if(window.navigator && window.navigator.msSaveOrOpenBlob) {
     window.navigator.msSaveOrOpenBlob(blob, fileTitle);
   }
   else {
     let url = window.URL.createObjectURL(blob);
     let download = $('<a></a>');
     download.attr('href', url).attr('download', fileTitle).addClass('hidden');;
     $('body').append(download);
     download[0].click();
     window.URL.revokeObjectURL(url);
     download.remove();
   }
 }).fail((jqXHR, error, errorThrown) => {
   showError('Laden der PDF-Datei', false, {'jqXHR': jqXHR, 'error': error, 'errorThrown': errorThrown});
 }).always(() => {
   setOverlay(false);
 });
}

/**
 * Erstellt und läd die komplette PDF zu einer Verarbeitungstätigkeit mit allen Abhängigkeiten herunter.
 * @param  {Number} docId ID der Verarbeitungstätigkeit
 * @return {undefined}
 */
function getCompletePDF(docId) {
 setOverlay();

 $.post(backendPath, JSON.stringify({'action':'gencompletepdf', 'id': docId, 'debug': debug})).done((data) => {
   if(!data['success']) {
     showError('Laden der PDF', data['error']);
     return;
   }

   // Base64 Kodierung umkehren und Blob zum Download erstellen
   let pdfData = atob(data['data']['pdf'].replace(/\s/g, ''));
   let pdfBuffer = new Uint8Array(new ArrayBuffer(pdfData.length));
   for(let i=0; i < pdfData.length; i++) {
     pdfBuffer[i] = pdfData.charCodeAt(i);
   }
   let blob = new Blob([pdfBuffer], {type: "application/pdf"});
   let lastUpdate = new Date();
   let typeName = {1: 'Verarbeitungstätigkeit', 2: 'IT-Verfahren', 3: 'Fachapplikation', 4: 'Übergreifende_Massnahme'};
   let fileTitle = 'SecDoc_' + typeName[data['data']['type']] + '_(komplett)_' + docId + '_' + data['data']['title'].substr(0, 30) + '_' + lastUpdate.getFullYear() + ('0' + (lastUpdate.getMonth() + 1)).slice(-2) + ('0' + lastUpdate.getDate()).slice(-2) + ('0' + lastUpdate.getHours()).slice(-2) + ('0' + lastUpdate.getMinutes()).slice(-2);
   fileTitle = fileTitle.replace(/[/\\?%*:|"<>\.,;=\s]/g, '_');
   fileTitle += '.pdf';

   // PDF-Anzeige starten (Unterscheidung, ob Edge genutzt wird)
   if(window.navigator && window.navigator.msSaveOrOpenBlob) {
     window.navigator.msSaveOrOpenBlob(blob, fileTitle);
   }
   else {
     let url = window.URL.createObjectURL(blob);
     let download = $('<a></a>');
     download.attr('href', url).attr('download', fileTitle).addClass('hidden');;
     $('body').append(download);
     download[0].click();
     window.URL.revokeObjectURL(url);
     download.remove();
   }
 }).fail((jqXHR, error, errorThrown) => {
   showError('Laden der PDF', false, {'jqXHR': jqXHR, 'error': error, 'errorThrown': errorThrown});
 }).always(() => {
   setOverlay(false);
 });
}

/**
 * Holt die aktuelle Liste der Dokumentationen und erzeugt die Tabellen.
 * @param  {number} tier Nummer der Ebene
 * @return {undefined}
 */
function loadTables(tier) {
  setOverlay(true);

  $.get(backendPath, { 'action': 'listdsb', 'debug': debug }).done((data) => {
    if(!data['success']) {
      showError('Abrufen der Verfahrensliste', data['error']);
      setSaveLabel('none');
      return;
    }

    var abgTable = $('#abgeschlossen tbody').first();
    var inbTable = $('#inbearbeitung tbody').first();

    $('#abgeschlossen table').DataTable().destroy();
    $('#inbearbeitung table').DataTable().destroy();

    $('#abgeschlossen table').off();
    $('#inbearbeitung table').off();

    abgTable.empty();
    inbTable.empty();

    // Für jedes Verfahren einen Tabelleneinträg anlegen
    for(var c=0; c < data['count']; c++) {
      if(parseInt(data['data'][c]['Typ']) !== tier) continue;

      let lastUpdate = data['data'][c]['Aktualisierung'] ? formatDate(new Date(data['data'][c]['Aktualisierung'].replace(' ', 'T'))) : 'Unbekannt';

      var newEntry = $('<tr></tr>');
      newEntry.append('<td style="width: 16px;"></td>');
      newEntry.append('<td>' + data['data'][c]['Bezeichnung'] + ' <i data-toggle="tooltip" class="fa fa-info-circle" title="' + data['data'][c]['Beschreibung'] + '"></i></td>');
      newEntry.append('<td>' + data['data'][c]['Fachabteilung'] + '</td>');
      newEntry.append('<td>' + (data['data'][c]['FachKontakt'] ? data['data'][c]['FachKontakt'] : '-- nicht angegeben --') + '</td>');
      newEntry.append('<td>' + (data['data'][c]['TechKontakt'] ? data['data'][c]['TechKontakt'] : '-- nicht angegeben --') + '</td>');
      newEntry.append('<td>' + data['data'][c]['Erstelldatum'] + '</td>');
      newEntry.append('<td data-order="' + (data['data'][c]['Aktualisierung'] ? new Date(data['data'][c]['Aktualisierung'].replace(' ', 'T')).getTime() : new Date().getTime()) + '">' + lastUpdate + ' <i class="fa fa-history cursor-progress revisionload" data-id="' + data['data'][c]['ID'] + '"></i> <br /> <strong>Bearbeiter:</strong> <span title="' + data['data'][c]['BearbeiterDetails'] + '">' + data['data'][c]['LetzterBearbeiter'] + '</span> </td>');
      newEntry.append('<td><textarea class="form-control comment" data-id="' + data['data'][c]['ID'] + '" style="resize: both;">' + htmlDecode(data['data'][c]['DSBKommentar']) + '</textarea></td>');
      newEntry.append('<td><div class="btn-group inline"><a class="btn" href="?id=' + data['data'][c]['ID'] + (debug ? '&debug=true' : '') + '" target="_blank"><i class="fa fa-edit"></i> Bearbeiten</a><a class="btn" href="?copy=' + data['data'][c]['ID'] + (debug ? '&debug=true' : '') + '" target="_blank"><i class="fa fa-copy"></i> Kopieren</a><button type="button" class="btn pdfdownload" data-id="' + data['data'][c]['ID'] + '" ' + (data['data'][c]['PDF'] ? '' : 'disabled') + '><i class="fa fa-file-pdf-o"></i> ' + (parseInt(data['data'][c]['Status']) === 0 ? 'Letzte abgeschlossene PDF anzeigen' : 'PDF anzeigen') + '</button><a class="btn" href="?page=dsbcheck&id=' + data['data'][c]['ID'] + '" target="_blank"><i class="fa fa-check-circle-o"></i> Grundschutz-Check</a></div> <button type="button" data-id="' + data['data'][c]['ID'] +'" data-name="' + data['data'][c]['Bezeichnung'] +'" class="btn del btn-danger"><i class="fa fa-minus"></i> Löschen</button></td>');

      if(parseInt(data['data'][c]['Status']) === 0) {
        inbTable.append(newEntry);
      }
      else {
        if(parseInt(data['data'][c]['Typ']) === 1 || parseInt(data['data'][c]['Typ']) === 3 || parseInt(data['data'][c]['Typ']) === 2) newEntry.find('.pdfdownload').closest('div').append('<button type="button" class="btn completepdf" data-id="' + data['data'][c]['ID'] + '" ' + (data['data'][c]['PDF'] ? '' : 'disabled') + '><i class="fa fa-file-pdf-o"></i> Vollständige PDF erzeugen</button>');
        abgTable.append(newEntry);
      }
    }

    // Event-Listener zum Speichern von Änderungen an den Kommentaren
    $('#abgeschlossen table, #inbearbeitung table').on('input change', 'textarea.comment', function(event) {
      let tar = $(event.target);
      let timeout = 5000;
      clearTimeout(tar.data('timer'));

      // Bei onchange direkt abspeichern
      if(event.type === 'change') {
        timeout = 0;
      }
      tar.data('timer', setTimeout(function() {
        // DOM aktualisieren
        tar[0].innerHTML = tar.val();

        // Aktuellen Wert aus dem DOM in DataTables übernehmen
        tar.closest('table').DataTable().cell(tar.closest('td')).data(tar.closest('td').html());

        setSaveLabel('saving');
        $.post(backendPath, JSON.stringify({'action':'updatecomment', 'id': tar.data('id'), 'data': { 'comment': htmlEncode(tar.val()) }, 'debug': debug})).done((data) => {
          if(!data['success']) {
            showError('Speichern des Kommentars', data['error']);
            setSaveLabel('failed');
            return;
          }
          setSaveLabel('saved');
        }).fail((jqXHR, error, errorThrown) => {
          showError('Speichern des Kommentars', false, {'jqXHR': jqXHR, 'error': error, 'errorThrown': errorThrown});
          setSaveLabel('failed');
        });
      }, timeout));
    });

    // PDF-Download ermöglichen
    $('#abgeschlossen table, #inbearbeitung table').on('click', 'button.pdfdownload', function(event) {
      getPDFFromServer($(event.target).data('id'));
    });

    $('#abgeschlossen table, #inbearbeitung table').on('click', 'button.completepdf', function(event) {
      getCompletePDF($(event.target).data('id'));
    });

    // Handler für das Löschen von Verfahren
    $('#abgeschlossen table, #inbearbeitung table').on('click', 'button.del', function() {
      var confirmed = confirm('Achtung: Von diesem Verfahren könnten andere Verfahren abhängen! Wollen Sie das Verfahren "' + $(this).data('name') + '" wirklich löschen?');
      if(confirmed) {
        deleteFromServer($(this).data('id'));
        let row = $(this).parents('tr');
        if(row.hasClass('child')) row = row.prev();
        $(this).parents('table').DataTable().row(row).remove().draw();
      }
    });

    // DataTables anpassen und initialisieren
    /**
     * Formatiert die Tabelle für den Druck um (ersetzt die Eingabefelder und Tooltips)
     * @private
     * @param {String} inner  Inneres HTML einer Tabellenzelle
     * @param {Number} rowdex Zeilennummer
     * @param {Number} coldex Spaltennummer
     * @return {String} Formatiertes HTML für den Druck
     */
    function printFormat(inner, rowdex, coldex) {
      if(coldex === 0) return htmlEncode($.parseHTML(inner)[0].textContent);
      if(coldex === 6) return htmlEncode($($.parseHTML(inner)).val());
      return inner;
    }

    /**
     * Formatiert die Tabelle für die PDF-Ausgabe um (ersetzt die Eingabefelder und Tooltips)
     * @private
     * @param {String} inner  Inneres HTML einer Tabellenzelle
     * @param {Number} rowdex Zeilennummer
     * @param {Number} coldex Spaltennummer
     * @return {String} Formatiertes HTML für den Druck
     */
    function pdfFormat(inner, rowdex, coldex) {
      if(coldex === 0 || coldex === 5) return $.parseHTML(inner)[0].textContent;
      if(coldex === 6) return $($.parseHTML(inner)).val();
      return inner;
    }

    $.extend(true, $.fn.dataTable.defaults, {
        language: {
          url: 'assets/js/datatables_german.json'
        },
        columnDefs: [
          {
            targets: 'no-sort',
            orderable: false
          },
          {
            className: 'control',
            orderable: false,
            targets:   0
          }
        ],
        responsive: {
          details: {
            type: 'column',
            target: 'td:not(:has(textarea))'
          }
        },
        autoWidth: false,
        order: [ 1, 'asc' ],
        dom: "<'row'<'col-sm-4'l><'col-sm-4 text-center'B><'col-sm-4'f>><'row'<'col-sm-12'tr>><'row'<'col-sm-5'i><'col-sm-7'p>>"
    });

    $('#abgeschlossen table').DataTable({
      buttons: [{
          extend: 'print',
          title: 'Abgeschlossene Verfahren',
          text: '<i class="fa fa-print"></i> Tabelle drucken',
          exportOptions: {
            stripHtml: false,
            columns: ':not(.no-print)',
            format: {
              body: printFormat
            }
          }
        },
        {
          extend: 'pdfHtml5',
          title: 'Abgeschlossene Verfahren',
          text: '<i class="fa fa-file-pdf-o"></i> Tabelle als PDF speichern',
          orientation: 'landscape',
          exportOptions: {
            stripHtml: false,
            columns: ':not(.no-print)',
            format: {
              body: pdfFormat
            }
          }
        }
      ]
    });
    $('#inbearbeitung table').DataTable({
      buttons: [{
          extend: 'print',
          title: 'Verfahren in Bearbeitung',
          text: '<i class="fa fa-print"></i> Tabelle drucken',
          exportOptions: {
            stripHtml: false,
            columns: ':not(.no-print)',
            format: {
              body: printFormat
            }
          }
        },
        {
          extend: 'pdfHtml5',
          title: 'Verfahren in Bearbeitung',
          text: '<i class="fa fa-file-pdf-o"></i> Tabelle als PDF speichern',
          orientation: 'landscape',
          exportOptions: {
            stripHtml: false,
            columns: ':not(.no-print)',
            format: {
              body: pdfFormat
            }
          }
        }
      ]
    });

    // Tooltips intialisieren
    $('#content').find('[data-toggle="tooltip"]').tooltip({container: 'body'});

    $('#content').find('i.revisionload').on('mouseover', (evt) => {
      let evtTarget = $(evt.target);

      if(!evtTarget.hasClass('revisionload')) return;

      evtTarget.addClass('hover');
      evtTarget.removeClass('revisionload');

      $.get(backendPath, {'action': 'listrevisions', 'debug': debug, 'id':  evtTarget.data('id')}).done((data) => {
        if(!data['success']) {
          evtTarget.prop('title', '<Fehler beim Holen der Revisionen>');
        }
        else {
          let revisions = $('<div><p>Letzte 5 Revisionen:</p><ul></ul></div>');
          let revList   = revisions.find('ul');
          for(let c=0; c < data['count'] && c < 5; c++) {
            revList.append('<li>#' + data['data'][c]['Revision'] + ' - ' + data['data'][c]['Date'] + ' - ' + data['data'][c]['Editor'] + (data['data'][c]['Comment'] !== '' ? ' - ' + data['data'][c]['Comment'] : ''));
          }
          evtTarget.prop('title', revisions[0].outerHTML);
          if(data['count'] === 0) evtTarget.prop('title', '<p>Es sind keine vorherigen Revisionen vorhanden.</p>');
        }
      }).fail((jqXHR, error, errorThrown) => {
        evtTarget.prop('title', '<Fehler beim Holen der Revisionen>');
      }).always(() => {
        evtTarget.removeClass('cursor-progress').addClass('cursor-help');
        evtTarget.tooltip({container: 'body', html: true});
        if(evtTarget.hasClass('hover')) evtTarget.tooltip('show');
      });
    });
    $('#content').find('i.revisionload').on('mouseleave', (evt) => { $(evt.target).removeClass('hover'); });

    // Tabellengröße anpassen, wenn der Tab gewechselt wird
    $('a[data-toggle="tab"]').on("shown.bs.tab", function (e) {
      $($.fn.dataTable.tables(true)).DataTable().columns.adjust().responsive.recalc();
    });

    setSaveLabel('refreshed');
  }).fail((jqXHR, error, errorThrown) => {
    showError('Abrufen der Verfahrensliste', false, {'jqXHR': jqXHR, 'error': error, 'errorThrown': errorThrown});
    setSaveLabel('none');
  }).always(() => {
    setOverlay(false);
  });
}



// Statistiken holen und anzeigen
$.get(backendPath, { 'action': 'getstats', 'debug': debug }).done((data) => {
  if(!data['success']) {
    showError('Abrufen der Statistiken', data['error']);
    return;
  }

  var newEntry = $('<tr></tr>');
  newEntry.append('<td>' + data['data']['gesamt'] + '</td>');
  newEntry.append('<td>' + data['data']['inbearbeitung'] + '</td>');
  newEntry.append('<td>' + data['data']['abgeschlossen'] + '</td>');
  newEntry.append('<td>' + data['data']['gelöscht'] + '</td>');
  newEntry.append('<td>' + data['data']['zuletztbearbeitet'] + '</td>');

  $('#statistik tbody').append(newEntry);
}).fail((jqXHR, error, errorThrown) => {
  showError('Abrufen der Statistiken', false, {'jqXHR': jqXHR, 'error': error, 'errorThrown': errorThrown});
  setSaveLabel('none');
});

// Tabellen das erste Mal befüllen
loadTables(selectedTier);

// Button für kombinierte PDF initialisieren
$('#getCombinedPDF').click(() => {getCombinedPDF();});

// Ebenen-Auswahl intialisieren
$('input[name="select_ebene"]').change(function() {
  selectedTier = parseInt($(this).val());
  loadTables(selectedTier);
});

// Timer beenden
console.timeEnd('Gesamte Vorbereitungszeit');
