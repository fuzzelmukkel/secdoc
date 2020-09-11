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
 * @copyright (c) 2018-2020 Westfälische Wilhelms-Universität Münster
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
 * Gibt an, ob das geladene Verfahren bearbeitet werden kann
 * @global
 * @type {Boolean}
 */
var canEdit = true;

/**
 * Speichert den aktuellen Bearbeitungs-Modus (entweder IT-Verfahren, Fachapplikation Verarbeitungstätigkeit)
 * @global
 * @type {String}
 */
var mode = ['wizit', 'wizproc', 'wizapp', 'wizmeasures'].includes(page) ? page : 'wizproc';

/**
 * Mapping des Typs
 * @global
 * @type {Object}
 */
let modeMapping = {
  1: ['Verarbeitungstätigkeit', 'Verarbeitungstätigkeiten', 'Die', 'eine', 'einer'],
  2: ['IT-Verfahren', 'IT-Verfahren', 'Das', 'ein', 'einem'],
  3: ['Fachapplikation', 'Fachapplikationen', 'Die', 'eine', 'einer'],
  4: ['übergreifende Massnahme', 'übergreifende Massnahmen', 'Die', 'eine', 'einer']
};

/**
 * Interne Nummerierung für die Dokumentations-Modi
 * @global
 * @type {Number}
 */
let modeNum = 0;
if(mode === 'wizproc')       modeNum = 1;
if(mode === 'wizapp')        modeNum = 3;
if(mode === 'wizit')         modeNum = 2;
if(mode === 'wizmeasures')   modeNum = 4;

/**
 * Lesbarer Name des Modus; genutzt für die Ersetzung in Texten
 * @global
 * @type {Array}
 */
var modeName = modeMapping[modeNum];

/**
 * Gibt an, ob Eingaben geändert wurden seit dem letzten Laden/Speichern
 * @global
 * @type {Boolean}
 */
var changedValues = false;

/**
 * Liste der IDs aller veränderten Felder seit dem letzten Speichern
 * @global
 * @type {Array}
 */
var changedFields = [];

/**
 * Gibt an, ob das Verfahren als abgeschlossen markiert wurde
 * @global
 * @type {Boolean}
 */
var markedAsFinished = false;

/**
 * Gibt an, welchen Status das Verfahren hat
 * @global
 * @type {Number}
 */
var status = 0;

/**
 * Sammlung von Promises für AJAX-Anfragen, die zu Beginn durchgeführt werden müssen
 * @global
 * @type {Array}
 */
var promises = [];

/**
 * JS Interval Timer für regelmäßigen Autosave
 * @global
 * @type {Number}
 */
var autoSaveTimer = 0;

/**
 * Zeit zwischen Autosaves
 * @global
 * @type {Number}
 */
var autoSaveWait = 600000;

/**
 * Wird auf true gesetzt, wenn der Wizard zurückgesetzt wird (z.B. über "Neue Dokumentation")
 * @global
 * @type {Boolean}
 */
var globalClear = false;

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
// Cache entfernen; erschwert nur die Aktualisierung von TOMs ohne großen Geschwindigkeitsvorteil
if(localStorage.getItem('tom_cache_' + (document.location.host + document.location.pathname).replace(/\W/g, '_')) !== null) {
  localStorage.removeItem('tom_cache_' + (document.location.host + document.location.pathname).replace(/\W/g, '_'));
}

// TOM Liste holen
promises[0] = $.getJSON(backendPath + '?action=gettoms&data={"tier":' + modeNum + '}' + (debug ? '&debug=true' : '')).done((data) => {
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

  let itTOMList = false;
  tomsMapping.some((elem) => {
    if(parseInt(elem['Mode']) === 1) {
      itTOMList = true;
      return true;
    }
  });
}).fail((jqXHR, error, errorThrown) => {
  showError('Holen der TOMs', false, {'jqXHR': jqXHR, 'error': error, 'errorThrown': errorThrown});
});

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
        status = 2;

        let statusSymbol = status in statusSymbolMapping ? ' <i data-toggle="tooltip" class="fa ' + statusSymbolMapping[status] + '" title="' + statusMapping[status]  + '"></i>' : '';
        $('#title').find('i').replaceWith(statusSymbol);
        $('#title').find('i').tooltip();

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
        showError('Abschließen des Verfahrens', false, {'jqXHR': jqXHR, 'error': error, 'errorThrown': errorThrown});
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
  modalBody.append('<ul class="nav nav-tabs" role="tablist"><li role="presentation" class="active"><a href="#listeditable" aria-controls="listeditable" role="tab" data-toggle="tab"><i class="fa fa-edit"></i> Editierbare ' + modeName[1] + '</a></li><li role="presentation"><a href="#listreadable" aria-controls="listreadable" role="tab" data-toggle="tab"><i class="fa fa-eye"></i> Einsehbare ' + modeName[1] + '</a></li></ul>');
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

    let modeCount = 0;

    for(var c=0; c < data['count']; c++) {
      // Filter nach Ebene
      let currType = parseInt(data['data'][c]['Typ']);
      if(currType === 1 && mode !== 'wizproc')     continue;
      if(currType === 2 && mode !== 'wizit')       continue;
      if(currType === 3 && mode !== 'wizapp')      continue;
      if(currType === 4 && mode !== 'wizmeasures') continue;

      modeCount++;

      let currId = parseInt(data['data'][c]['ID']);
      let newEntry = $('<tr></tr>');
      let statusSymbol = data['data'][c]['Status'] in statusSymbolMapping ? ' <i class="fa ' + statusSymbolMapping[data['data'][c]['Status']] + '"></i>' : '';
      data['data'][c]['Status'] = data['data'][c]['Status'] in statusMapping ? statusMapping[data['data'][c]['Status']] : statusMapping['9'];

      // Editierbare/Eigene Verfahren
      if(data['data'][c]['Editierbar'] === true) {
        newEntry.append('<td style="width: 16px;"></td>');
        newEntry.append('<td>' + data['data'][c]['Bezeichnung'] + ' <i data-toggle="tooltip" class="fa fa-info-circle" title="' + data['data'][c]['Beschreibung'] + '"></i></td>');
        newEntry.append('<td>' + data['data'][c]['Fachabteilung']  + '</td>');
        newEntry.append('<td>' + data['data'][c]['Status'] + statusSymbol + '</td>');
        newEntry.append('<td>' + data['data'][c]['LetzterBearbeiter'] + ' <i data-toggle="tooltip" class="fa fa-info-circle" title="' + (data['data'][c]['BearbeiterDetails'] ? data['data'][c]['BearbeiterDetails'] : '<Keine Details vorhanden>') + '"></i></td>');
        newEntry.append('<td>' + data['data'][c]['Aktualisierung'] + '</td>');
        newEntry.append('<td><div class="btn-group inline"><a class="btn" href="?id=' + currId + (debug ? '&debug=true' : '') + '" target="_blank"><i class="fa fa-edit"></i> Bearbeiten</a><a class="btn" href="?copy=' + currId + '" target="_blank"><i class="fa fa-copy"></i> Kopieren</a><button type="button" title="Die PDF-Version repräsentiert das zuletzt abgeschlossene Verfahren!" data-id="' + currId + '" class="btn pdfdownload" ' + (data['data'][c]['PDF'] ? '' : 'disabled') + '><i class="fa fa-file-pdf-o"></i> PDF anzeigen</button></div> <button type="button" data-id="' + currId +'" data-name="' + data['data'][c]['Bezeichnung'] +'" class="btn del btn-danger" ' + (data['data'][c]['Löschbar'] === true ? '' : 'disabled')  + '><i class="fa fa-minus"></i> Löschen</button></td>');
        modalBody.find('#editableprocesses tbody').append(newEntry);
      }
      else {
        newEntry.append('<td style="width: 16px;"></td>');
        newEntry.append('<td>' + data['data'][c]['Bezeichnung'] + ' <i data-toggle="tooltip" class="fa fa-info-circle" title="' + data['data'][c]['Beschreibung'] + '"></i></td>');
        newEntry.append('<td>' + data['data'][c]['Fachabteilung']  + '</td>');
        newEntry.append('<td>' + data['data'][c]['Status'] + statusSymbol + '</td>');
        newEntry.append('<td>' + data['data'][c]['Aktualisierung'] + '</td>');
        newEntry.append('<td><div class="btn-group inline"><a class="btn" href="?id=' + currId + (debug ? '&debug=true' : '') + '" target="_blank"><i class="fa fa-edit"></i> Anzeigen</a><a class="btn" href="?copy=' + currId + '" target="_blank"><i class="fa fa-copy"></i> Kopieren</a><button type="button" data-id="' + currId + '" class="btn pdfdownload" ' + (data['data'][c]['PDF'] ? '' : 'disabled') + '><i class="fa fa-file-pdf-o"></i> PDF anzeigen</button></div></td>');
        modalBody.find('#readableprocesses tbody').append(newEntry);
      }
    }

    if(modeCount === 0) {
      show = false;
      return;
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
    showError('Abrufen der Verfahrensliste', false, {'jqXHR': jqXHR, 'error': error, 'errorThrown': errorThrown});
  }).always(() => {
    $('#showVerfahrensliste').prop('disabled', false);
    setOverlay(false);
    console.timeEnd('Verfahrensliste laden');
    if(show) {
      modalBody.append('<p><span><button type="button" class="btn loadEmpty btn-success btn-fill"><i class="fa fa-plus"></i> Neue Dokumentation anlegen</button></span></p>');
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
  globalClear = true;

  if(changedValues) {
    let confirmClear = confirm('Es sind noch ungespeicherte Änderungen vorhanden, die beim Leeren der Dokumentation verloren gehen. Wollen Sie wirklich fortfahren?');

    if(!confirmClear) {
      setSaveLabel('failed');
      setOverlay(false);
      globalClear = false;
      console.timeEnd('Leeres Verfahren laden');
      return;
    }
  }

  // ID leeren
  loadId = 0;
  $('input[name=meta_id]').val(loadId);

  // Status zurücksetzen
  status = 0;
  markedAsFinished = false;

  // Felder wieder bearbeitbar machen
  $('#content').find('input, textarea, select, button[id!="showVerfahrensliste"]').prop('disabled', false);
  canEdit = true;

  // Tabellen, Eingabefelder und Checkboxen zurücksetzen
  endlessTables.forEach(function(table) {
    removeTableRows(table);
  });
  $('input[type=text], textarea').not('[name$="_nummer[]"]').val('');
  $('input[type=checkbox]').prop('checked', false).trigger('change');
  $('.wizard-navigation li a').first().click();
  endlessTables.forEach(function(table) {
    addTableRow(table);
  });
  $('#abschluss_vonabhaengig tbody tr').remove();

  // Clear title
  document.title = document.title.split(' - ').slice(-1)[0];
  let emptyTitle = 'Dokumentation einer Verarbeitungstätigkeit';
  if(mode === 'wizapp')       emptyTitle = 'Dokumentation einer Fachapplikation';
  if(mode === 'wizit')        emptyTitle = 'Dokumentation eines IT-Verfahrens';
  if(mode === 'wizmeasures')  emptyTitle = 'Dokumentation von übergreifenden Massnahmen';
  let statusSymbol = status in statusSymbolMapping ? ' <i data-toggle="tooltip" class="fa ' + statusSymbolMapping[status] + '" title="' + statusMapping[status]  + '"></i>' : '';
  $('#title').text(emptyTitle).append(statusSymbol).find('i').tooltip();

  setSaveLabel('failed');
  setOverlay(false);
  globalClear = false;
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
 * @returns {Boolean}
 */
function loadFromJSON(values, keepAccess = false) {
  let missingFields = [];

  endlessTables.forEach(function(table) {
    if(keepAccess && ['meta_gruppen', 'meta_nutzer'].includes(table)) return;
    removeTableRows(table);
  });

  try {
    values = JSON.parse(values);
  } catch(e) {
    showError('Laden der Dokumentation', 'Kein gültiges JSON - ' + e);
    return false;
  }

  // Fallback für fehlende TOM Kategorie Auswahlfelder
  let tomFields = Object.keys(values).filter((elem) => (elem.search('massnahmen_') >= 0));
  tomFields.forEach((id) => {
    id = id.split('_')[1];
    if(['risiko', 'vertraulichkeit', 'integritaet', 'verfuegbarkeit'].includes(id)) return;
    let tomEntry = tomsMapping.filter((elem) => (elem.Identifier === id));
    if(tomEntry.length === 0) return;
    let targetSubcategory = ('tom_toggle_' + tomEntry[0]['Category'].trim() + '_' + (tomEntry[0]['Subcategory'].trim() ? tomEntry[0]['Subcategory'].trim() : 'all')).replace(/\W/g, '_');
    $('input[name="' + targetSubcategory + '"]:not(:checked)').prop('checked', true).trigger('change');
  });

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
        missingFields.push(htmlEncode(val));
        return true;
      }

      for(let c = 0; c < values[val].length; c++) {
        if(inputs[c].type === 'checkbox') {
          if(values[val][c] !== '0' && !$(inputs[c]).prop('checked')) $(inputs[c]).prop('checked', true).trigger('change');
        }
        else if(inputs[c].type === 'radio') {
          let fieldsPerValue = inputs.length / values[val].length;
          for(let d = 0; d < fieldsPerValue; d++) {
            if(inputs[c * fieldsPerValue + d].value === values[val][c] && !$(inputs[c * fieldsPerValue + d]).prop('checked')) $(inputs[c * fieldsPerValue + d]).prop('checked', true).trigger('change');
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
          if(values[val] !== '0' && !inp.prop('checked')) inp.prop('checked', true).trigger('change');
        }
        else {
          if(!Array.isArray(values[val])) values[val] = htmlDecode(values[val]);
          inp.val(values[val]);
        }
      }
      else if(inp.length > 1 && inp[0].type === 'radio') {
        for(let c = 0; c < inp.length; c++) {
          if(inp[c].value === values[val] && !$(inp[c]).prop('checked')) $(inp[c]).prop('checked', true).trigger('change');
        }
      }
      else {
        debugLog('Keine passenden oder mehrere Eingabefelder mit Namen "' + val + '" gefunden! Überspringe...');
        missingFields.push(htmlEncode(val));
      }
    }
  });
  $('select.selectpicker, select[data-tool=selectpicker]').selectpicker('refresh');
  $('select.selectpicker, select[data-tool=selectpicker]').selectpicker('render');

  // Meldung über gespeicherte Eingabefelder, die nicht mehr vorhanden sind anzeigen (nur DSB)
  if(userIsDSB && missingFields.length > 0) {
    let missingFieldsHTML = '<li>' + missingFields.join('</li><li>') + '</li>';
    showError('Zuordnen gespeicherter Felder', 'Folgende gespeicherte Felder existieren nicht mehr und die eingegebenen Daten gehen beim Speichern verloren: <ul>' + missingFieldsHTML + '</ul>');
  }

  // Angehängte Dokumente laden
  loadDocuments();

  return true;
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
        setSaveLabel('saved', new Date(data['data']['Date'].replace(' ', 'T')));  // Safari benötigt das Format YYYY-MM-DDTHH:MM:SS (mit T)
        $('input[name="meta_lastupdate"]').val(data['data']['Date']);
        changedValues = false;
        changedFields = [];
      }
      else {
        showError('Anlegen der Dokumentation', data['error']);
        setSaveLabel('failed');
      }
    }).fail((jqXHR, error, errorThrown) => {
      showError('Anlegen der Dokumentation', false, {'jqXHR': jqXHR, 'error': error, 'errorThrown': errorThrown});
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
        let errorText = data['error'];

        if(errorText.includes('bearbeitet')) {
          let unsavedChanges = $('<div></div>').append('<p><h4>Übersicht der ungespeicherten Änderungen</h4><table class="table table-bordered bg-info"><thead><tr><th>Feld</th><th>Inhalt</th></tr></thead><tbody></tbody></table></p>');
          let changedFieldsCopy = [...new Set(changedFields)];
          let changedFieldsRest = [];

          changedFieldsCopy.forEach((x, idx) => {
            let fieldName = $('[name="' + x + '"]').first().closest('div.form-group').find('label').text();
            if(!fieldName) fieldName = $('[name="' + x + '"]').first().closest('table').closest('div').prev().find('h1, h2, h3, h4, h5, h6, .info-text').text();

            if(fieldName) {
              let val = htmlEncode($('[name="' + x + '"]').val());

              if(x.includes('[]')) val = 'Tabelle verändert';

              unsavedChanges.find('tbody').append('<tr><td>' + htmlEncode(fieldName) + '</td><td>' + val + '</td></tr>');
            }
            else {
              changedFieldsRest.push(x);
            }
          });

          changedFieldsRest.forEach((x, idx) => {
            if(x.includes('tom_toggle_')) {
              if($('[name="' + x + '"]').prop('checked')) {
                unsavedChanges.find('tbody').append('<tr><td>TOM Kategorie ausgewählt</td><td>' + htmlEncode($('[name="' + x + '"]').parent().text()) + '</td></tr>');
              }
              else {
                unsavedChanges.find('tbody').append('<tr><td>TOM Kategorie abgewählt</td><td>' + htmlEncode($('[name="' + x + '"]').parent().text()) + '</td></tr>');
              }
            }
            else if(x.includes('massnahmen_') && x !== 'massnahmen_risiko') {
              if($('[name="' + x + '"]').prop('nodeName') === 'SELECT') {
                let val = 'Nein';
                switch($('[name="' + x + '"]').val()) {
                  case '1': val = 'Ja'; break;
                  case '0': val = 'Nein'; break;
                  case '2': val = 'Teilweise'; break;
                  case '4': val = 'Entbehrlich'; break;
                }
                unsavedChanges.find('tbody').append('<tr><td>Umsetzung Massnahme ' + htmlEncode($('[name="' + x + '"]').closest('tr').find('td').first().text()) + '</td><td>' + val + '</td></tr>');
              }
              else {
                unsavedChanges.find('tbody').append('<tr><td>Kommentar Massnahme ' + htmlEncode($('[name="' + x + '"]').closest('tr').find('td').first().text()) + '</td><td>' + htmlEncode($('[name="' + x + '"]').val()) + '</td></tr>');
              }
            }
            else {
              unsavedChanges.find('tbody').append('<tr><td>' + htmlEncode(x) + '</td><td>' + htmlEncode($('[name="' + x + '"]').val()) + '</td></tr>');
            }
          });

          errorText = errorText + '<br />' + unsavedChanges.html();
        }

        showError('Speichern der Dokumentation', errorText);
        setSaveLabel('failed');
      }
      else {
        setSaveLabel('saved', new Date(data['data']['Date'].replace(' ', 'T')));  // Safari benötigt das Format YYYY-MM-DDTHH:MM:SS (mit T)
        $('input[name="meta_lastupdate"]').val(data['data']['Date']);
        history.replaceState({}, document.title, window.location.href.split('?')[0] + '?id=' + loadId);
        changedValues = false;
        changedFields = [];

        // Hinweis anzeigen, falls Status zurückgesetzt wurde
        if(markedAsFinished) {
          modal.find('.modal-title').text('Status zurückgesetzt');
          modal.find('.modal-body').html('<p>' + (mode === 'wizproc' ? 'Die Verarbeitungstätigkeit' : 'Das IT-Verfahren') + ' wurde zurück auf "In Bearbeitung" gesetzt und muss erneut abgeschlossen werden, um erneut als "In Betrieb" gekennzeichnet zu werden.</p>');
          modal.find('.modal-body').append('<p><button type="button" class="center-block btn btn-primary" data-dismiss="modal" aria-label="Close">Schließen</button></p>');
          modal.modal();
          markedAsFinished = false;

          // Status aktualisieren
          status = 0;
          let statusText = status in statusMapping ? statusMapping[status] : statusMapping['9'];
          let statusSymbol = status in statusSymbolMapping ? ' <i data-toggle="tooltip" class="fa ' + statusSymbolMapping[status] + '" title="' + statusText + '"></i>' : '';
          $('#title').find('i').replaceWith(statusSymbol);
          $('#title').find('i').tooltip();
        }
      }
    }).fail((jqXHR, error, errorThrown) => {
      showError('Speichern der Dokumentation', false, {'jqXHR': jqXHR, 'error': error, 'errorThrown': errorThrown});
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
      status = parseInt(data['data'][0]['Status']);
      loadId = parseInt(data['data'][0]['ID']);
      $('input[name="meta_id"]').val(loadId);

      if(!data['data'][0]['Editierbar']) {
        canEdit = false;
        $('#content').find('input, textarea, select, button[id!="showVerfahrensliste"]').prop('disabled', true);
        $('#content > .tab-content > .tab-pane > div').appendTo('#content > .tab-content > .tab-pane:first()');
        $('#content > .wizard-navigation, #content > .wizard-footer div').remove();
        $('#content > .tab-content').css('padding-top', '0px');
        $('#autosaveLabel').addClass('hidden');
      }

      lastSaveDate = data['data'][0]['Aktualisierung'];
      if(!lastSaveDate) {
        let currDate = new Date();
        lastSaveDate = currDate.toISOString();
      }

      $('input[name="meta_lastupdate"]').val(lastSaveDate);
      setSaveLabel('saved', new Date(lastSaveDate.replace(' ', 'T')));  // Safari benötigt das Format YYYY-MM-DDTHH:MM:SS (mit T)

      document.title = htmlDecode(data['data'][0]['Bezeichnung']) + ' - ' + document.title.split(' - ').slice(-1)[0];
      let statusSymbol = status in statusSymbolMapping ? ' <i data-toggle="tooltip" class="fa ' + statusSymbolMapping[status] + '" title="' + statusMapping[status]  + '"></i>' : '';
      $('#title').text(' Dokumentation von ' + htmlDecode(data['data'][0]['Bezeichnung'])).append(statusSymbol).find('i').tooltip();
      changedValues = false;
      changedFields = [];

      // Abhängigkeiten bei IT-Verfahren anzeigen
      if(userIsDSB) {
        $('#abschluss_vonabhaengig tbody tr').remove();
        $.get(backendPath, { 'action': 'dependencies', 'id':  loadId, 'debug': debug}).done(function(data) {
          if(!data['success']) {
            console.error('Fehler beim Abruf der abhängigen Verfahren! Fehler: ' + data['error']);
            return;
          }

          data['data'].forEach(dependant => {
            let dependantType = 'Verarbeitungstätigkeit';
            if(dependant['type'] === 2) dependantType = 'IT-Verfahren';
            if(dependant['type'] === 3) dependantType = 'Fachapplikation';
            if(dependant['type'] === 4) dependantType = 'Übergreifende Massnahmen';

            let statusText = dependant['status'] in statusMapping ? statusMapping[dependant['status']] : statusMapping['9'];
            let statusSymbol = dependant['status'] in statusSymbolMapping ? ' <i data-toggle="tooltip" class="fa ' + statusSymbolMapping[dependant['status']] + '" title="' + statusText + '"></i>' : '';

            $('#abschluss_vonabhaengig tbody').append('<tr><td>' + htmlDecode(dependant['name']) + statusSymbol + '</td><td>' + dependantType + '</td><td><a class="btn" href="?id=' + dependant['id'] + '" target="_blank">Anzeigen</a></td></tr>');
          });

          $('#abschluss_vonabhaengig tbody').find('i[data-toggle="tooltip"]').tooltip();
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
    showError('Laden der Dokumentation', false, {'jqXHR': jqXHR, 'error': error, 'errorThrown': errorThrown});
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
      changedFields = ['allgemein_bezeichnung'];
    }
    else {
      showError('Kopieren der Dokumentation', data['error']);
    }
  }).fail((jqXHR, error, errorThrown) => {
    showError('Kopieren der Dokumentation', false, {'jqXHR': jqXHR, 'error': error, 'errorThrown': errorThrown});
  }).always(() => { setOverlay(false); console.timeEnd('Verfahren kopieren'); });
}

/**
 * Generiert den HTML-Code-Auschnitt für die PDF-Generierung
 * @param {boolean} draft Zeigt an, ob ein Abschluss- oder Entwurfs-Dokument erstellt wird
 * @returns {String} HTML-Code
 */
function genHTMLforPDF(draft = false) {
  console.time('HTML-Code-Generierung für PDF-Datei');

  /* Alle leeren Tabellenzeilen entfernen */
  endlessTables.forEach(function(table) {
    removeTableRows(table, true);
  });

  var toSend = $('<div></div>');

  /* Überschrift */
  toSend.append('<h2 class="text-center">Dokumentation ' + ( mode === 'wizproc' ? 'der Verarbeitungstätigkeit' : ( mode === 'wizapp' ? 'der Fachapplikation' : ( mode === 'wizmeasures' ? 'der übergreifenden Massnahmen' : 'des IT-Verfahrens' ) ) ) + '</h2>');
  toSend.append('<h3 class="text-center">' + htmlEncode($('[name="allgemein_bezeichnung"]').val()) + '</h3>');

  /* Nr. und Änderungsinfo */
  toSend.append('<table class="table"><tbody><tr><td class="text-left">Nr.: <span style="background-color: lightyellow">' + loadId + '</span></td><td class="text-center">Letzter Bearbeiter: <span style="background-color: lightyellow">$lasteditor$</span></td><td class="text-right">Letzte Aktualisierung: <span style="background-color: lightyellow">' + $('#saveTime').text() + '</span></td></tr></tbody></table>');

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
  toSend.find('#tom_accordion').find('.panel-collapse').each(function() {
    if($(this).closest('.panel').hasClass('hidden')) {
      $(this).closest('.panel').prev('h6').remove();
      $(this).remove();
      return;
    }

    $(this).removeClass('collapse');
    $(this).closest('.panel').before($(this));
  });

  if(draft) {
    toSend.find('#tom_accordion').find('option').each(function() {
      let selectName = $(this).closest('select')[0].name;
      let selectedValue = $('select[name="' + selectName + '"]').val();

      if(this.value === selectedValue) {
        $(this).closest('td').append('<p>&#9746; ' + this.text + '</p>');
      }
      else {
        $(this).closest('td').append('<p>&#9744; ' + this.text + '</p>');
      }
    });
    toSend.find('#tom_accordion').find('div.bootstrap-select').remove();
  }

  /* Nur TOMs in der PDF anzeigen, die dem Risiko entsprechen */
  let currRiskLevel = parseInt($('[name="massnahmen_risiko"]:checked').val());
  toSend.find('#tom_accordion').find('tr').each(function() {
    if(parseInt($(this).data('risk')) > currRiskLevel) $(this).remove();
  });

  /* Bei Abschluss-PDF Volltexte entfernen */
  if(!draft) toSend.find('#tom_accordion').find('tbody td:nth-child(2) div.tom_desc').remove();
  if(!draft) toSend.find('#tom_accordion').find('tbody td:nth-child(2) p').removeClass('strong');
  if(!draft) toSend.find('#tom_accordion').find('.panel-body > p, .panel-body > a').remove();

  /* Hinweis-Text bei keinen ausgewählten TOMs */
  if(toSend.find('#toggletoms').find('input[type=checkbox]:checked').length === 0 || toSend.find('#tom_accordion').find('tr').length === 0) {
    toSend.find('#tom_accordion').append('<h5 class="text-center"><strong>Es wurden keine Technischen und Organisatorischen Maßnahmen ausgewählt.</strong></h5>');
  }

  /* Link hinzufügen */
  let baseURL = window.location.href.split('?')[0].replace(/x?sso/i, 'www');
  let link = baseURL + '?id=' + loadId;
  toSend.append('<div class="text-center"><p class="info-text text-ul">Dokumentation online einsehen</p><p><a href="$docurl$">$docurl$</a></p></div>');

  /* Links in Abhängigkeiten anpassen */
  toSend.find('table#abschluss_vonabhaengig tr, table#abschluss_abhaengigkeit tr, table#itverfahren_abhaengigkeit tr, table#verarbeitung_abhaengigkeit tr, table#massnahmen_abhaengigkeit tr').each(function(idx) {
    let abhLnk = $(this).find('td:last a');
    if(abhLnk.attr('href') === undefined) {
      abhLnk.detach();
    }
    else {
      abhLnk.attr('href', '$baseurl$' + abhLnk.attr('href'));
    }
  });

  toSend.find('table#abschluss_abhaengigkeit tr, table#itverfahren_abhaengigkeit tr, table#verarbeitung_abhaengigkeit tr, table#massnahmen_abhaengigkeit tr').each(function(idx) {
    $(this).find('td:last button').remove();
    $(this).append($(this).find('td:last, th:last').clone());
  });

  /* Layout-Anpassungen (Buttons durch Text ersetzen, Typeahead und andere aktive Elemente entschärfen) */
  toSend.find('select[data-tool="selectpicker"], select.selectpicker, [id$="_add"], .typeahead__cancel-button, .typeahead__hint, .typeahead__result').remove();
  toSend.find('table[data-tool="endlessTable"] tr').each(function(idx) {
      $(this).find('th:last, td:last').remove();
  });
  toSend.find('table[data-tool="endlessTable"]').each(function(idx){
    var tbl = $(this);
    if(tbl.find('tr').length < 2) {
      if(['abschluss_abhaengigkeit', 'itverfahren_abhaengigkeit', 'verarbeitung_abhaengigkeit', 'massnahmen_abhaengigkeit'].includes(this.id)) {
        tbl.parent().replaceWith('<div class="col-sm-offset-1 col-sm-10"><p>Es wurden keine Abhängigkeiten angegeben.</p></div>');
      }
      else {
        tbl.parent().prev().remove();
        tbl.parent().remove();
      }
    }
  });

  /* HTML in Eingabefeldern entschärfen */
  toSend.find('input, textarea').each(function(idx){
    $(this).val(htmlEncode($(this).val()));
  });

  /* Eingabeelemente durch gelb hinterlegten Text ersetzen */
  toSend.find('input[type!=checkbox][type!=hidden][type!=radio], select').replaceWith(function() { if($(this).parents('td').length>0) { return '<p>' + $(this).val() + '</p>'; } else { return '<p style="background-color: lightyellow">' + $(this).val() + '</p>'; }});
  toSend.find('textarea').replaceWith(function() { if($(this).parents('td').length>0) { return '<p>' + $(this).val().replace(/(?:\r\n|\r|\n)/g, '<br />') + '</p>'; } else { return '<p style="background-color: lightyellow">' + $(this).val().replace(/(?:\r\n|\r|\n)/g, '<br />') + '</p>'; }});

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
    if(checkbox.prop('checked')) {
      if(checkbox.attr('name') === 'daten_kategorien_besonders[]') {
        checkbox.replaceWith('<span><span style="color: green;">&#10004;</span> Ja</span>');
        return;
      }

      checkbox.replaceWith('<span style="color: green;">&#10004;</span>');
    }
    else {
      if(checkbox.attr('name').search(/massnahmen/g) > -1) {
        checkbox.replaceWith('<span style="color: red;">&#10006;</span>');
        return;
      }

      if(checkbox.attr('name') === 'abschluss_datenschutz_folgeabschaetzung') {
        checkbox.parent().replaceWith('<label><span style="color: red;">&#10006;</span> Es ist keine Datenschutzfolgeabschätzung notwendig</label>');
        return;
      }

      if(checkbox.attr('name') === 'daten_kategorien_besonders[]') {
        checkbox.replaceWith('<span>Nein</span>');
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
  console.timeEnd('HTML-Code-Generierung für PDF-Datei');
  return htmlCode;
}

/**
 * Exportiert die aktuell geladene Dokumentation als JSON-Datei
 * @return {undefined}
 */
function exportJSON() {
  setOverlay(true);

  // Aktuelle Dokumentation in JSON umwandeln
  let currObj  = saveAsObject();
  let fieldsToRemove = [
    'meta_id',
    'meta_lastupdate',
    'allgemein_typ',
    'abschluss_abhaengigkeit_id',
    'itverfahren_abhaengigkeit_id',
    'verarbeitung_abhaengigkeit_id',
    'massnahmen_abhaengigkeit_id',
    'meta_gruppen_kennung',
    'meta_gruppen_name',
    'meta_gruppen_schreiben',
    'meta_nutzer_kennung',
    'meta_nutzer_name',
    'meta_nutzer_schreiben',
    'allgemein_fachlich_kennung',
    'allgemein_technisch_kennung'
  ];
  let fieldsToReassign = [
    'abschluss_abhaengigkeit_name',
    'itverfahren_abhaengigkeit_name',
    'verarbeitung_abhaengigkeit_name',
    'massnahmen_abhaengigkeit_name',
    'allgemein_fachlich_name',
    'allgemein_technisch_name'
  ];

  // Unnötige Felder entfernen
  fieldsToRemove.forEach((field) => { delete currObj[field]; });

  // Anmerkung für Abhängigkeiten
  fieldsToReassign.forEach((field) => {
    if(currObj[field] !== undefined) {
      if(Array.isArray(currObj[field])) {
        currObj[field].forEach((entry, idx) => { currObj[field][idx] = "(ERSETZEN) " + entry; });
      }
      else {
        currObj[field] = "(ERSETZEN) " + currObj[field];
      }
    }
  });

  try {
    let currJSON = JSON.stringify(currObj);
    let dataStr  = "data:text/json;charset=utf-8," + encodeURIComponent(currJSON);

    // Download-Dialog für JSON-Date
    let download = $('<a></a>');
    download.attr('href', dataStr).attr('download', 'SecDoc_' + modeName[0] + '_' + currObj.allgemein_bezeichnung.replace(/\W/g, '_') + '_' + loadId + '.json').addClass('hidden');
    $('body').append(download);
    download[0].click();
    download.remove();
  } catch(e) {
    showError('Exportieren', e);
  }
  setOverlay(false);
}

/**
 * Importiert eine JSON-Datei in die aktuelle Dokumentation
 * @param {Object} file Verweis auf Datei vom Dateidialog
 * @return {undefined}
 */
function importJSON(file) {
  setOverlay(true);

  let fileReader = new FileReader();
  fileReader.onload = (evt) => {
    let nameToLoad = '';

    try {
      let jsonObj = JSON.parse(evt.target.result);

      if(jsonObj['allgemein_bezeichnung'] === undefined) throw new Error('Keine gültige SecDoc Dokumentation');

      nameToLoad = jsonObj['allgemein_bezeichnung'];
    } catch(e) {
      showError('Importieren', 'Die gewählte Datei kann nicht verarbeitet werden! - ' + e);
      return;
    }

    if(loadId !== 0) {
      modal.find('.modal-title').text('Import einer Dokumentation');
      modal.find('.modal-body').html('<div class="alert alert-warning">Sie haben bereits eine Dokumentation geladen. Soll eine neue Dokumentation angelegt oder die aktuell geladene Dokumentation überschrieben werden? (Hinweis: Evtl. gesetzte Zugriffsberechtigungen auf der letzten Seite werden nicht überschrieben.)</div>');
      modal.find('.modal-body').append('<div class="text-center"><button id="importEmptyBtn" class="btn btn-success">Neue Dokumentation</button><button id="importCurrBtn" class="btn btn-danger ml">Vorhandene überschreiben</button></div>');
      modal.modal();

      modal.find('#importEmptyBtn').click(() => { triggerLoadJSON(true); });
      if(canEdit) {
        modal.find('#importCurrBtn').click(() => { triggerLoadJSON(false); });
      }
      else {
        modal.find('#importCurrBtn').prop('disabled', true);
      }
    }
    else {
      triggerLoadJSON(true);
    }

    function triggerLoadJSON(createNew) {
      modal.modal('hide');
      setOverlay(true);

      if(createNew) {
        loadEmpty();
      }
      else {
        $('#toggletoms').find('input[name^="tom_toggle"]').prop('checked', false).trigger('change');
      }

      if(loadFromJSON(evt.target.result, true)) {
        modal.find('.modal-title').text('Import erfolgreich');
        modal.find('.modal-body').html('<div class="alert alert-success">Der Import wurde erfolgreich durchgeführt. Die Änderungen müssen zum Übernehmen abgespeichert werden.</div>');
        modal.modal();
      }
      else {
        showError('Importieren', 'Eventuell ist die Datei beschädigt oder im falschen Format!');
      }
      setOverlay(false);
    }
  };

  fileReader.onerror = (e) => {
    showError('Importieren', 'Die gewählte Datei konnte nicht gelesen werden! - ' + e);
  };

  fileReader.readAsText(file);

  setOverlay(false);
}

/**
 * Zeigt einen Dialog zum JSON-Import an
 * @return {undefined}
 */
function showImportDialog() {
  setOverlay(true);

  modal.find('.modal-title').text('Import einer Dokumentation');
  let modalBody = modal.find('.modal-body');
  modalBody.html('<div class="text-center form-group"><label for="importFile">JSON Datei zum Importieren auswählen</label><input type="file" id="importFile" accept=".json,application/json" class="btn center-block hidden" /><div id="dropFile" class="text-center alert alert-info"></div></div>');
  modalBody.find('#dropFile').append('<p class="text-center"><i class="fa fa-file fa-2x"></i></p><p class="text-center">Klicken für Auswahldialog oder Datei per Drag&Drop hineinziehen...</p>');

  modalBody.find('#dropFile').on('dragover', (evt) => {
    evt.preventDefault();
    evt.stopPropagation();
    modalBody.find('#dropFile').removeClass('alert-info').addClass('alert-success');
  });
  modalBody.find('#dropFile').on('dragleave', (evt) => {
    evt.preventDefault();
    evt.stopPropagation();
    modalBody.find('#dropFile').removeClass('alert-success').addClass('alert-info');
  });
  modalBody.find('#dropFile').on('drop', (evt) => {
    evt.preventDefault();
    evt.stopPropagation();

    if(evt.originalEvent.dataTransfer.files.length > 0) {
      importJSON(evt.originalEvent.dataTransfer.files[0]);
    }

    modalBody.find('#dropFile').removeClass('alert-success').addClass('alert-info');

  });
  modalBody.find('#dropFile').click(() => { modalBody.find('#importFile').click(); });

  modalBody.find('#importFile').change((evt) => {
    importJSON(evt.target.files[0]);
  });

  modal.modal();

  setOverlay(false);
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

    // Aktuelle Dokumentation aus Auswahllisten filtern
    if(Number.parseInt(item.value) === loadId) return undefined;

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

  // Tooltips initialisieren
  clone.find('i[data-toggle="tooltip"]').tooltip();

  // DSBOnly Elemente sichtbar machen
  if(userIsDSB) {
    clone.find('.dsbOnly').removeClass('dsbOnly');
  }

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
    let catDelimit = row['CatDelimit'] ? '<i data-toggle="tooltip" title="' + row['CatDelimit'] + '" class="fa fa-question-circle-o fa-lg"></i>' : '';

    if($('#' + targetToggleCategory).length !== 1) {
      toggleHeading.append('<li role="presentation"><a href="#' + targetToggleCategory + '" aria-controls="technical" role="tab" data-toggle="tab">' + row['Category'].trim() + '</a></li>');
      toggleTab.append('<div role="tabpanel" class="tab-pane" id="' + targetToggleCategory + '"></div>');
      $('#' + targetToggleCategory).append('<div class="checkbox"><label><input type="checkbox" data-category="' + row['Category'] + '" data-subcategory="' + row['Subcategory'] + '" data-target="tom_category_' + row['Category'].trim().replace(/\W/g, '_') + '" name="' + targetToggleCategory + '_all" value="1">Gesamte Kategorie ' + catDelimit + '</label></div>');
    }

    if(row['Subcategory'].trim() !== '') {
      let targetSubcategory = ('tom_toggle_' + row['Category'].trim() + '_' + row['Subcategory'].trim()).replace(/\W/g, '_');

      if($('input[name="' + targetSubcategory + '"]').length !== 1) {
        $('#' + targetToggleCategory).append('<div class="checkbox"><label><input type="checkbox" data-category="' + row['Category'] + '" data-subcategory="' + row['Subcategory'] + '" data-target="tom_category_' + (row['Category'].trim() + ' - ' + row['Subcategory'].trim()).replace(/\W/g, '_') + '" name="' + targetSubcategory + '" value="1">' + row['Subcategory'].trim() + ' ' + catDelimit + '</label></div>');
        $('#' + targetToggleCategory).find('input[name="' + targetToggleCategory + '_all"]').closest('div').detach();
      }
    }
  });

  // Ersten Tab der Auswahlliste auf aktiv setzen
  toggleHeading.find('li').first().addClass('active');
  toggleTab.find('div').first().addClass('active');

  // Listener für toggleTOMList()
  toggleTab.find('input[type="checkbox"]').change((evt) => { return toggleTOMList(evt); });

  // Listener zum Aufklappen von Accordions (zur Anpassung der Textarea Höhe)
  $('#tom_accordion').on('shown.bs.collapse', (evt) => {
    $(evt.target).find('textarea').each((idx, elem) => {
      let targetCat = $(elem);
      targetCat.height(targetCat.parent().innerHeight() - 16 - (idx === 0 ? 23 : 22));
    });
  });

  // Tooltips aktivieren
  $('#toggletoms').find('[data-toggle="tooltip"]').tooltip({
    placement: 'auto',
    html: true
  });
}

/**
 * Filtert die Liste der TOMs anhand des gewählten Risikolevels
 * @param  {Number} risklevel Risikolevel des Verfahrens
 * @return {undefined}
 */
function filterTOMList(risklevel) {
  let riskTexts = {
    '1': 'Der Schutzbedarf ' + (modeNum === 2 ? 'des ' + modeName[0] + 's' : 'der ' + modeName[0]) + ' ist normal. Es sind die <em>Basis</em>-Anforderungen umzusetzen.',
    '2': 'Der Schutzbedarf ' + (modeNum === 2 ? 'des ' + modeName[0] + 's' : 'der ' + modeName[0]) + ' ist hoch. Es sind vorrangig die <em>Basis</em>-Anforderungen umzusetzen. Darüber hinaus sollten die <em>Standard</em>-Anforderungen umgesetzt werden.',
    '3': 'Der Schutzbedarf ' + (modeNum === 2 ? 'des ' + modeName[0] + 's' : 'der ' + modeName[0]) + ' ist sehr hoch. Es sind vorrangig die <em>Basis</em>-Anforderungen umzusetzen. Darüber hinaus sollten die <em>Standard</em>-Anforderungen sowie die Anforderungen bei <em>erhöhtem</em> Schutzbedarf umgesetzt werden.'
  };
  let tomRows = $('#tom_accordion').find('tbody tr');

  // Risikotext anzeigen
  $('#riskText').html(riskTexts[risklevel]);

  // TOMs ausblenden
  tomRows.each(function() {
    let tomRisklevel = parseInt($(this).data('risk'));
    if(tomRisklevel <= risklevel) $(this).removeClass('hidden');
    if(tomRisklevel > risklevel) $(this).addClass('hidden');
  });

  $('#tom_accordion').find('div.panel').each((idx, elem) => {
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

      let targetID = 'tom_accordion';
      let targetElem = $('#' + targetID);
      let tomCategory = row['Category'].trim() + (row['Subcategory'] ? ' - ' + row['Subcategory'].trim() : '');
      let targetCategory = 'tom_category_' + tomCategory.replace(/\W/g, '_');
      let tomUrl = row['URL'] ? row['URL'] : '';

      if($('#' + targetCategory).length !== 1) {
        let inserted = false;
        // Alphabetisch an der richtigen Stelle einfügen (anhand Kategorie + Subkategorie)
        targetElem.find('.panel-heading').each(function(idx, elem) {
          if(elem.id.localeCompare('heading_' + targetCategory) === 1) {
            // Hinweis: <span class="snip"></span> ist Platzhalter für Aufteilung des HTMLs bei der PDF-Generierung (MPDF hat ein Limit für die HTML Länge)
            $(elem).parent('div').prev('h6').before('<span class="snip"></span><h6 class="info-text text-ul-dot printOnly hidden"><a href="' + tomUrl + '" target="_blank" rel="noopener noreferrer">' + tomCategory + '</a></h6>');
            $(elem).parent('div').prev('h6').before('<div class="panel panel-default printHide"><div class="panel-heading" role="tab" id="heading_' + targetCategory + '"><h4 class="panel-title"><a role="button" data-toggle="collapse" data-parent="#' + targetID + '" href="#' + targetCategory + '" aria-expanded="true" aria-controls="' + targetCategory + '">' + tomCategory + '</a></h4></div></div>');
            inserted = true;
            return false;
          }
        });

        // Unten einfügen falls korrekte Stelle zum Einfügen nicht gefunden
        if(!inserted) {
          // Hinweis: <span class="snip"></span> ist Platzhalter für Aufteilung des HTMLs bei der PDF-Generierung (MPDF hat ein Limit für die HTML Länge)
          targetElem.append('<span class="snip"></span><h6 class="info-text text-ul-dot printOnly hidden"><a href="' + tomUrl + '" target="_blank" rel="noopener noreferrer">' + tomCategory + '</a></h6>');
          targetElem.append('<div class="panel panel-default printHide"><div class="panel-heading" role="tab" id="heading_' + targetCategory + '"><h4 class="panel-title"><a role="button" data-toggle="collapse" data-parent="#' + targetID + '" href="#' + targetCategory + '" aria-expanded="true" aria-controls="' + targetCategory + '">' + tomCategory + '</a></h4></div></div>');
        }

        // Tabelle vorbereiten und einfügen
        let anforderungDesc = 'Als <em>Sicherheitsanforderung</em> werden Anforderungen für den organisatorischen, personellen, infrastrukturellen und technischen Bereich bezeichnet, deren Erfüllung zur Erhöhung der Informationssicherheit notwendig ist bzw. dazu beiträgt. Eine Sicherheitsanforderung beschreibt also, was getan werden muss, um ein bestimmtes Niveau bezüglich der Informationssicherheit zu erreichen. Wie die Anforderungen im konkreten Fall erfüllt werden, muss in der entsprechenden Sicherheitsmaßnahme beschrieben werden. (<em>Im englischen Sprachraum wird für Sicherheitsanforderungen häufig der Begriff „control“ verwendet.</em>)<br />Der IT-Grundschutz unterscheidet zwischen Basis-Anforderungen, Standard-Anforderungen und Anforderungen bei erhöhtem Schutzbedarf. <em>Basis-Anforderungen</em> (grün) sind fundamental und stets umzusetzen, sofern nicht gravierende Gründe dagegen sprechen. <em>Standard-Anforderungen</em> (gelb) sind für den normalen Schutzbedarf grundsätzlich umzusetzen, sofern sie nicht durch mindestens gleichwertige Alternativen oder die bewusste Akzeptanz des Restrisikos ersetzt werden. <em>Anforderungen bei erhöhtem Schutzbedarf</em> (rot) sind exemplarische Vorschläge, was bei entsprechendem Schutzbedarf zur Absicherung sinnvoll umzusetzen ist.';
        let statusDesc = 'Als Antworten bezüglich des <em>Umsetzungsstatus</em> der einzelnen Anforderungen kommen folgende Aussagen in Betracht:<ul><li><strong>Ja</strong> - Zu der Anforderung wurden geeignete Maßnahmen vollständig, wirksam und angemessen umgesetzt.</li><li><strong>Teilweise</strong> - Die Anforderung wurde nur teilweise umgesetzt.</li><li><strong>Nein</strong> - Die Anforderung wurde noch nicht erfüllt, also geeignete Maßnahmen sind größtenteils noch nicht umgesetzt worden.</li><li><strong>Entbehrlich</strong> - Die Erfüllung der Anforderung ist in der vorgeschlagenen Art nicht notwendig, weil die Anforderung im betrachteten Informationsverbund nicht relevant ist (z. B. weil Dienste nicht aktiviert wurden) oder bereits durch Alternativmaßnahmen erfüllt wurde. Wenn Basisanforderungen nicht erfüllt werden, bleibt grundsätzlich ein erhöhtes Risiko bestehen.</ul>';
        let massnahmeDesc = 'Als <em>Sicherheitsmaßnahme</em> (kurz Maßnahme) werden alle Aktionen bezeichnet, die dazu dienen, um Sicherheitsrisiken zu steuern und um diesen entgegenzuwirken. Dies schließt sowohl organisatorische, als auch personelle, technische oder infrastrukturelle Sicherheitsmaßnahmen ein. Sicherheitsmaßnahmen dienen zur Erfüllung von Sicherheitsanforderungen. Synonym werden auch die Begriffe Sicherheitsvorkehrung oder Schutzmaßnahme benutzt. (<em>Im englischen Sprachraum werden die Begriffe „safeguard“, „security measure“ oder „measure“ verwendet.</em>)';
        let catURL = row['CatURL'] ? '<a href="' + row['CatURL'] + '" target="_blank" rel="noopener noreferrer"><i class="fa fa-external-link" style="cursor: pointer;" data-toggle="tooltip" title="Zum BSI Grundschutz-Katalog"></i></a>' : '';
        let catObjective = row['CatObjective'] ? '<p>' + row['CatObjective'] + ' ' + catURL + '</p>' : '';

        $('#heading_' + targetCategory).after('<div id="' + targetCategory + '" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading_' + targetCategory + '"><div class="panel-body"></div></div>');
        if(catObjective) $('#' + targetCategory).find('.panel-body').append(catObjective);
        $('#' + targetCategory).find('.panel-body').append('<table class="table table-striped table-hover"><thead><tr class="text-nowrap"><th class="col-sm-auto">Anforderung <i data-toggle="tooltip" data-html="true" title="' + anforderungDesc + '" class="fa fa-question-circle-o fa-lg"></i></th><th class="col-sm-5">Beschreibung</th><th class="col-sm-auto">Umsetzung <i data-toggle="tooltip" title="' + statusDesc + '" class="fa fa-question-circle-o fa-lg"></i></th><th class="col-sm-4">Maßnahme <i data-toggle="tooltip" data-html="true" title="' + massnahmeDesc + '" class="fa fa-question-circle-o fa-lg"></i></th></tr></thead><tbody></tbody></table>');
        $('#heading_' + targetCategory + ', #heading_' + targetCategory + ' a').click((evt) => {
          if(evt.target.nodeName === "A") return;
          $(evt.target).find('a').click();
        });
      }

      // Alle TOMs in die passende Tabelle einfügen
      let className = row['Risklevel'] == 1 ? 'success' : row['Risklevel'] == 2 ? 'warning' : 'danger';
      let tomID = row['Identifier'].trim().replace(/ /g, '_');

      // Titel einblenden, falls vorhanden (bei ENISA gibt es nur die Beschreibung)
      let tomContent = row['Title'] ? ('<p class="strong">' + row['Title'] + ' </p><div class="tom_desc">' + row['Description'] + '</div>') : (row['Description']);
      let tableBody = $('#' + targetCategory).find('tbody');

      // Identifier als Link falls URL vorhanden
      let tomIdentifier = row['Identifier'];

      // Umsetzung
      let tomDropdown = $('<select data-tool="selectpicker" name="massnahmen_' + tomID + '"></select>')
        .append('<option value="1">Ja</option>')
        .append('<option value="0" selected>Nein</option>')
        .append('<option value="2">Teilweise</option>')
        .append('<option value="4">Entbehrlich</option>');

      // Tabellenzeile einfügen
      tableBody.append('<tr data-risk="' + row['Risklevel'] + '" class="' + className + '"><td>' + tomIdentifier + '<br /><em><span class="hidden printOnly">' + (row['Risklevel'] == 1 ? 'Basis' : row['Risklevel'] == 2 ? 'Standard' : 'Erhöht') + '</span><em></td><td>' + tomContent + '</td><td>' + tomDropdown[0].outerHTML + '</td><td><textarea rows="5" name="massnahmen_' + tomID + '_kommentar" class="form-control" placeholder="Beschreibung der Sicherheitsmaßnahme, Erläuterung bzw. Begründung"></textarea></td></tr>');

      if(tomContent.includes('ENTFALLEN')) {
        tableBody.find('tr').last().find('textarea').prop('disabled', true);
        tableBody.find('tr').last().find('select').replaceWith('ENTFALLEN');
      }
    });

    // Tooltips aktivieren
    $('#tom_accordion').find('[data-toggle="tooltip"]').tooltip({
      placement: 'auto',
      html: true
    });

    // Selectpicker aktivieren
    $('#tom_accordion').find('select[data-tool="selectpicker"]').selectpicker();

    // Risikofilter anwenden
    filterTOMList(parseInt($('[name=massnahmen_risiko]:checked').val()));
  }
  else {
    // Überprüfen ob Eingaben verloren gehen beim Abwählen
    let hasContent = false;

    $('#' + evtTarget.data('target')).find('textarea').each(function(idx, elem) {
      if($(elem).val() !== '') {
        hasContent = true;
        return false;
      }
    });

    if(!hasContent) {
      $('#' + evtTarget.data('target')).find('select').each(function(idx, elem) {
        if($(elem).val() !== '0') {
          hasContent = true;
          return false;
        }
      });
    }

    if(!hasContent || globalClear) {
      $('#' + evtTarget.data('target')).parent('div').prev('h6').detach();
      $('#' + evtTarget.data('target')).parent('div').detach();
    }
    else {
      let confirmUncheck = confirm('Im Baustein "' + evtTarget.closest('label').text().trim() + '" wurden bereits Massnahmen bearbeitet, deren Inhalt beim Abwählen verloren geht. Wollen Sie den Baustein wirklich abwählen?');

      if(!confirmUncheck) {
        evtTarget[0].checked = true;
        evt.preventDefault();
        return false;
      }
      else {
        $('#' + evtTarget.data('target')).parent('div').prev('h6').detach();
        $('#' + evtTarget.data('target')).parent('div').detach();
      }
    }
  }
}

/**
 * Zeigt den Dokumenten-Verwaltungs-Dialog an.
 *
 * @param  {Number} docID       (optional) Dokumenten-ID
 * @param  {String} fileref    (optional) Dateiname
 * @param  {String} description (optional) Dokumenten-Beschreibung
 * @return {undefined}
 */
function showDocumentAddDialog(docID = -1, fileref = '', description = '') {
  if(loadId === 0) {
    showError('Anhängen eines Dokuments', 'Die Dokumentation muss mindestens einmal abgespeichert werden, bevor Dokumente angehängt werden können.');
    return;
  }
  /**
   * Läd eine ausgewählte Datei hoch als Base64 String.
   *
   * @private
   * @param  {Blob}   file        Datei
   * @param  {Number} docID       (optional) Dokumenten-ID
   * @param  {String} description (optional) Dokumenten-Beschreibung
   * @return {undefined}
   */
  function uploadFile(file, docID = -1, description = '') {
    setOverlay(true);

    if(file === undefined) {
      $.post(backendPath, JSON.stringify({'action': 'updateDocument', 'debug': debug, 'data': {'docid': docID, 'description': description}})).done(function(data) {
        if(data['success']) {
          loadDocuments();
          modal.modal('hide');
        }
        else {
          showError('Anhängen eines Dokuments', data['error']);
        }
        setOverlay(false);
      }).fail((jqXHR, error, errorThrown) => {
        showError('Anhängen eines Dokuments', false, {'jqXHR': jqXHR, 'error': error, 'errorThrown': errorThrown});
        setOverlay(false);
      });
    }
    else {
      let reader = new FileReader();
      reader.readAsDataURL(file);
      reader.onload = function () {
        $.post(backendPath, JSON.stringify({'action': (docID === -1 ? 'addDocument' : 'updateDocument'), 'id': loadId, 'debug': debug, 'data': {'filename': file.name, 'filecontent': reader.result.split(',')[1], 'docid': docID, 'description': description}})).done(function(data) {
          if(data['success']) {
            loadDocuments();
            modal.modal('hide');
          }
          else {
            showError('Anhängen eines Dokuments', data['error']);
          }
          setOverlay(false);
        }).fail((jqXHR, error, errorThrown) => {
          showError('Anhängen eines Dokuments', false, {'jqXHR': jqXHR, 'error': error, 'errorThrown': errorThrown});
          setOverlay(false);
        });
      };
      reader.onerror = function (error) {
        showError('Anhängen eines Dokuments', 'Quelldatei konnte nicht gelesen werden');
      };
    }
  }
  setOverlay(true);

  modal.find('.modal-title').text('Dokumenten-Verwaltung');
  let modalBody = modal.find('.modal-body');
  if(docID === -1) {
    modalBody.html('<div><p>Hier kann ein PDF-Dokument zum Anhängen und eine optionale Beschreibung ausgwählt werden.</p><div class="form-group text-center"><label>Beschreibung</label><textarea class="form-control" id="filedesc" placeholder="Beschreibt den Inhalt des Dokuments"></textarea></div><div class="text-center form-group"><label for="uploadFile">Neues PDF-Dokument zum Anhängen auswählen</label><input type="file" id="uploadFile" accept=".pdf,application/pdf" class="btn center-block hidden" /><div id="dropFile" class="text-center alert alert-info"></div><p><strong>Ausgewählte Datei:</strong> <span id="filename">Keine</span></p><p><button id="filesave" class=btn btn-fill btn-success">Speichern</button></p></div></div>');
  }
  else {
    modalBody.html('<div><p>Bitte wählen Sie ein neues PDF-Dokument zum Ersetzen von "' + fileref + '" aus oder passen Sie die Beschreibung an.</p><div class="form-group text-center"><label>Beschreibung</label><textarea class="form-control" id="filedesc" placeholder="Beschreibt den Inhalt des Dokuments"></textarea></div><div class="text-center form-group"><label for="uploadFile">Neues PDF-Dokument zum Ersetzen auswählen</label><input type="file" id="uploadFile" accept=".pdf,application/pdf" class="btn center-block hidden" /><div id="dropFile" class="text-center alert alert-info"></div><p><strong>Ausgewählte Datei:</strong> <span id="filename">Keine</span></p><p><button id="filesave" class=btn btn-fill btn-success">Speichern</button></p></div></div>');
    $('#filedesc').val(description);
  }

  modalBody.find('#dropFile').append('<p class="text-center"><i class="fa fa-file fa-2x"></i></p><p class="text-center">Klicken für Auswahldialog oder Datei per Drag&Drop hineinziehen...</p>');

  modalBody.find('#filesave').data('file', undefined);

  modalBody.find('#dropFile').on('dragover', (evt) => {
    evt.preventDefault();
    evt.stopPropagation();
    modalBody.find('#dropFile').removeClass('alert-info').addClass('alert-success');
  });
  modalBody.find('#dropFile').on('dragleave', (evt) => {
    evt.preventDefault();
    evt.stopPropagation();
    modalBody.find('#dropFile').removeClass('alert-success').addClass('alert-info');
  });
  modalBody.find('#dropFile').on('drop', (evt) => {
    evt.preventDefault();
    evt.stopPropagation();

    if(evt.originalEvent.dataTransfer.files.length > 0) {
      modalBody.find('#filesave').data('file', evt.originalEvent.dataTransfer.files[0]);
      modalBody.find('#filename').text(evt.originalEvent.dataTransfer.files[0].name);
    }

    modalBody.find('#dropFile').removeClass('alert-success').addClass('alert-info');

  });
  modalBody.find('#dropFile').click(() => { modalBody.find('#uploadFile').click(); });

  modalBody.find('#uploadFile').change((evt) => {
    modalBody.find('#filesave').data('file', evt.target.files[0]);
    modalBody.find('#filename').text(evt.target.files[0].name);
  });

  modalBody.find('#filesave').click((evt) => {
    uploadFile($(evt.target).data('file'), docID, modalBody.find('#filedesc').val());
  });

  modal.modal();

  setOverlay(false);
}

function loadDocuments() {
  $.get(backendPath, { 'action': 'listDocuments', 'id':  loadId, 'debug': debug }).done(function(data) {
    if(!data['success']) {
      showError('Laden der angehängten Dokumente', data['error']);
      return;
    }

    $('#attached_documents').find('tbody').empty();
    data['data'].forEach((val, idx) => {
      $('#attached_documents').find('tbody').append('<tr><td>' + htmlEncode(val['FileRef']) + '</td><td>' + htmlEncode(val['Description']) + '</td><td>' + htmlEncode(val['Date']) + '</td><td class="text-center"><div class="btn-group"><button type="button" class="attached_documents_show btn" data-docid="' + val['DocID'] + '">Anzeigen</button><button type="button" class="attached_documents_edit btn btn-warning" data-docid="' + val['DocID'] + '" data-docdesc="' + val['Description'] + '" data-fileref="' + val['FileRef'] + '"><i class="fa fa-pencil-square-o"></i> Bearbeiten</button><button type="button" class="attached_documents_del btn btn-danger" data-docid="' + val['DocID'] + '"><i class="fa fa-minus"></i> Löschen</button></div></td></tr>');
    });

    $('#attached_documents').find('.attached_documents_show').click((evt) => {
      setOverlay();

      $.post(backendPath, JSON.stringify({'action': 'getDocument', 'debug': debug, 'data': {'docid': parseInt($(evt.target).data('docid'))}})).done((data) => {
        if(!data['success']) {
          showError('Laden der PDF', data['error']);
          return;
        }

        // Base64 Kodierung umkehren und Blob zum Download erstellen
        let pdfData = atob(data['data']['fileContent'].replace(/\s/g, ''));
        let pdfBuffer = new Uint8Array(new ArrayBuffer(pdfData.length));
        for(let i=0; i < pdfData.length; i++) {
          pdfBuffer[i] = pdfData.charCodeAt(i);
        }
        let blob = new Blob([pdfBuffer], {type: "application/pdf"});
        let fileTitle = data['data']['fileName'];

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
    });

    $('#attached_documents').find('.attached_documents_edit').click((evt) => {
      showDocumentAddDialog(parseInt($(evt.target).data('docid')), $(evt.target).data('fileref'), $(evt.target).data('docdesc'));
    });

    $('#attached_documents').find('.attached_documents_del').click((evt) => {
      setOverlay();
      $.post(backendPath, JSON.stringify({'action': 'deleteDocument', 'debug': debug, 'data': {'docid': parseInt($(evt.target).data('docid'))}})).done(function(data) {
        if(!data['success']) {
          showError('Löschen eines angehängten Dokuments', data['error']);
        }
        else {
          loadDocuments();
        }
      }).fail((jqXHR, error, errorThrown) => {
        showError('Löschen eines angehängten Dokuments', false, {'jqXHR': jqXHR, 'error': error, 'errorThrown': errorThrown});
      }).always(() => {
        setOverlay(false);
      });
    });
  }).fail((jqXHR, error, errorThrown) => {
    showError('Laden der angehängten Dokumente', false, {'jqXHR': jqXHR, 'error': error, 'errorThrown': errorThrown});
  });
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
  if(mode === 'wizmeasures') filterTOMList(3);

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
  $('#abschluss_abhaengigkeit, #itverfahren_abhaengigkeit, #verarbeitung_abhaengigkeit, #massnahmen_abhaengigkeit').on('change', 'input[name="abschluss_abhaengigkeit_id[]"], input[name="itverfahren_abhaengigkeit_id[]"], input[name="verarbeitung_abhaengigkeit_id[]"], input[name="massnahmen_abhaengigkeit_id[]"]', function() {
    var idField = $(this);
    var descText = idField.closest('td').next('td').find('textarea');
    if(idField.val() !== '') {
      $.get(backendPath, { 'action': 'get', 'id':  idField.val(), 'debug': debug}).done(function(data) {
        if(!data['success']) {
          showError('Auslesen der Abhängigkeiten', 'Scheinbar existiert eine Abhängigkeit nicht mehr!');
          console.error('Fehler beim Abruf von Abhängigkeiten! Fehler: ' + data['error']);
          descText.val('<Das Verfahren existiert nicht!>');
          idField.closest('td').find('input[name="abschluss_abhaengigkeit_betreiber[]"], input[name="itverfahren_abhaengigkeit_betreiber[]"], input[name="verarbeitung_abhaengigkeit_betreiber[]"], input[name="massnahmen_abhaengigkeit_betreiber[]"]').val('');

          // Disable Link
          idField.closest('tr').find('td:last').find('a').removeAttr('href');
          idField.closest('tr').find('td:last').find('a').attr('disabled', 'disabled');

          // Refresh status
          idField.closest('td').find('.status span').replaceWith('<span>Unbekannt <i data-toggle="tooltip" class="fa fa-question" title="Unbekannt"></i></span>');
          idField.closest('td').find('.status i').tooltip();
          return;
        }
        idField.closest('td').find('input[name="abschluss_abhaengigkeit_name[]"], input[name="itverfahren_abhaengigkeit_name[]"], input[name="verarbeitung_abhaengigkeit_name[]"], input[name="massnahmen_abhaengigkeit_name[]"]').val(htmlDecode(data['data'][0]['Bezeichnung']));
        idField.closest('td').find('input[name="abschluss_abhaengigkeit_betreiber[]"], input[name="itverfahren_abhaengigkeit_betreiber[]"], input[name="verarbeitung_abhaengigkeit_betreiber[]"], input[name="massnahmen_abhaengigkeit_betreiber[]"]').val(htmlDecode(data['data'][0]['Fachabteilung']));

        // Enable Link
        idField.closest('tr').find('a').attr('href', '?id=' + idField.val());
        idField.closest('tr').find('td:last').find('a').removeAttr('disabled');

        descText.val(htmlDecode(data['data'][0]['Beschreibung']));

        // Refresh status
        let statusText = data['data'][0]['Status'] in statusMapping ? statusMapping[data['data'][0]['Status']] : statusMapping['9'];
        let statusSymbol = data['data'][0]['Status'] in statusSymbolMapping ? '<span>' + statusText + ' <i data-toggle="tooltip" class="fa ' + statusSymbolMapping[data['data'][0]['Status']] + '" title="' + statusText + '"></i></span>' : '<span>Unbekannt <i data-toggle="tooltip" class="fa fa-question" title="Unbekannt"></i></span>';
        idField.closest('td').find('.status span').replaceWith(statusSymbol);
        idField.closest('td').find('.status i').tooltip();

        // Hide quick add button
        idField.closest('tr').find('.quick_add_dependency').addClass('hidden');
      }).fail((jqXHR, error, errorThrown) => {
        console.error('Fehler beim Abruf von Abhängigkeiten! HTTP Code: ' + jqXHR.status + ' Fehler: ' + error + ' - ' + errorThrown);
        descText.val('<Fehler beim Abrufen>');
        idField.closest('td').find('input[name="abschluss_abhaengigkeit_betreiber[]"], input[name="itverfahren_abhaengigkeit_betreiber[]"], input[name="verarbeitung_abhaengigkeit_betreiber[]"], input[name="massnahmen_abhaengigkeit_betreiber[]"]').val('');

        // Disable Link
        idField.closest('tr').find('td:last').find('a').removeAttr('href');
        idField.closest('tr').find('td:last').find('a').attr('disabled', 'disabled');

        // Refresh status
        idField.closest('td').find('.status span').replaceWith('<span>Unbekannt <i data-toggle="tooltip" class="fa fa-question" title="Unbekannt"></i></span>');
        idField.closest('td').find('.status i').tooltip();

        // Show quick add button
        idField.closest('tr').find('.quick_add_dependency').removeClass('hidden');
      });
    }
    else {
      descText.val('');
      idField.closest('td').find('input[name="abschluss_abhaengigkeit_betreiber[]"], input[name="itverfahren_abhaengigkeit_betreiber[]"], input[name="verarbeitung_abhaengigkeit_betreiber[]"], input[name="massnahmen_abhaengigkeit_betreiber[]"]').val('');

      // Disable Link
      idField.closest('tr').find('td:last').find('a').removeAttr('href');
      idField.closest('tr').find('td:last').find('a').attr('disabled', 'disabled');

      // Refresh status
      idField.closest('td').find('.status span').replaceWith('<span>Unbekannt <i data-toggle="tooltip" class="fa fa-question" title="Unbekannt"></i></span>');
      idField.closest('td').find('.status i').tooltip();

      // Show quick add button
      idField.closest('tr').find('.quick_add_dependency').removeClass('hidden');
    }
  });

  $('#abschluss_abhaengigkeit, #itverfahren_abhaengigkeit, #verarbeitung_abhaengigkeit, #massnahmen_abhaengigkeit').on('click', 'button.quick_add_dependency', function() {
    let targetIDField = $(this).closest('tr').find('input[type="hidden"]');
    let targetType    = $(this).data('type');
    let targetTitle   = $(this).closest('tr').find('input[type="text"]').first().val();

    modal.find('.modal-title').text('Abhängigkeit anlegen');
    modal.find('.modal-body').html('<div></div>');
    modal.find('.modal-body > div').append('<p>Hier können Sie die Abhängigkeit von ' + modeMapping[targetType][4] + ' noch nicht existierenden ' + modeMapping[targetType][0] + ' vorläufig anlegen, damit die Verknüpfung direkt angelegt werden kann. ' + modeMapping[targetType][2] + ' ' + modeMapping[targetType][0] + ' kann später wie jede andere Dokumentation bearbeitet und ergänzt werden.</p>');
    modal.find('.modal-body > div').append('<p class="alert alert-danger hidden">Bitte füllen Sie alle Felder aus, um die Abhängigkeit anlegen zu können!</p>');
    modal.find('.modal-body > div').append('<div class="form-group"><label>Bezeichnung <i data-toggle="tooltip" title="Eindeutiges Kürzel" class="fa fa-question-circle-o fa-lg"></i> <sup><i style="color: #EB5E28;" class="fa fa-asterisk" aria-hidden="true"></i></sup></label><input type="text" class="form-control" name="quick_title" placeholder="Bsp.: E-Mail Service" required></div>');
    modal.find('.modal-body > div').append('<div class="form-group"><label>Verantwortliche Organisationseinheit <sup><i style="color: #EB5E28;" class="fa fa-asterisk" aria-hidden="true"></i></sup></label><br><input data-tool="typeahead" data-action="searchabteilung" data-minlength="0" type="text" class="form-control" name="quick_department" placeholder="Bsp.: Zentrum für Informationsverarbeitung" required></div>');
    modal.find('.modal-body > div').append('<div class="form-group"><label>1. Ansprechpartner <i data-toggle="tooltip" title="Ansprechpartner für inhaltliche Fragen zur Verarbeitungstätigkeit <br /><br /> Es kann ein Mitarbeiter aus der Liste gewählt oder eine Funktionsbezeichnung (z.B. Leiter Abt. 3) eingetragen werden. Der automatische Zugriff bzw. die E-Mail-Benachrichtigungen funktionieren nur bei Auswahl eines Mitarbeiters aus der Liste!" class="fa fa-question-circle-o fa-lg"></i> <sup><i style="color: #EB5E28;" class="fa fa-asterisk" aria-hidden="true"></i></sup></label><br><input data-tool="typeahead" data-action="searchmitarbeiter" data-minlength="0" data-dynamic="true" data-cache="false" data-hiddenfield="quick_contact_id" type="text" class="form-control" name="quick_contact_name" placeholder="Geben Sie eine Kennung oder einen Namen (min. 4 Zeichen) ein..." required><input type="hidden" name="quick_contact_id"></div>');

    modal.find('input[name="quick_title"]').val(targetTitle);

    modal.find('.modal-body').append('<p class="text-center"><button type="button" class="btn btn-success" id="quickSave">Anlegen & Speichern</button><button type="button" class="ml btn btn-danger" data-dismiss="modal" aria-label="Close">Abbrechen</button></p>');

    // Tooltips, Typeahead und Buttons
    modal.find('.modal-body i').tooltip();
    modal.find('input[data-tool="typeahead"]').each(function(key, value) {
      initTypeahead(value);
    });
    modal.find('#quickSave').click(function() {
      // Werte holen
      let newDoc = {
        'allgemein_typ': targetType,
        'allgemein_bezeichnung': modal.find('input[name="quick_title"]').val(),
        'allgemein_beschreibung': '',
        'allgemein_abteilung': modal.find('input[name="quick_department"]').val(),
        'allgemein_fachlich_name': modal.find('input[name="quick_contact_name"]').val(),
        'allgemein_fachlich_kennung': modal.find('input[name="quick_contact_id"]').val(),
      };

      debugLog('Quick Create', newDoc);

      if(!newDoc['allgemein_typ'] || !newDoc['allgemein_bezeichnung'] || !newDoc['allgemein_fachlich_name'] || !newDoc['allgemein_abteilung']) {
        modal.find('.alert').removeClass('hidden');
        return;
      }

      // Dokumentation anlegen
      setOverlay(true);
      $(this).prop('disabled', true);

      $.post(backendPath, JSON.stringify({'action':'create', 'debug': debug, 'data': newDoc})).done(function(data) {
        if(data['success']) {
          targetIDField.val(parseInt(data['data']['ID']));
          targetIDField.trigger('change');
          modal.modal('hide');
        }
        else {
          showError('Anlegen einer Abhängigkeit', data['error']);
        }
        setOverlay(false);
      }).fail((jqXHR, error, errorThrown) => {
        showError('Anlegen einer Abhängigkeit', false, {'jqXHR': jqXHR, 'error': error, 'errorThrown': errorThrown});
        setOverlay(false);
      });
    });

    modal.modal();
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

    if(canEdit) saveOnServer();

    let htmlForPDF = genHTMLforPDF(true);

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
      showError('Erzeugen der Vorschau-PDF', false, {'jqXHR': jqXHR, 'error': error, 'errorThrown': errorThrown});
      $(this).prop('disabled', false);
      setOverlay(false);
    })
  });

  // Titel anhand Bezeichnung aktualisieren
  $('input[name="allgemein_bezeichnung"]').on('input', (e) => {
    document.title = e.target.value + ' - ' + document.title.split(' - ').slice(-1)[0];
    let statusSymbol = status in statusSymbolMapping ? ' <i data-toggle="tooltip" class="fa ' + statusSymbolMapping[status] + '" title="' + statusMapping[status]  + '"></i>' : '';
    $('#title').text(' Dokumentation von ' + e.target.value).append(statusSymbol).find('i').tooltip();
  });

  // Warnung vor dem Schließen der Webseite, falls ungespeicherte Änderungen vorhanden sind
  $(window).on('beforeunload', (e) => {
    if(!changedValues) return; // nichts zurück geben, um die Meldung zu unterdrücken!

    let msg = 'Es sind noch ungespeicherte Änderungen vorhanden! Diese gehen beim Verlassen verloren. Sind Sie sicher, dass sie die Seite verlassen möchten?'; // Wird von den meisten Browsern mittlerweile ignoriert
    e.preventDefault();
    e.returnValue = msg; // For Chrome
    return msg;
  });

  // Ex-/Import Handler
  $('#exportBtn').removeClass('hidden').click((evt) => {exportJSON()});
  $('#importBtn').removeClass('hidden').click((evt) => {showImportDialog()});

  // Autosave Timer
  autoSaveTimer = window.setInterval(() => {
    if(loadId !== 0 && canEdit && changedValues) {
      console.log('Autosaving...');
      saveOnServer();
    }
  }, autoSaveWait);
  $('#autosaveLabel').html('<i class="fa fa-hourglass"></i> <span>Automatisches Speichern alle ' + (autoSaveWait / 60000) + ' Mins.</span>').removeClass('hidden');

  // Toggle für Autosave
  $('#autosaveLabel').click((evt) => {
    if(autoSaveTimer) {
      window.clearInterval(autoSaveTimer);
      autoSaveTimer = 0;
      $('#autosaveLabel').html('<i class="fa fa-hourglass-o"></i> <span>Automatisches Speichern ausgeschaltet</span>');
    }
    else {
      autoSaveTimer = window.setInterval(() => {
        if(loadId !== 0 && changedValues) {
          console.log('Autosaving...');
          saveOnServer();
        }
      }, autoSaveWait);
      $('#autosaveLabel').html('<i class="fa fa-hourglass"></i> <span>Automatisches Speichern alle ' + (autoSaveWait / 60000) + ' Mins.</span>');
    }
  });

  // Button für neue angehängte Dokumente
  $('#attached_documents_add').click(() => {
    showDocumentAddDialog();
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
  $('form').on('change', '[name!=""]', (e) => { changedValues = true; changedFields.push(e.target.name); e.stopPropagation() });

  // DSB Elemente anzeigen
  if(userIsDSB) {
    $('.dsbOnly').removeClass('dsbOnly');
  }

  debugLog('Setup beendet!');

  // Timer beenden
  console.timeEnd('Gesamte Vorbereitungszeit für Wizard');
});
