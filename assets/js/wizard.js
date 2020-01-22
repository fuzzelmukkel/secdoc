/**
 * wizard.js - Funktionen für den Verfahrens-Wizard
 *
 * @file Setzt die dynamischen Funktionen der Verfahrenseingabe um und ergänzt den Wizard
 *
 * @requires assets/js/main.js
 * @requires assets/js/bootstrap-select.min.js
 * @requires assets/js/jquery.typeahead.min.js
 * @requires assets/js/jquery.validate.min.js
 * @requires assets/js/datatables.min.js
 * @requires assets/js/datatables_german.json
 *
 * @author Thorsten Küfer <thorsten.kuefer@uni-muenster.de>
 * @author Dustin Gawron <dustin.gawron@uni-muenster.de>
 * @copyright (c) 2018 Westfälische Wilhelms-Universität Münster
 * @license AGPL-3.0-or-later <https://www.gnu.org/licenses/agpl.html>
 */

// Zeitmessung starten
console.time('Gesamte Vorbereitungszeit für Wizard');

/*
 * Variablen initialisieren
 */
// Allgemeine Variablen
/**
 * Übergebene ID eines Verfahrens
 * @global
 * @type {Number}
 */
var loadId = GetURLParameter('id') === false ? 0 : parseInt(GetURLParameter('id'));

/**
 * Gibt an, ob ein Verfahren kopiert werden soll
 * @global
 * @type {Boolean}
 */
var copyId = GetURLParameter('copy') === false ? false : parseInt(GetURLParameter('copy'));

/**
 * Speichert den aktuellen Bearbeitungs-Modus (entweder IT-Verfahren oder Verarbeitungstätigkeit)
 * @global
 * @type {String}
 */
var mode = ['wizit', 'wizproc'].includes(page) ? page : 'wizproc';

/**
 * Lesbarer Name des Modus; genutzt für die Ersetzung in Texten
 * @global
 * @type {Array}
 */
var modeName = (mode === 'wizproc' ? ['Verarbeitungstätigkeit', 'Verarbeitungstätigkeiten'] : ['IT-Verfahren', 'IT-Verfahren']);

/**
 * Gibt an, ob Eingaben geändert wurden seit dem letzten Laden/Speichern
 * @global
 * @type {Boolean}
 */
var changedValues = false;

/**
 * Gibt an, ob das Verfahren als abgeschlossen markiert wurde
 * @global
 * @type {Boolean}
 */
var markedAsFinished = false;

/**
 * Sammlung von Promises für AJAX-Anfragen, die zu Beginn durchgeführt werden müssen
 * @global
 * @type {Array}
 */
var promises = [];

// Mappings
/**
 * Mapping für die Liste der TOMs
 * @global
 * @type {Array}
 */
var tomsMapping = [];

// Variablen für die Typeahead-Funktion
/**
 * Cache für die Typeahead-Funktionen
 * @global
 * @type {Object}
 */
var typeaheadCache = {};

// Variablen für die endlosen Tabellen
/**
 * Tabellen IDs für die endlosen Tabellen
 * @global
 * @type {Array}
 */
var endlessTables = $.map($('table[data-tool="endlessTable"]'), function(table) { return $(table).attr('id'); });

/**
 * Mapping von Templates für jede endlose Tabelle
 * @global
 * @type {Object}
 */
var endlessTemplates = {};

/**
 * Maping von Countern für jede endlose Tabelle
 * @global
 * @type {Object}
 */
var endlessCounts = {};

/*
 * JQuery Validator Einstellungen
 */
jQuery.extend(jQuery.validator.messages, {
    required: "Dieses Feld muss ausgefüllt werden!"
});
/* jQuery Validator funktioniert nicht bei Eingabefeldern mit gleichem name-Attribut...
jQuery.validator.addMethod("forcelistselection", function(value, element) {
  if($(element).closest('td').find('input[type=hidden]').val() === "") return false;
  return true;
}, "Es muss zwingend ein Element aus den Vorschlägen gewählt werden!");
*/
var validator = $('.wizard-card form').validate();

/*
 * Notwendige Variablen vom Server holen
 */
let tom_cache = JSON.parse(localStorage.getItem('tom_cache_' + (document.location.host + document.location.pathname).replace(/\W/g, '_')));
let currTime = new Date();

if(tom_cache && tom_cache.toms.length > 0 && parseInt(tom_cache.ttl) > currTime.getTime()) {
  console.info('Nutze TOM Liste aus Cache');
  tomsMapping = tom_cache.toms;
  tom_cache.ttl = currTime.getTime() + (1 * 60 * 60 * 1000);
  localStorage.setItem('tom_cache_' + (document.location.host + document.location.pathname).replace(/\W/g, '_'), JSON.stringify(tom_cache));

  // Prüfen, ob eigene TOMs für IT-Verfahren vorhanden
  let itTOMList = false;
  tomsMapping.some((elem) => {
    if(parseInt(elem['Mode']) === 1) {
      itTOMList = true;
      return true;
    }
  });

  if(mode === 'wizit' && itTOMList) tomsMapping = tomsMapping.filter((elem) => (parseInt(elem['Mode']) === 1));
  if(mode === 'wizproc' && itTOMList) tomsMapping = tomsMapping.filter((elem) => (parseInt(elem['Mode']) === 0));
}
else {
  promises[0] = $.getJSON(backendPath + '?action=gettoms' + (debug ? '&debug=true' : '')).done((data) => {
    if(!data['success']) {
      showError('Holen der TOMs', data['error']);
      return;
    }

    if(data['data'].length === 0) {
      showError('Holen der TOMs', 'TOM Liste ist leer!');
      return;
    }

    tomsMapping = data['data'];
    // Nach Identifier sortieren
    tomsMapping = tomsMapping.sort((a,b) =>  a.Identifier.localeCompare(b.Identifier, 'en', { numeric: true }));
    localStorage.setItem('tom_cache_' + (document.location.host + document.location.pathname).replace(/\W/g, '_'), JSON.stringify({ttl: currTime.getTime() + (1 * 60 * 60 * 1000), toms: data['data']}));

    let itTOMList = false;
    tomsMapping.some((elem) => {
      if(parseInt(elem['Mode']) === 1) {
        itTOMList = true;
        return true;
      }
    });

    if(mode === 'wizit' && itTOMList) tomsMapping = tomsMapping.filter((elem) => (parseInt(elem['Mode']) === 1));
    if(mode === 'wizproc' && itTOMList) tomsMapping = tomsMapping.filter((elem) => (parseInt(elem['Mode']) === 0));
  }).fail((jqXHR, error, errorThrown) => {
    showError('Holen der TOMs', 'HTTP Code: ' + jqXHR.status + ' Fehler: ' + error + ' - ' + errorThrown);
  });
}

/*
 * Funktionen für den BSWizard
 */
/**
 * Wird ausgeführt, wenn der Wizard gestartet wird (genutzt in {@link paper-bootstrap-wizard.js})
 * @returns {undefined}
 */
function myInit() {
  debugLog('Wizard begonnen...');
}

/**
 * Wird ausgeführt, falls ein Tab geklickt wird (genutzt in {@link paper-bootstrap-wizard.js})
 * @param {type} tab
 * @param {type} navigation
 * @param {type} index
 * @return {undefined}
 */
function myTabClick(tab, navigation, index) {
  var $valid = validator.form();
  if (!$valid) {
    validator.focusInvalid();
    return false;
  }
  return true;
}

/**
 * Wird ausgeführt, wenn der nächste Tab gewählt wird (genutzt in {@link paper-bootstrap-wizard.js})
 * @param {Object} tab
 * @param {Object} nav
 * @param {Number} idx
 * @returns {undefined}
 */
function myNext(tab, nav, idx) {
  let $valid = validator.form();
  if (!$valid) {
    validator.focusInvalid();
    return false;
  }

  debugLog('Speichere Tab ' + $(tab).text().trim());

  // Nur neu abspeichern, wenn etwas geändert wurde
  var savePromise = Promise.resolve();
  if(changedValues) {
    savePromise = saveOnServer();
  }

  if(!savePromise) {
    return false;
  }

  return true;
}

/**
 * Wird ausgeführt, wenn zum vorherigen Tab zurückgekehrt wird (genutzt in {@link paper-bootstrap-wizard.js})
 * @param {Object} tab
 * @param {Object} nav
 * @param {Number} idx
 * @returns {undefined}
 */
function myPrevious(tab, nav, idx) {
  debugLog('Abbruch von Tab ' + $(tab).text().trim());
}

/**
 * Wird ausgeführt, wenn ein Tab verlassen wird (genutzt in {@link paper-bootstrap-wizard.js})
 * @param {Object} tab
 * @param {Object} nav
 * @param {Number} idx
 * @returns {undefined}
 */
function myTabChange(tab, nav, idx) {
  debugLog('Verlasse Tab ' + $(tab).text().trim());
}

/**
 * Wird ausgeführt, wenn der Wizard mit dem letzten Button beendet wird (genutzt in {@link paper-bootstrap-wizard.js})
 * @returns {undefined}
 */
function myFinish() {
  debugLog('Wizard beendet...');
  setOverlay();
  // Nur neu abspeichern, wenn etwas geändert wurde
  var savePromise = Promise.resolve();
  if(changedValues) {
    savePromise = saveOnServer();
  }

  if(!savePromise) {
    setOverlay(false);
    return;
  }
  else {
    savePromise.then(() => {
      // Bestätigung zum Abschluss erfragen
      var confirmFinish = confirm('Wollen Sie die Dokumentation abschließen? Im Anschluss wird eine PDF-Version generiert und per E-Mail an alle eingetragenen Ansprechpartner und Ersteller verschickt.');
      if(!confirmFinish) {
        setOverlay(false);
        return;
      }

      // Zeigt eine Fehlermeldung an, wenn Datenkategorien ohne Betroffene vorhanden sind (nur bei Verarbeitungstätigkeiten)
      let currentState = saveAsObject();
      if(mode === 'wizproc' && currentState.daten_kategorien_nummer !== undefined) {
        let usedCats = new Set([]);
        if(currentState.daten_personen_kategorie !== undefined) {
          usedCats = new Set([].concat(...currentState.daten_personen_kategorie));
        }
        let knownCats = new Set([].concat(...currentState.daten_kategorien_nummer));
        if(usedCats.size !== knownCats.size) {
          let missCats = [...knownCats].filter(x => !usedCats.has(x));
          showError('Abschließen des Verfahrens', 'Es sind Datenkategorien (' + missCats.join(', ') + ') vorhanden, die keinem Betroffenen zugeordnet sind! Bitte tragen Sie die entsprechenden Betroffenen ein und verknüpfen diese oder löschen Sie die nicht benötigten Kategorien.');
          setOverlay(false);
          return;
        }
      }

      // HTML-Code für PDF-Version generieren
      var pdfCode = genHTMLforPDF();

      $.post(backendPath, JSON.stringify({'action': 'finish', 'debug': debug, 'id':  loadId, 'data': { 'title': $('[name="allgemein_bezeichnung"]').val(), 'pdfCode': pdfCode, 'lastupdate': $('[name="meta_lastupdate"]').val()} })).done((data) => {
        if(!data['success']) {
          showError('Abschließen des Verfahrens', data['error']);
          return;
        }
        markedAsFinished = true;
        modal.find('.modal-title').text('Dokumentation abgeschlossen');
        var modalBody = modal.find('.modal-body');
        modalBody.html('<p>Hiermit wurde die Dokumentation als abgeschlossen gekennzeichnet.</p>');
        if(data['genpdf'] && data['genmail']) modalBody.append('<p class="alert alert-success">Die eingetragenen Ansprechpartner wurden per E-Mail informiert und haben eine PDF-Version der Dokumentation erhalten. Die PDF wurde abgespeichert und kann über den folgenden Knopf oder jederzeit in der Liste der ' + modeName[1] + ' heruntergeladen werden.<br /><button class="center-block btn" id="download_pdf">PDF herunterladen</button></p>');
        if(mode === 'wizproc' && data['gentxt']) modalBody.append('<p class="alert alert-success">Es wurde ein Include-Baustein zur Verwendung in Webseiten bzw. Webanwendungen als Ergänzung zur zentralen Datenschutzerklärung erstellt. Sie können den passenden Text im Webserverpark mit Hilfe von SSI per <code>&lt;!--#include virtual="/sys/secdoc/' + loadId + '.txt" --&gt;</code> bzw. PHP per <code>readfile("/www/data/sys/includes/secdoc/' + loadId + '.txt")</code> einbinden.</p>');
        if(!data['genpdf']) modalBody.append('<p class="alert alert-danger">Bei der Erstellung der PDF-Datei ist ein Fehler aufgetreten, bitte versuchen Sie es später erneut.</p>');
        if(!data['genmail']) modalBody.append('<p class="alert alert-danger">Beim Verschicken der E-Mail ist ein Fehler aufgetreten, bitte versuchen Sie es später erneut.</p>');
        if(mode === 'wizproc' && !data['gentxt']) modalBody.append('<p class="alert alert-danger">Beim Erzeugen des Informations-Textes zum Einbinden in Webseiten ist ein Fehler aufgetreten, bitte versuchen Sie es später erneut.</p>');
        modalBody.append('<p>Die Dokumentation kann jederzeit aktualisiert werden und über den "Abschluss"-Knopf eine neue E-Mail sowie PDF-Datei erzeugt werden.</p>');
        modalBody.append('<p><button type="button" class="center-block btn btn-primary" data-dismiss="modal" aria-label="Close">Schließen</button></p>');

        modalBody.find('#download_pdf').click((evt) => {
          getPDFFromServer(loadId);
        });

        modal.modal();
      }).fail((jqXHR, error, errorThrown) => {
        showError('Abschließen des Verfahrens', 'HTTP Code: ' + jqXHR.status + ' Fehler: ' + error + ' - ' + errorThrown);
      }).always(() => { setOverlay(false); });
    });
  }
}

/*
 * Hilfsfunktionen
 */
/**
 * Zeigt eine Liste aller Verfahren an, auf die der Nutzer Zugriff hat
 * @param {Boolean} startup (optional) Gibt an, ob es sich um den Aufruf beim Laden der Seite handelt (wird nur geladen falls editierbare Verfahren vorhanden) oder ein manueller Aufruf
 * @returns {undefined}
 */
function showVerfahrensliste(startup = false) {
  console.time('Verfahrensliste laden');
  var show = true;
  modal.find('.modal-title').text('Liste bestehender ' + modeName[1]);
  var modalBody = modal.find('.modal-body');
  modalBody.html('<p>Wählen Sie eine Dokumentation aus der Liste, um sie zu bearbeiten oder einzusehen, oder legen Sie eine neue Dokumentation an.</p>');
  modalBody.append('<ul class="nav nav-tabs" role="tablist"><li role="presentation" class="active"><a href="#listeditable" aria-controls="listeditable" role="tab" data-toggle="tab">Editierbare ' + modeName[1] + '</a></li><li role="presentation"><a href="#listreadable" aria-controls="listreadable" role="tab" data-toggle="tab">Einsehbare ' + modeName[1] + '</a></li></ul>');
  modalBody.append('<div class="tab-content" style="min-height: auto;"><div role="tabpanel" class="tab-pane active" id="listeditable"><p style="padding-top:10px; padding-left:10px">Hier werden alle ' + modeName[1] + ' gelistet, die Sie bearbeiten können.</p></div><div role="tabpanel" class="tab-pane" id="listreadable"><p style="padding-top:10px; padding-left:10px">Hier werden alle ' + modeName[1] + ' gelistet, auf die Sie nur lesend zugreifen können.</p></div></div>');
  modalBody.find('#listeditable').append('<div class="col-sm-12 table-responsive"><table id="editableprocesses" class="table table-striped table-hover btn-table"><thead><tr><th class="no-sort no-print"></th><th>Bezeichnung</th><th>Organisationseinheit</th><th>Status</th><th>Letzter Bearbeiter</th><th>Letzte Aktualisierung</th><th class="no-sort none"></th></tr></thead><tbody></tbody></table></div>');
  modalBody.find('#listreadable').append('<div class="col-sm-12 table-responsive"><table id="readableprocesses" class="table table-striped table-hover btn-table"><thead><tr><th class="no-sort no-print"></th><th>Bezeichnung</th><th>Organisationseinheit</th><th>Status</th><th>Letzte Aktualisierung</th><th class="no-sort none"></th></tr></thead><tbody></tbody></table></div>');

  $.get(backendPath, { 'action': 'list', 'debug': debug }).done((data) => {
    if(!data['success']) {
      showError('Abrufen der Verfahrensliste', data['error']);
      return;
    }

    // Nicht anzeigen, falls keine Verfahren vorhanden
    if(startup && data['count'] === 0) {
      show = false;
      return;
    }

    for(var c=0; c < data['count']; c++) {
      if((mode === 'wizproc' && parseInt(data['data'][c]['Typ']) === 2) || (mode === 'wizit' && parseInt(data['data'][c]['Typ']) === 1)) continue;

      var currId = parseInt(data['data'][c]['ID']);
      var newEntry = $('<tr></tr>');
      data['data'][c]['Status'] = data['data'][c]['Status'] in statusMapping ? statusMapping[data['data'][c]['Status']] : statusMapping['9'];

      // Editierbare/Eigene Verfahren
      if(data['data'][c]['Editierbar'] === true) {
        newEntry.append('<td style="width: 16px;"></td>');
        newEntry.append('<td>' + data['data'][c]['Bezeichnung'] + ' <i data-toggle="tooltip" class="fa fa-info-circle" title="' + data['data'][c]['Beschreibung'] + '"></i></td>');
        newEntry.append('<td>' + data['data'][c]['Fachabteilung']  + '</td>');
        newEntry.append('<td>' + data['data'][c]['Status'] + '</td>');
        newEntry.append('<td>' + data['data'][c]['LetzterBearbeiter'] + ' <i data-toggle="tooltip" class="fa fa-info-circle" title="' + (data['data'][c]['BearbeiterDetails'] ? data['data'][c]['BearbeiterDetails'] : '<Keine Details vorhanden>') + '"></i></td>');
        newEntry.append('<td>' + data['data'][c]['Aktualisierung'] + '</td>');
        newEntry.append('<td><div class="btn-group inline"><a class="btn" href="?id=' + currId + (debug ? '&debug=true' : '') + '" target="_blank"><i class="fa fa-edit"></i> Bearbeiten</a><a class="btn" href="?copy=' + currId + '" target="_blank"><i class="fa fa-copy"></i> Kopieren</a><button type="button" title="Die PDF-Version repräsentiert das zuletzt abgeschlossene Verfahren!" data-id="' + currId + '" class="btn pdfdownload" ' + (data['data'][c]['PDF'] ? '' : 'disabled') + '>PDF anzeigen</button></div> <button type="button" data-id="' + currId +'" data-name="' + data['data'][c]['Bezeichnung'] +'" class="btn del btn-danger" ' + (data['data'][c]['Löschbar'] === true ? '' : 'disabled')  + '><i class="fa fa-minus"></i> Löschen</button></td>');
        modalBody.find('#editableprocesses tbody').append(newEntry);
      }
      else {
        newEntry.append('<td style="width: 16px;"></td>');
        newEntry.append('<td>' + data['data'][c]['Bezeichnung'] + ' <i data-toggle="tooltip" class="fa fa-info-circle" title="' + data['data'][c]['Beschreibung'] + '"></i></td>');
        newEntry.append('<td>' + data['data'][c]['Fachabteilung']  + '</td>');
        newEntry.append('<td>' + data['data'][c]['Status'] + '</td>');
        newEntry.append('<td>' + data['data'][c]['Aktualisierung'] + '</td>');
        newEntry.append('<td><div class="btn-group inline"><a class="btn" href="?id=' + currId + (debug ? '&debug=true' : '') + '" target="_blank"><i class="fa fa-edit"></i> Anzeigen</a><a class="btn" href="?copy=' + currId + '" target="_blank"><i class="fa fa-copy"></i> Kopieren</a><button type="button" data-id="' + currId + '" class="btn pdfdownload" ' + (data['data'][c]['PDF'] ? '' : 'disabled') + '>PDF anzeigen</button></div></td>');
        modalBody.find('#readableprocesses tbody').append(newEntry);
      }
    }

    // Handler für PDF-Anzeige
    modalBody.off('click', 'button.pdfdownload');
    modalBody.on('click', 'button.pdfdownload', function(event){
      getPDFFromServer($(event.target).data('id'));
    });

    // Handler für das Löschen von Verfahren
    modalBody.off('click', 'button.del');
    modalBody.on('click', 'button.del', function() {
      var confirmed = confirm('Achtung: Von diesem Verfahren könnten andere Verfahren abhängen! Wollen Sie das Verfahren "' + $(this).data('name') + '" wirklich löschen?');
      if(confirmed) {
        deleteFromServer($(this).data('id'));
        let row = $(this).parents('tr');
        if(row.hasClass('child')) row = row.prev();
        $(this).parents('table').DataTable().row(row).remove().draw();
        if(parseInt($(this).data('id')) === loadId) loadEmpty(); // Leere das geladene Verfahren nur, wenn es das gelöschte ist
      }
    });

    // Tooltips und DataTables initialisieren
    modalBody.find('[data-toggle="tooltip"]').tooltip({container: 'body'});
    modalBody.find('table').DataTable({
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
          target: 'tr'
        }
      },
      order: [ 1, 'asc' ],
      autoWidth: false
    });
  }).fail((jqXHR, error, errorThrown) => {
    showError('Abrufen der Verfahrensliste', 'HTTP Code: ' + jqXHR.status + ' Fehler: ' + error + ' - ' + errorThrown);
  }).always(() => {
    $('#showVerfahrensliste').prop('disabled', false);
    setOverlay(false);
    console.timeEnd('Verfahrensliste laden');
    if(show) {
      modalBody.append('<p><span><button type="button" class="btn loadEmpty btn-success btn-fill">Neue Dokumentation anlegen</button></span></p>');
      modalBody.find('.loadEmpty').click(function() {
        history.replaceState({}, document.title, window.location.href.split('?')[0]);
        loadEmpty();
        modal.modal('hide');
      });
      modal.modal();
    }
  });
}

/*
 * Speicher- und Ladefunktionen
 */
/**
 * Lädt ein leeres, neues Verfahren und setzt dazu alle Eingabefelder zurück
 * @returns {undefined}
 */
function loadEmpty() {
  console.time('Leeres Verfahren laden');
  setOverlay();
  loadId = 0;
  $('input[name=meta_id]').val(loadId);
  endlessTables.forEach(function(table) {
    removeTableRows(table);
  });
  $('input[type=text], textarea').not('[name$="_nummer[]"]').val('');
  $('input[type=checkbox]').prop('checked', false);
  $('.wizard-navigation li a').first().click();
  endlessTables.forEach(function(table) {
    addTableRow(table);
  });
  setSaveLabel('failed');
  setOverlay(false);
  console.timeEnd('Leeres Verfahren laden');
}

/**
 * Gibt die Eingaben in Input-Feldern als strukturierstes Objekt zurück mit den Namen als Schlüssel
 * @example { "meta_id":0, "allgemein_bezeichnung":"Test Verfahren", ... }
 * @returns {Object}
 */
function saveAsObject() {
  var output = {};
  var inputs = $('form').find('input[type!=button], textarea, select, checkbox');
  for (var inp of inputs) {
    inp = $(inp);
    var name = inp.attr('name');
    if (name === '' || name === undefined) continue;
    if (name.slice(-2) === '[]') {
      name = name.slice(0, -2);
      if (!(name in output)) output[name] = [];
      if (inp[0].type === 'checkbox') {
        output[name].push(inp.prop('checked') ? inp.val() : '0');
      }
      else if (inp[0].type === 'radio') {
        if(inp.prop('checked')) output[name].push(inp.val());
      }
      else {
        output[name].push(inp.val());
      }
    } else {
      if (inp[0].type === 'checkbox') {
        output[name] = inp.prop('checked') ? inp.val() : '0';
      }
      else if (inp[0].type === 'radio') {
        if(inp.prop('checked')) output[name] = inp.val();
      }
      else {
        output[name] = inp.val();
      }
    }
  }
  return output;
}

/**
 * Liest ein JSON-String ein und stellt die Eingaben wieder her (wenn keine passenden Felder gefunden werden, werden diese ignoriert)
 * @param {String} values JSON-String mit Namen der Eingabefelder als Schlüssel
 * @returns {undefined}
 */
function loadFromJSON(values) {
  endlessTables.forEach(function(table) {
    removeTableRows(table);
  });
  values = JSON.parse(values);

  // Fallback für fehlende TOM Kategorie Auswahlfelder
  if(Object.keys(values).filter((elem) => (elem.search('tom_toggle_') >= 0)).length === 0) {
    let tomFields = Object.keys(values).filter((elem) => (elem.search('massnahmen_') >= 0));
    tomFields.forEach((id) => {
      id = id.split('_')[1];
      if(['risiko', 'vertraulichkeit', 'integritaet', 'verfuegbarkeit'].includes(id)) return;
      let tomEntry = tomsMapping.filter((elem) => (elem.Identifier === id));
      if(tomEntry.length === 0) return;
      let targetSubcategory = ('tom_toggle_' + tomEntry[0]['Category'].trim() + '_' + (tomEntry[0]['Subcategory'].trim() ? tomEntry[0]['Subcategory'].trim() : 'all')).replace(/\W/g, '_');
      $('input[name="' + targetSubcategory + '"]:not(:checked)').prop('checked', true).trigger('change');
    });
  }

  var extendedTables = [];
  Object.keys(values).forEach(function(val, idx) {
    if(Array.isArray(values[val])) {
      var table = val.substring(0,val.lastIndexOf('_'));
      if(!extendedTables.includes(table)) {
        for(let c = 0; c < values[val].length; c++) {
          addTableRow(table);
        }
        extendedTables.push(table);
      }

      var inputs = $('#' + table).find('[name="' + val + '[]"]');

      if(inputs.length === 0) {
        debugLog('Konnte keine Eingabefelder mit Namen "' + val + '" finden! Überspringe...');
        return true;
      }

      for(let c = 0; c < values[val].length; c++) {
        if(inputs[c].type === 'checkbox') {
          if(values[val][c] !== '0') $(inputs[c]).prop('checked', true).trigger('change');
        }
        else if(inputs[c].type === 'radio') {
          let fieldsPerValue = inputs.length / values[val].length;
          for(let d = 0; d < fieldsPerValue; d++) {
            if(inputs[c * fieldsPerValue + d].value === values[val][c]) $(inputs[c * fieldsPerValue + d]).prop('checked', true).trigger('change');
          }
        }
        else {
          if(!Array.isArray(values[val][c])) values[val][c] = htmlDecode(values[val][c]);
          $(inputs[c]).val(values[val][c]).trigger('change');
        }
      }
    }
    else {
      var inp = $('[name="' + val + '"]');
      if(inp.length === 1) {
        if(inp[0].type === 'checkbox') {
          if(values[val] !== '0') inp.prop('checked', true).trigger('change');
        }
        else {
          if(!Array.isArray(values[val])) values[val] = htmlDecode(values[val]);
          inp.val(values[val]);
        }
      }
      else if(inp.length > 1 && inp[0].type === 'radio') {
        for(let c = 0; c < inp.length; c++) {
          if(inp[c].value === values[val]) $(inp[c]).prop('checked', true).trigger('change');
        }
      }
      else {
        debugLog('Keine passenden oder mehrere Eingabefelder mit Namen "' + val + '" gefunden! Überspringe...');
      }
    }
  });
  $('select.selectpicker, select[data-tool=selectpicker]').selectpicker('refresh');
  $('select.selectpicker, select[data-tool=selectpicker]').selectpicker('render');
}

/**
 * Sendet die aktuellen Eingaben an den Server und versucht diese abzuspeichern
 * @returns {Promise|Boolean} Sollte das Formular fehlende Elemente enhalten oder das Speichern abgelehnt werden false, sonst das Promise-Objekt der Ajax-Anfrage
 */
function saveOnServer() {
  setSaveLabel('saving');
  var idField = $('input[name=meta_id]');
  var currentState = saveAsObject();

  // Zeigt eine Fehlermeldung an, falls notwendige Felder leer sind
  if(!validator.form()) {
    setSaveLabel('failed');
    var errorList = $('<ul></ul>');
    $(validator.toShow).each(function() {
      errorList.append('<li>' + $(this).closest('.form-group').find('label').first().text().trim() + '</li>');
    });
    validator.focusInvalid();
    showError('Speichern der Dokumentation', 'Es wurden nicht alle notwendigen Felder ausgefüllt:' + errorList[0].outerHTML);
    return false;
  }

  // Zeigt eine Fehlermeldung an, wenn für die Zugriffsberechtigungen manuelle Eingaben genommen wurden
  let foundInvalidHidden = false;
  $('input[name="meta_gruppen_kennung[]"], input[name="meta_nutzer_kennung[]"]').each(function() {
    if($(this).val() === '' && $(this).parent().find('input[name="meta_gruppen_name[]"], input[name="meta_nutzer_name[]"]').val() !== '') foundInvalidHidden = true;
  });

  if(foundInvalidHidden) {
    setSaveLabel('failed');
    showError('Speichern der Dokumentation', 'Es wurden nicht alle Gruppen- bzw. Nutzerkennungen für die Zugriffsberechtigungen korrekt ausgewählt! Bitte überprüfen Sie die Eingaben und nutzen Sie nur Vorschläge aus der Liste.');
    return false;
  }

  // Falls ID == 0 wird ein neues Verfahren auf dem Server angelegt
  if(!loadId) {
    return $.post(backendPath, JSON.stringify({'action':'create', 'debug': debug, 'data': currentState})).done(function(data) {
      if(data['success']) {
        loadId = parseInt(data['data']['ID']);
        idField.val(loadId);
        history.replaceState({}, document.title, window.location.href.split('?')[0] + '?id=' + loadId);
        setSaveLabel('saved', new Date(data['data']['Date']));
        changedValues = false;
      }
      else {
        showError('Anlegen der Dokumentation', data['error']);
        setSaveLabel('failed');
      }
    }).fail((jqXHR, error, errorThrown) => {
      showError('Anlegen der Dokumentation', 'HTTP Code: ' + jqXHR.status + ' Fehler: ' + error + ' - ' + errorThrown);
      setSaveLabel('failed');
    });
  }
  // Falls die ID != 0 ist, wird ein vorhandenes Verfahren aktualisiert
  else {
    // Erfragt eine Bestätigung, falls das Verfahren bereits im Betrieb sein sollte
    if(markedAsFinished) {
      var confirmSave = confirm('Wenn Sie die aktuellen Änderungen abspeichern, wird der Status auf "In Bearbeitung" zurückgesetzt. Wollen Sie wirklich fortfahren?');
      if(!confirmSave) {
        setSaveLabel('failed');
        return false;
      }
    }

    return $.post(backendPath, JSON.stringify({'action':'update', 'debug': debug, 'id': loadId, 'data': currentState})).done(function(data) {
      if(!data['success']) {
        showError('Speichern der Dokumentation', data['error']);
        setSaveLabel('failed');
      }
      else {
        setSaveLabel('saved', new Date(data['data']['Date'].replace(' ', 'T')));  // Safari benötigt das Format YYYY-MM-DDTHH:MM:SS (mit T)
        history.replaceState({}, document.title, window.location.href.split('?')[0] + '?id=' + loadId);
        changedValues = false;

        // Hinweis anzeigen, falls Status zurückgesetzt wurde
        if(markedAsFinished) {
          modal.find('.modal-title').text('Status zurückgesetzt');
          modal.find('.modal-body').html('<p>' + (mode === 'wizproc' ? 'Die Verarbeitungstätigkeit' : 'Das IT-Verfahren') + ' wurde zurück auf "In Bearbeitung" gesetzt und muss erneut abgeschlossen werden, um erneut als "In Betrieb" gekennzeichnet zu werden.</p>');
          modal.find('.modal-body').append('<p><button type="button" class="center-block btn btn-primary" data-dismiss="modal" aria-label="Close">Schließen</button></p>');
          modal.modal();
          markedAsFinished = false;
        }
      }
    }).fail((jqXHR, error, errorThrown) => {
      showError('Speichern der Dokumentation', 'HTTP Code: ' + jqXHR.status + ' Fehler: ' + error + ' - ' + errorThrown);
      setSaveLabel('failed');
    });
  }
}

/**
 * Fragt ein Verfahren am Server an und läd es in die Vorlage
 * @param {Number} id Eindeutige ID des Verfahrens
 * @returns {undefined}
 */
function loadFromServer(id) {
  console.time('Verfahren laden');
  setOverlay();
  $.post(backendPath, JSON.stringify({'action':'get', 'id': id, 'debug': debug})).done(function(data) {
    if(data['success']) {
      if(!data['data'][0]['JSON']) {
        loadId = false;
        showError('Laden der Dokumentation', 'Kein JSON-Inhalt zum Laden verfügbar!');
        return;
      }
      loadFromJSON(data['data'][0]['JSON']);
      markedAsFinished = (parseInt(data['data'][0]['Status']) === 2);
      loadId = parseInt(data['data'][0]['ID']);
      $('input[name="meta_id"]').val(loadId);

      if(!data['data'][0]['Editierbar']) {
        $('input, textarea, select, button[id!="showVerfahrensliste"]').prop('disabled', true);
      }

      lastSaveDate = data['data'][0]['Aktualisierung'];
      if(!lastSaveDate) {
        let currDate = new Date();
        lastSaveDate = currDate.toISOString();
      }

      $('input[name="meta_lastupdate"]').val(lastSaveDate);
      setSaveLabel('saved', new Date(lastSaveDate.replace(' ', 'T')));  // Safari benötigt das Format YYYY-MM-DDTHH:MM:SS (mit T)

      document.title = data['data'][0]['Bezeichnung'] + ' - ' + document.title.split(' - ').slice(-1)[0];
      changedValues = false;

      // Abhängigkeiten bei IT-Verfahren anzeigen
      if(mode === 'wizit') {
        $('#abschluss_vonabhaengig tbody tr').remove();
        $.get(backendPath, { 'action': 'dependencies', 'id':  loadId, 'debug': debug}).done(function(data) {
          if(!data['success']) {
            console.error('Fehler beim Abruf der abhängigen Verfahren! Fehler: ' + data['error']);
            return;
          }

          data['data'].forEach(dependant => {
            $('#abschluss_vonabhaengig tbody').append('<tr><td>' + htmlDecode(dependant['name']) + '</td><td>' + (dependant['type'] === 2 ? 'IT-Verfahren' : 'Verarbeitungstätigkeit') + '</td><td><a class="btn" href="?id=' + dependant['id'] + '" target="_blank">Anzeigen</a></td></tr>');
          });
        }).fail((jqXHR, error, errorThrown) => {
          console.error('Fehler beim Abruf von abhängigen Verfahren! HTTP Code: ' + jqXHR.status + ' Fehler: ' + error + ' - ' + errorThrown);
        });
      }
    }
    else {
      loadId = 0;
      showError('Laden der Dokumentation', data['error']);
    }
  }).fail((jqXHR, error, errorThrown) => {
    loadId = false;
    showError('Laden der Dokumentation', 'HTTP Code: ' + jqXHR.status + ' Fehler: ' + error + ' - ' + errorThrown);
  }).always(() => { setOverlay(false); console.timeEnd('Verfahren laden'); });
}

/**
 * Kopiert den Inhalt eines Verfahrens in ein neues Verfahren
 * @param {type} id Eindeutige ID des Verfahrens
 * @returns {undefined}
 */
function copyFromServer(id) {
  console.time('Verfahren kopieren');
  setOverlay();
  $.post(backendPath, JSON.stringify({'action':'get', 'id': id, 'debug': debug})).done(function(data) {
    if(data['success']) {
      setSaveLabel('failed');
      loadFromJSON(data['data'][0]['JSON']);
      loadId = 0;
      $('input[name=meta_id]').val(loadId);
      $('input[name=allgemein_bezeichnung]').val('[Kopie] ' + $('input[name=allgemein_bezeichnung]').val()); /* Kopie vor Bezeichnung setzen */
      history.replaceState({}, document.title, window.location.href.split('?')[0]);
      changedValues = true;
    }
    else {
      showError('Kopieren der Dokumentation', data['error']);
    }
  }).fail((jqXHR, error, errorThrown) => {
    showError('Kopieren der Dokumentation', 'HTTP Code: ' + jqXHR.status + ' Fehler: ' + error + ' - ' + errorThrown);
  }).always(() => { setOverlay(false); console.timeEnd('Verfahren kopieren'); });
}

/**
 * Generiert den HTML-Code-Auschnitt für die PDF-Generierung
 * @returns {String} HTML-Code
 */
function genHTMLforPDF() {
  console.time('HTML-Code-Generierung für PDF');

  /* Alle leeren Tabellenzeilen entfernen */
  endlessTables.forEach(function(table) {
    removeTableRows(table, true);
  });

  var toSend = $('<div></div>');

  /* Überschrift */
  toSend.append('<h2 class="text-center">Dokumentation ' + ( mode === 'wizproc' ? 'der Verarbeitungstätigkeit' : 'des IT-Verfahrens' ) + '</h2>');
  toSend.append('<h3 class="text-center">' + htmlEncode($('[name="allgemein_bezeichnung"]').val()) + '</h3>');
  toSend.append('<h4 class="pull-left" style="color: darkgray;">Letzte Aktualisierung: ' + $('#saveTime').text() + '</h4>');
  toSend.append('<h4 class="pull-right" style="color: darkgray;">Lfd. Nr.: ' + loadId + '</h4>');

  /* Daten aus Wizard einsammeln */
  $('#content').children('.tab-content').children('.tab-pane').each(function(idx) {
    toSend.append($(this).clone().addClass('active'));
  });

  /* Maßnahmen Eingabefelder aus Bootstrap-Accordion holen
  toSend.find('textarea[name="massnahmen_vertraulichkeit"], textarea[name="massnahmen_integritaet"], textarea[name="massnahmen_verfuegbarkeit"]').each(function() {
    $(this).closest('.printHide').before($(this));
  });
  */

  /* TOM Liste formatieren */
  toSend.find('#technicaltoms, #organizationaltoms').find('.panel-collapse').each(function() {
    if($(this).closest('.panel').hasClass('hidden')) {
      $(this).closest('.panel').prev('h6').remove();
      $(this).remove();
      return;
    }

    $(this).removeClass('collapse');
    $(this).closest('.panel').before($(this));
  });

  /* Nur TOMs in der PDF anzeigen, die dem Risiko entsprechen */
  let currRiskLevel = parseInt($('[name="massnahmen_risiko"]:checked').val());
  toSend.find('#technicaltoms, #organizationaltoms').find('tr').each(function() {
    if(parseInt($(this).data('risk')) > currRiskLevel) $(this).remove();
  });

  /* Link hinzufügen */
  var link = window.location.href.split('?')[0].replace(/x?sso/i, 'www') + '?id=' + loadId;
  toSend.append('<div class="text-center"><h5 class="info-text text-ul">Dokumentation online einsehen</h5><p><a href="' + link + '">' + link + '</a></p></div>');

  /* Layout-Anpassungen (Buttons durch Text ersetzen, Typeahead und andere aktive Elemente entschärfen) */
  toSend.find('select[data-tool="selectpicker"], select.selectpicker, [id$="_add"], .typeahead__cancel-button, .typeahead__hint, .typeahead__result').remove();
  toSend.find('table[data-tool="endlessTable"] tr').each(function(idx) {
    $(this).find('th:last, td:last').remove();
  });
  toSend.find('table[data-tool="endlessTable"]').each(function(idx){
    var tbl = $(this);
    if(tbl.find('tr').length < 2) {
      tbl.parent().prev().remove();
      tbl.parent().remove();
    }
  });

  /* HTML in Eingabefeldern entschärfen */
  toSend.find('input, textarea').each(function(idx){
    $(this).val(htmlEncode($(this).val()));
  });

  /* Eingabeelemente durch grau hinterlegten Text ersetzen */
  toSend.find('input[type!=checkbox][type!=hidden][type!=radio], textarea, select').replaceWith(function() { if($(this).parents('td').length>0) { return '<p>' + $(this).val() + '</p>'; } else { return '<p style="background-color: lightyellow">' + $(this).val() + '</p>'; }});

  /* Radio-Elemente formatieren */
  toSend.find('input[type=radio]:not(:checked)').closest('label').remove();
  toSend.find('input[type=radio]').remove();

  /* Weitere Design-Anpassunge */
  toSend.find('.printHide').addClass('hidden');
  toSend.find('.printOnly').removeClass('hidden');
  toSend.find('h5').addClass('text-center');
  toSend.find('table, td, th').attr('style', 'border: 1px solid darkgray; padding: 5px;');
  toSend.find('th').css('background-color', 'lightgray');
  //toSend.find('#systeme_klienten, #systeme_server').find('label').attr('style', 'font-style: italic;');  // funktioniert nicht
  toSend.find('#systeme_klienten, #systeme_server').find('label').replaceWith(function() { return '<span style="font-style: italic; text-decoration: underline">' + $(this).text() + '</span>'; });
  toSend.find('input[type=checkbox]').each(function(idx) {
    var checkbox = $(this);

    checkbox.parent().parent().attr('style', 'margin: 5px;');
    if(checkbox.prop('checked')) checkbox.replaceWith('<span style="color: green;">&#10004;</span>');
    //else checkbox.replaceWith('<span style="color: red;">&#10006;</span>');
    else {
      if(checkbox.attr('name').search(/massnahmen/g) > -1) {
        checkbox.replaceWith('<span style="color: red;">&#10006;</span>');
        return;
      }

      if(checkbox.attr('name') === 'abschluss_datenschutz_folgeabschaetzung') {
        checkbox.parent().replaceWith('<label><span style="color: red;">&#10006;</span> Es ist keine Datenschutzfolgeabschätzung notwendig</label>');
        return;
      }

      checkbox.parent().parent().addClass('hidden');

      if(['allgemein_verantwortlich_extern'].includes(checkbox.attr('name'))) {
        checkbox.closest('div').prev().addClass('hidden');
      }
    }
  });

  /* Ergebnis-HTML für mpdf holen */
  var htmlCode = toSend[0].outerHTML;

  console.timeEnd('HTML-Code-Generierung für PDF');
  return htmlCode;
}

/*
 * Typeahead Funktionen
 */
/**
 * Initialisiert das Typeahead-Plugin auf dem Element node
 * @param {Object} node DOM-Element oder jQuery-Objekt
 * @returns {null|Object}
 */
function initTypeahead(node) {
  node = $(node);
  var nodeData = node.data();
  var newTypeahead = null;
  var forceSelectError = 'Es muss zwingend ein Eintrag aus den Vorschlägen gewählt werden!';

  // Überprüfen, ob Typeahead auf dem Element nicht schon initialisiert wurde
  if(nodeData['typeahead']) {
    return null;
  }

  // Überprüft ob eine explizite URL gegeben ist, sonst wird die hinterlegte verwaltung.php genutzt
  if(nodeData['url'] === undefined) {
    nodeData['url'] = backendPath + '?action=' + nodeData['action'] + (debug ? '&debug=true' : '') + '&search=';
    if(nodeData['path'] === undefined) nodeData['path'] = 'data';
  }
  else {
    if(nodeData['path'] === undefined) nodeData['path'] = '';
  }

  // Fügt einen onChange-Listener an, damit das versteckte Feld geleert wird bei Änderung
  if(nodeData['hiddenfield']) {
    node.change(function() {
      $(this).closest('.typeahead__container').parent().find('input[name="' + nodeData['hiddenfield'] + '"]').val('').trigger('change');
    });

    if(nodeData['mustselectitem']) {
      $(node).parent().find('input[name="' + nodeData['hiddenfield'] + '"]').change(function(evt) {
        if($(evt.target).val() === "") {
          $(node).addClass('customError');
          if($(node).closest('.typeahead__container').parent().find('span.error').length === 0) $(node).closest('.typeahead__container').after('<span class="error">' + forceSelectError + '</span>');
        }
        else {
          $(node).removeClass('customError');
          $(node).closest('.typeahead__container').parent().find('span.error').remove();
        }
      });
    }
  }

  // Fügt die notwendigen Element um das Input-Element herum ein
  node.prop('autocomplete', 'off');
  node.wrap('<div class="typeahead__container"><div class="typeahead__field"><span class="typeahead__query"></span></div></div>');
  node.data('typeahead', 1);

  /**
   * Eigene Filterfunktion für Typeahead zur Filterung nach mehreren getrennten Suchbegriffen (durchsucht alle im JSON vorhandenen Felder)
   * @private
   * @param {Object} item       Aktuelles Element
   * @param {String} displayKey Anzuzeigender Schlüssel
   * @returns {undefined|Boolean} True, wenn das Element in der Auswahl auftauchen soll, undefined wenn nicht
   */
  function customFilter(item, displayKey) {
    var lowcaseQuery = this.query.toLowerCase().trim();
    var itemKeys = Object.keys(item);
    var split = lowcaseQuery.split(' ');
    var found = undefined;
    for(let c=0; c < itemKeys.length; c++) {
      if(item[itemKeys[c]] !== null && item[itemKeys[c]].toLowerCase().search(lowcaseQuery.replace(/[.*+?^${}()|[\]\\]/g, '\\$&')) > -1) {
        found = true;
        break;
      }
    }

    if(found) {
      return true;
    }
    else if(split.length > 1) {
      found = true;
      for(let c=0; c < split.length; c++) {
        var foundinKeys = false;
        for(let k=0; k < itemKeys.length; k++) {
          if(item[itemKeys[k]].toLowerCase().search(split[c].replace(/[.*+?^${}()|[\]\\]/g, '\\$&')) > -1) {
            foundinKeys = true;
            break;
          }
        }
        if(!foundinKeys) {
          found = undefined;
          break;
        }
      }
      return found;
    }
    return undefined;
  };

  /**
   * Sortiert die Auswahlmöglichkeiten in Typeahead nach der Position des ersten Suchbegriffs
   * @private
   * @param {Object} node  Typeahead-Node
   * @param {array}  data  Zu sortierende Daten
   * @param {String} group Anzeigegruppe
   * @param {String} path  Pfad zum Label
   * @returns {array} Sortierte/Modifizierte Elemente zur Anzeige
   */
  function onPopulateSourceCustom(node, data, group, path) {
    var search = this.query.trim().split(' ')[0].toLowerCase();
    data.sort((a,b) => {
        var foundA = a['label'].toLowerCase().search(search.replace(/[.*+?^${}()|[\]\\]/g, '\\$&'));
        var foundB = b['label'].toLowerCase().search(search.replace(/[.*+?^${}()|[\]\\]/g, '\\$&'));
        if(foundA === -1) foundA = 200;
        if(foundB === -1) foundB = 200;
        if(foundA !== foundB) return foundA - foundB;
        else return a['label'].toLowerCase().localeCompare(b['label'].toLowerCase());
      });
    return data;
  };

  newTypeahead = node.typeahead({
    dynamic: (nodeData['dynamic'] === true ? true : false),
    delay: (nodeData['dynamic'] === true ? 1000 : 100),
    searchOnFocus: true,
    minLength: nodeData['minlength'] !== undefined ? nodeData['minlength'] : 3,
    maxItem: nodeData['maxitem'] || 25,
    order: nodeData['order'] || null,
    hint: true,
    cancelButton: true,
    display: nodeData['display'] || 'label',
    cache: (nodeData['dynamic'] === true ? false : (nodeData['cache'] !== undefined ? nodeData['cache'] : true)),
    filter: customFilter,
    source: ((nodeData['dynamic'] === true) ?
      { // Dynamische Datenabfrage
        ajax: function(query) {
          return {
            url: nodeData['url'] + query,
            dataType: 'json',
            path: nodeData['path']
          }
        }
        /*
        data: function() {
          if(!typeaheadCache[nodeData['url']]) {
            typeaheadCache[nodeData['url']] = {};
          }

          var query = this.query.toLowerCase();
          if(query === '') query = '<empty>';

          // Falls der Cache ausgeschaltet ist, wird nur die leere Suche gespeichert (Damit die eigene Kennung zumindest gecached wird)
          if(nodeData['cache'] === false && query !== '<empty>') {
            var temp = $.getJSON(nodeData['url'] + this.query);
            temp.path = 'data';
            return temp;
          }
          else {
            // Durchsucht den Cache nach Teilausdrücken (wenn die Anfrage 'test' bereits gecached ist, ist auch bereits das Ergebnis für 'test1' vorhanden)
            var qfound = false;
            for(var qlen = query.length; qlen >= this.options.minLength && !qfound; qlen--) {
              var qpart = query.slice(0,qlen);
              if(qpart in typeaheadCache[nodeData['url']]) qfound = qpart;
            }

            if(qfound) {
              var json = typeaheadCache[nodeData['url']][qfound].responseJSON;
              return json;
            }
            else {
              var temp = $.getJSON(nodeData['url'] + this.query);
              typeaheadCache[nodeData['url']][query] = temp;
              return temp;
            }
          }
        }*/
      } :
      { // Einmal alle Daten holen und dann cachen lassen
        [nodeData['url'] + '_' + nodeData['path']]: {
          data: [{"label": "-- keine --"}],
          ajax: {
            type: 'GET',
            url: nodeData['url'],
            path: nodeData['path']
          }
        }
      }
    ),
    callback: {
      onPopulateSource: ((nodeData['dynamic'] === true) ? onPopulateSourceCustom : null),
      onClick: function(node, a, item, even) {
      },
      onClickAfter: function(node, a, item, event) {
        $(node).trigger('change');
        if(nodeData['hiddenfield']) {
          $(node).closest('.typeahead__container').parent().find('input[name="' + nodeData['hiddenfield'] + '"]').val(item.value).trigger('change');
        }
      },
      onCancel: function(node, a, item, event) {
        $(node).trigger('change');
        if(nodeData['hiddenfield']) {
          $(node).closest('.typeahead__container').parent().find('input[name="' + nodeData['hiddenfield'] + '"]').val('').trigger('change');
        }
      },
      onSubmit: function(node, form, item, event) {
        event.preventDefault();
      },
      onSearch:  function(node, query) {
        $('.typeahead__list').remove();
      }
    }
  });

  node.focus(function(evt) {
    $('.typeahead__container').each(function(idx, elem) {
      if($(elem).find('input[name="' + evt.target.name + '"]').length > 0) return;
      $(elem).find('.typeahead__list').remove();
    });
  });

  return newTypeahead;
}


/*
 * Funktionen für die endlosen Tabellen
 */
/**
 * Initialisiert die endlosen Tabellen (nutzt die globale Variablen 'endlessTables', 'endlessTemplates' und 'endlessCounts')
 * @return {undefined}
 */
function initEndlessTables() {
  endlessTables.forEach(function(table) {
    endlessTemplates[table] = $('#' + table + ' tbody tr').clone(true);
    endlessCounts[table] = 0;
    $('#' + table + ' tbody tr').detach();

    $('#' + table + '_add').click(function() {
      addTableRow(table);
    });

    addTableRow(table);
  });
}

/**
 * Fügt eine Zeile in einer endlosen Tabelle hinzu (nutzt die globale Variablen 'endlessTables', 'endlessTemplates' und 'endlessCounts')
 * @param {String} table Eindeutiger Tabellenname (DOM Element ID)
 * @returns {undefined}
 */
function addTableRow(table) {
  if(!(table in endlessTemplates)) {
    console.error('Tabelle "' + table + '" nicht gefunden! Überspringe...');
    return;
  }
  // Neue Zeile aus dem Template hinzufügen
  endlessCounts[table]++;
  var clone = endlessTemplates[table].clone(true);
  $('#' + table + ' tbody').append(clone);

  // Focus auf das erste Eingabefeld nach der Nummerierung setzen
  clone.children('td:nth-child(2)').children('input[type=text], textarea').first().focus();

  // Bootstrap Select initialisieren
  clone.find('select[data-tool="selectpicker"]').selectpicker({
    iconBase: 'fa',
    tickIcon: 'fa-check',
    noneSelectedText: 'Bitte auswählen',
    actionsBox: true,
    deselectAllText: 'Keine',
    selectAllText: 'Alle'
  });

  // Typeahead initialisieren
  clone.find('input[data-tool="typeahead"]').each(function(key, value) {
    initTypeahead(value);
  });

  // Fall 1: Die aktuelle Tabelle wird nicht automatisch durchnummeriert
  if(clone.find('input[name="' + table + '_nummer[]"]').length !== 1) {
    // Delete Funktion an den neuen Button binden
    clone.find('.' + table + '_del').click(function() {
      $(this).parents('tr').detach();
      endlessCounts[table]--;
    });
  }
  // Fall 2: Die aktuelle Tabelle wird automatisch nummeriert
  else {
    // Nummerierung anpassen
    var rowNum = endlessCounts[table];
    clone.find('input[name="' + table + '_nummer[]"]').val(rowNum);

    // Neue Reihe als Option zu nutzenden Auswahlfeldern hinzufügen
    var newOpt = '<option value="' + rowNum + '">' + rowNum + '</option>';
    $('select.nutzt_' + table + '_nummer').append(newOpt);
    endlessTables.forEach(function(tempTable) {
      $(endlessTemplates[tempTable]).find('select.nutzt_' + table + '_nummer').append(newOpt); // Templates aktualisieren
    });

    if(rowNum > 1) {
      $('select.nutzt_' + table + '_nummer').selectpicker('refresh');
    }

    // Eingaben in das erste Eingabefeld werden in den Optionen als Hilfe angezeigt
    clone.children('td:nth-child(2)').find('input[type=text], textarea').first().change(function() {
      var currVal = $(this).val();
      var currNum = $(this).closest('tr').find('input[name="' + table + '_nummer[]"]').val();

      $('select.nutzt_' + table + '_nummer option[value="' + currNum + '"]').text(currNum + ' - ' + currVal);
      endlessTables.forEach(function(tempTable) {
        $(endlessTemplates[tempTable]).find('select.nutzt_' + table + '_nummer option[value="' + currNum + '"]').text(currNum + ' - ' + currVal); // Templates aktualisieren
      });

      // Selectpicker aktualisieren
      $('select.nutzt_' + table + '_nummer').selectpicker('refresh');
    });

    // Delete Funktion an den neuen Button binden
    clone.find('.' + table + '_del').click(function(evt, force = false) {
      var currNum = parseInt($(this).closest('tr').find('input[name="' + table + '_nummer[]"]').val());
      var usedIn = $('select.nutzt_' + table + '_nummer option[value=' + currNum + ']:selected').closest('table');

      // Sollte die zu löschende Zeile noch referenziert werden, wird eine Bestätigung erfragt
      if(usedIn.length > 0 && !force) {
        let usedInTitles = [];
        let confirmed = false;

        usedIn.each(function() {
          usedInTitles.push($(this).closest('div').prevAll().find('h5, h6').last().text());
        });

        confirmed = confirm('Achtung: Dieser Eintrag wird noch in anderen Tabellen referenziert (' + usedInTitles.join(', ') + '). Sind Sie sich sicher, dass die Referenzen gelöscht werden sollen?');
        if(!confirmed) return;
      }

      $('select.nutzt_' + table + '_nummer option[value=' + currNum + ']').detach();
      endlessTables.forEach(function(tempTable) {
        $(endlessTemplates[tempTable]).find('select.nutzt_' + table + '_nummer option[value=' + currNum + ']').detach(); // Zeile in den Optionen der Templates, die sie nutzen, löschen
      });

      // Nummerierung aller folgenden Tabellenzeilen anpassen
      var rows = $(this).closest('tbody').find('tr');
      for(var c = currNum; c < endlessCounts[table]; c++) {
        $(rows[c]).find('input[name="' + table + '_nummer[]"]').val(c);
        var currLabel = $(rows[c]).children('td:nth-child(2)').find('input[type=text], textarea').first().val();
        $('select.nutzt_' + table + '_nummer option[value=' + (c+1) + ']').val(c).text(c + ' - ' + currLabel);
        endlessTables.forEach(function(tempTable) {
          $(endlessTemplates[tempTable]).find('select.nutzt_' + table + '_nummer option[value=' + (c+1) + ']').val(c).html(c + ' - ' + currLabel);
        });
      }

      // Selectpicker aktualisieren
      $('select.nutzt_' + table + '_nummer').selectpicker('refresh');

      // Zeile wird entfernt
      endlessCounts[table]--;
      $(this).parents('tr').detach();
    });
  }
}

/**
 * Entfernt alle Reihen einer endlosen Tabelle (nutzt die globale Variablen 'endlessTables', 'endlessTemplates' und 'endlessCounts')
 * @param {String}  table     Eindeutiger Tabellenname (DOM Element ID)
 * @param {Boolean} onlyEmpty (optional) Entfernt nur leere Zeilen, wenn true
 * @returns {undefined}
 */
function removeTableRows(table, onlyEmpty = false) {
  if(onlyEmpty) {
    $('#' + table + ' tbody tr').filter(function() {
      var emptyRow = true;
      $(this).find('input[type!=button][type!=checkbox][type!=hidden][type!=number], textarea, select[class$="_nummer"]').each(function() {
        var jqThis = $(this);
        var thisVal = jqThis.val();
        if(!jqThis.prop("readonly") && !jqThis.prop("disabled") && thisVal.length > 0) {
          emptyRow = false;
          return false;
        }
      });
      return emptyRow;
    }).each(function() {
      $(this).find('.' + table + '_del').trigger('click', ['true']);
    });
  }
  else {
    $('#' + table + ' tbody tr').each(function() {
      $(this).find('.' + table + '_del').trigger('click', ['true']);
    });
  }
}

/**
 * Legt die Auswahlliste für TOMs an
 * @return {undefined}
 */
function generateTOMList() {
  let toggleHeading = $('#toggletoms > ul').first();
  let toggleTab = $('#toggletoms > div').first();
  let tempTOMs = tomsMapping.slice();

  tempTOMs.sort((a, b) => (a.Category + ' - ' + a.Subcategory).localeCompare(b.Category + ' - ' + b.Subcategory));

  tempTOMs.forEach(function(row) {
    // Auswahlliste für Kategorien erstellen
    let targetToggleCategory = ('tom_toggle_' + row['Category'].trim()).replace(/\W/g, '_');

    if($('#' + targetToggleCategory).length !== 1) {
      toggleHeading.append('<li role="presentation"><a href="#' + targetToggleCategory + '" aria-controls="technical" role="tab" data-toggle="tab">' + row['Category'].trim() + '</a></li>');
      toggleTab.append('<div role="tabpanel" class="tab-pane" id="' + targetToggleCategory + '"></div>');
      $('#' + targetToggleCategory).append('<div class="checkbox"><label><input type="checkbox" data-category="' + row['Category'] + '" data-subcategory="' + row['Subcategory'] + '" data-target="tom_category_' + row['Category'].trim().replace(/\W/g, '_') + '" name="' + targetToggleCategory + '_all" value="1">Gesamte Kategorie</label></div>');
    }

    if(row['Subcategory'].trim() !== '') {
      let targetSubcategory = ('tom_toggle_' + row['Category'].trim() + '_' + row['Subcategory'].trim()).replace(/\W/g, '_');

      if($('input[name="' + targetSubcategory + '"]').length !== 1) {
        $('#' + targetToggleCategory).append('<div class="checkbox"><label><input type="checkbox" data-category="' + row['Category'] + '" data-subcategory="' + row['Subcategory'] + '" data-target="tom_category_' + (row['Category'].trim() + ' - ' + row['Subcategory'].trim()).replace(/\W/g, '_') + '" name="' + targetSubcategory + '" value="1">' + row['Subcategory'].trim() + '</label></div>');
        $('#' + targetToggleCategory).find('input[name="' + targetToggleCategory + '_all"]').closest('div').detach();
      }
    }
  });

  // Ersten Tab der Auswahlliste auf aktiv setzen
  toggleHeading.find('li').first().addClass('active');
  toggleTab.find('div').first().addClass('active');

  // Listener für toggleTOMList()
  toggleTab.find('input[type="checkbox"]').change((evt) => { toggleTOMList(evt); });
}

/**
 * Filtert die Liste der TOMs anhand des gewählten Risikolevels
 * @param  {Number} risklevel Risikolevel des Verfahrens
 * @return {undefined}
 */
function filterTOMList(risklevel) {
  let tomRows = $('#technical_accordion, #organizational_accordion').find('tbody tr');
  tomRows.each(function() {
    let tomRisklevel = parseInt($(this).data('risk'));
    if(tomRisklevel <= risklevel) $(this).removeClass('hidden');
    if(tomRisklevel > risklevel) $(this).addClass('hidden');
  });

  $('#technical_accordion, #organizational_accordion').find('div.panel').each((idx, elem) => {
    $(elem).removeClass('hidden');

    if($(elem).find('tbody tr:not(.hidden)').length === 0) $(elem).addClass('hidden');
  });
}

/**
 * Übernimmt das Ein- und Ausblenden von TOMs nach Kategorien.
 * @return {undefined}
 */
function toggleTOMList(evt) {
  let evtTarget = $(evt.target);
  let toggleCategory = evtTarget.data('category');
  let toggleSubcategory = evtTarget.data('subcategory');

  if(evtTarget[0].checked) {
    tomsMapping.forEach(function(row) {
      if(row['Category'] !== toggleCategory || row['Subcategory'] !== toggleSubcategory) return;

      let targetID = row['Type'] == 1 ? 'technical_accordion' : 'organizational_accordion';
      let targetElem = $('#' + targetID);
      let category = row['Category'].trim() + (row['Subcategory'] ? ' - ' + row['Subcategory'].trim() : '');
      let targetCategory = 'tom_category_' + category.replace(/\W/g, '_');

      if($('#' + targetCategory).length !== 1) {
        let inserted = false;
        targetElem.find('.panel-heading').each(function(idx, elem) {
          if(elem.id.localeCompare('heading_' + targetCategory) === 1) {
            $(elem).parent('div').prev('h6').before('<h6 class="info-text text-ul-dot printOnly hidden">' + category + '</h6>');
            $(elem).parent('div').prev('h6').before('<div class="panel panel-default printHide"><div class="panel-heading" role="tab" id="heading_' + targetCategory + '"><h4 class="panel-title"><a role="button" data-toggle="collapse" data-parent="#' + targetID + '" href="#' + targetCategory + '" aria-expanded="true" aria-controls="' + targetCategory + '">' + category + '</a></h4></div></div>');
            inserted = true;
            return false;
          }
        });

        if(!inserted) {
          targetElem.append('<h6 class="info-text text-ul-dot printOnly hidden">' + category + '</h6>');
          targetElem.append('<div class="panel panel-default printHide"><div class="panel-heading" role="tab" id="heading_' + targetCategory + '"><h4 class="panel-title"><a role="button" data-toggle="collapse" data-parent="#' + targetID + '" href="#' + targetCategory + '" aria-expanded="true" aria-controls="' + targetCategory + '">' + category + '</a></h4></div></div>');
        }

        $('#heading_' + targetCategory).after('<div id="' + targetCategory + '" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading_' + targetCategory + '"><div class="panel-body"></div></div>');
        $('#' + targetCategory).find('.panel-body').append('<table class="table table-striped table-hover"><thead><tr><th class="col-sm-1">ID</th><th class="col-sm-6">Beschreibung</th><th class="col-sm-2">Umgesetzt?</th><th class="col-sm-3">Erläuterung bzw. Begründung</th></tr></thead><tbody></tbody></table>');
        $('#heading_' + targetCategory + ', #heading_' + targetCategory + ' a').click((evt) => {
          if(evt.target.nodeName === "A") return;
          $(evt.target).find('a').click();
        });
      }

      let className = row['Risklevel'] == 1 ? 'success' : row['Risklevel'] == 2 ? 'warning' : 'danger';
      let tomID = row['Identifier'].trim().replace(/ /g, '_');
      let tomContent = row['Title'] ? row['Title'] + '<i data-toggle="tooltip" title="' + row['Description'] + '" class="fa fa-question-circle-o fa-lg"></i>' : row['Description'];
      let tableBody = $('#' + targetCategory).find('tbody');

      let tomDropdown = $('<select data-tool="selectpicker" name="massnahmen_' + tomID + '"></select>')
        .append('<option value="0" selected>Nein</option>')
        .append('<option value="1">Ja</option>')
        .append('<option value="2">Teilweise</option>')
        .append('<option value="3">Nicht anwendbar</option>')
        .append('<option value="4">Nicht sinnvoll</option>');
      tableBody.append('<tr data-risk="' + row['Risklevel'] + '" class="' + className + '"><td>' + row['Identifier'] + '</td><td>' + tomContent + '</td><td>' + tomDropdown[0].outerHTML + '</td><td><textarea name="massnahmen_' + tomID + '_kommentar" class="form-control"></textarea></td></tr>');
    });

    // Tooltips aktivieren
    $('#technical_accordion, #organizational_accordion').find('[data-toggle="tooltip"]').tooltip({
      placement: 'auto'
    });

    // Selectpicker aktivieren
    $('#technical_accordion, #organizational_accordion').find('select[data-tool="selectpicker"]').selectpicker();

    // Risikofilter anwenden
    filterTOMList(parseInt($('[name=massnahmen_risiko]:checked').val()));
  }
  else {
    $('#' + evtTarget.data('target')).parent('div').prev('h6').detach();
    $('#' + evtTarget.data('target')).parent('div').detach();
  }
}

debugLog('Beginne Setup...');

// Abwarten, bis alle notwendigen Daten über AJAX-Requests geholt wurden
Promise.all(promises).then(function() {
  if(tomsMapping.length === 0) {
    console.error('Kann ohne TOMs nicht fortfahren! Beende...');
    return;
  }

  /*
   * Dynamische Inhalte initialisieren
   */
  debugLog('Initialisiere dynamische Inhalte...');
  console.time('Dynamische Inhalte initialisieren');

  // TOM-Auswahl erzeugen und auf Standard setzen
  generateTOMList();
  filterTOMList(2);

  // Initialisierung für die Endlos-Tabellen
  initEndlessTables();

  // Toggle der gemeinsam Verantwortlichen Felder
  $('input[name=allgemein_verantwortlich_extern]').change(function() {
    var target = $(this);
    if(target[0].checked) {
      target.closest('div').nextAll('div').removeClass('hidden');
    }
    else {
      target.closest('div').nextAll('div').addClass('hidden');
      target.closest('div').nextAll('div').find('input').val('');
    }
  });

  // Stellt die speziellen Optionen für externe Empfänger bereit im Abschnitt Daten
  $('#datenzugriff_empfaenger_extern').on('change', 'input[name="datenzugriff_empfaenger_extern_drittland[]"]', function(event) {
    var target = $(event.target);
    if(target[0].checked) {
      target.closest('div').next().removeClass('hidden');
    }
    else {
      target.closest('div').next().addClass('hidden');
      target.closest('div').next().find('select[name="datenzugriff_empfaenger_extern_grundlage[]"]').val(0).trigger('change');
    }
  });
  $('#datenzugriff_empfaenger_extern').on('change', 'select[name="datenzugriff_empfaenger_extern_grundlage[]"]', function(event) {
    var target = $(event.target);
    if(target.val() === '5' || target.val() === '6') {
      target.parent('div').parents('div').first().next('div').removeClass('hidden');
    }
    else {
      target.parent('div').parents('div').first().next('div').addClass('hidden');
    }
  });

  // Blendet ein Eingabefeld für AV-Verträge bei Bedarf ein
  $('#datenzugriff_empfaenger_extern').on('change', 'input[name="datenzugriff_empfaenger_extern_auftragsverarbeitung[]"]', function(event) {
    var target = $(event.target);
    if(target[0].checked) {
      target.closest('div').find('input[type=text]').first().removeClass('hidden');
    }
    else {
      target.closest('div').find('input[type=text]').first().addClass('hidden').val('');
    }
  });

  // Entfernt die Optionen Klienten einzutragen, falls es sich um eine Webanwendung handelt
  $('input[name=systeme_klienten_webanwendung]').change(function() {
    var target = $(this);
    if(!target[0].checked) {
      $('#systeme_klienten').closest('div').removeClass('hidden');
      addTableRow('systeme_klienten');
    }
    else {
      $('#systeme_klienten').closest('div').addClass('hidden');
      $('#systeme_klienten').find('.systeme_klienten_del').trigger('click');
    }
  });

  // Blendet bei Bedarf die Möglichkeiten für externe Empfänger ein
  $('input[name=datenzugriff_empfaenger_extern]').change(function() {
    var target = $(this);
    if(target[0].checked) {
      $('#datenzugriff_empfaenger_extern').closest('div').removeClass('hidden');
      // addTableRow('datenzugriff_empfaenger_extern');
    }
    else {
      $('#datenzugriff_empfaenger_extern').closest('div').addClass('hidden');
      $('#datenzugriff_empfaenger_extern').find('.datenzugriff_empfaenger_extern_del').trigger('click');
    }
  });

  // Blendet bei Bedarf Eingabefelder für zusätzliche Dokumente ein
  $('input.additionalDocs').change(function() {
    var target = $(this);
    if(target[0].checked) {
      target.closest('div').find('input[type=text]').first().removeClass('hidden');
    }
    else {
      target.closest('div').find('input[type=text]').first().addClass('hidden').val('');
    }
  });

  // Zeigt die aktuelle Beschreibung der abhängigen Verfahren an
  $('#abschluss_abhaengigkeit').on('change', 'input[name="abschluss_abhaengigkeit_id[]"]', function() {
    var idField = $(this);
    var descText = idField.closest('td').next('td').find('textarea');
    if(idField.val() !== '') {
      $.get(backendPath, { 'action': 'get', 'id':  idField.val(), 'debug': debug}).done(function(data) {
        if(!data['success']) {
          showError('Auslesen der Abhängigkeiten', 'Scheinbar existiert ein Verfahren nicht mehr, von dem dieses Verfahren abhängig ist!');
          console.error('Fehler beim Abruf von abhängigen Verfahren! Fehler: ' + data['error']);
          descText.val('<Das Verfahren existiert nicht!>');
          return;
        }
        idField.closest('td').find('input[name="abschluss_abhaengigkeit_name[]"]').val(htmlDecode(data['data'][0]['Bezeichnung']) + ' [' + htmlDecode(data['data'][0]['Fachabteilung']) + ']');
        descText.val(htmlDecode(data['data'][0]['Beschreibung']));
      }).fail((jqXHR, error, errorThrown) => {
        console.error('Fehler beim Abruf von abhängigen Verfahren! HTTP Code: ' + jqXHR.status + ' Fehler: ' + error + ' - ' + errorThrown);
        descText.val('<Fehler beim Abrufen>');
      });
    }
    else {
      descText.val('');
    }
  });

  // Zeigt den aktuellen Aufstellungsort der Endgeräte an
  $('#systeme_server').on('change', 'input[name="systeme_server_ip[]"]', function() {
    var idField = $(this);
    var descText = idField.next('.form-group').find('input');
    if(idField.val() !== '') {
      $.get(backendPath, { 'action': 'getAufstellungsort', 'search':  idField.val(), 'debug': debug }).done(function(data) {
        if(!data['success']) {
          showError('Auslesen des Aufstellungsortes', 'Scheinbar existiert das Endgerät nicht mehr!');
          console.error('Fehler beim Abruf des Aufstellungsortes! Fehler: ' + data['error']);
          descText.val('<Das Endgerät existiert nicht!>');
          return;
        }
        descText.val(data['data']['aufstellungsort']);
      }).fail((jqXHR, error, errorThrown) => {
        console.error('Fehler beim Abruf des Aufstellungsortes! HTTP Code: ' + jqXHR.status + ' Fehler: ' + error + ' - ' + errorThrown);
        descText.val('<Fehler beim Abrufen>');
      });
    }
    else {
      descText.val('');
    }
  });

  // Interaktive Auswahlfelder mit Typeahead initialisieren
  $('input[data-tool="typeahead"]').each(function(key, value) {
    initTypeahead(value);
  });

  // TOM Liste aktualisieren, wenn Risikolevel geändert wird
  $('[name=massnahmen_risiko]').change(function() {
    filterTOMList(parseInt($(this).val()));
  });

  console.timeEnd('Dynamische Inhalte initialisieren');

  /*
   * Statische Elemente initialisieren
   */
  debugLog('Initialisiere statische Inhalte...');
  console.time('Statische Inhalte initialisieren');

  setSaveLabel('failed');

  // Standardmäßig alle Checkboxen nicht auswählen
  $('input[type=checkbox]').prop('checked', false);

  // Tooltips initialisieren
  $('[data-toggle="tooltip"]').tooltip({
    placement: 'auto',
    container: 'body',
    html: true
  });

  // Notwendige Eingabefelder hervorheben
  $('input:required, textarea:required').closest('.form-group').find('label:first').append(' <sup><i style="color: #EB5E28;" class="fa fa-asterisk" aria-hidden="true"></i></sup>');

  console.timeEnd('Statische Inhalte initialisieren');

  /*
   * Initialisiere spezielle Handler
   */
  debugLog('Initialisiere spezielle Handler...');
  console.time('Spezielle Handler initialisieren');

  // Button für den Aufruf der Verfahrensliste initialisieren
  $('#showVerfahrensliste').click(function() { $(this).prop('disabled', true); showVerfahrensliste(); });

  // Manuelles Speichern über das Speicher-Status-Label
  $('#successLabel, #savingLabel, #failedLabel').click(function() { saveOnServer(); }).css({'cursor': 'pointer'});

  // Button für Vorschau-PDF initialisieren
  $('#dlDraftPDF').click(function() {
    if(!loadId) {
      showError('Download der Vorschau-PDF', 'Die Verarbeitungstätigkeit/das IT-Verfahren muss mindestens einmal abgespeichert worden sein, um eine Vorschau-PDF zu generieren!');
      return;
    }

    $(this).prop('disabled', true);
    setOverlay();

    let htmlForPDF = genHTMLforPDF();

    $.post(backendPath, JSON.stringify({'action':'gendraftpdf', 'id': loadId, 'data': {'title': $('[name="allgemein_bezeichnung"]').val(), 'pdfCode': htmlForPDF}, 'debug': debug})).done((data) => {
      if(!data['success']) {
        showError('Erzeugen der Vorschau-PDF', data['error']);
        $(this).prop('disabled', false);
        setOverlay(false);
        return;
      }

      getPDFFromServer(loadId, true);
      $(this).prop('disabled', false);
    }).fail((jqXHR, error, errorThrown) => {
      showError('Erzeugen der Vorschau-PDF', 'HTTP Code: ' + jqXHR.status + ' Fehler: ' + error + ' - ' + errorThrown);
      $(this).prop('disabled', false);
      setOverlay(false);
    })
  });

  // Titel anhand Bezeichnung aktualisieren
  $('input[name="allgemein_bezeichnung"]').on('input', (e) => {
    document.title = e.target.value + ' - ' + document.title.split(' - ').slice(-1)[0];
  });

  // Warnung vor dem Schließen der Webseite, falls ungespeicherte Änderungen vorhanden sind
  $(window).on('beforeunload', (e) => {
    if(!changedValues) return; // nichts zurück geben, um die Meldung zu unterdrücken!

    let msg = 'Es sind noch ungespeicherte Änderungen vorhanden! Diese gehen beim Verlassen verloren. Sind Sie sicher, dass sie die Seite verlassen möchten?'; // Wird von den meisten Browsern mittlerweile ignoriert
    e.preventDefault();
    e.returnValue = msg; // For Chrome
    return msg;
  });

  console.timeEnd('Spezielle Handler initialisieren');

  // Verfahren laden, falls ID in der URL übergeben
  if(loadId) {
    debugLog('Lade Verfahren #' + loadId + '...');
    loadFromServer(loadId);
  }
  else if(copyId){
    debugLog('Kopiere Verfahren #' + copyId + '...');
    copyFromServer(copyId);
  }
  else {
    debugLog('Kein Verfahren gewählt. Lade Verfahrensliste...');
    showVerfahrensliste(true);
  }

  // Überprüpft, ob Angaben geändert wurden
  $('form').on('change', '[name!=""]', (e) => { changedValues = true; });

  debugLog('Setup beendet!');

  // Timer beenden
  console.timeEnd('Gesamte Vorbereitungszeit für Wizard');
});
