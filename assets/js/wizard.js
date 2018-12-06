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
 * Gibt an, ob Eingaben geändert wurden seit dem letzten Laden/Speichern
 * @global
 * @type {Boolean}
 */
var changedValues = false;
/**
 * Sammlung von Promises für AJAX-Anfragen, die zu Beginn durchgeführt werden müssen
 * @global
 * @type {Array}
 */
var promises = [];


// Mappings
/**
 * Mapping für die Rechtsgrundlagen-Vorschläge
 * @global
 * @type {Array}
 */
var lawsMapping = [];

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
var validator = $('.wizard-card form').validate();

/*
 * Notwendige Variablen vom Server holen
 */
promises[0] = $.getJSON(backendPath + '?action=getlaws' + (debug ? '&debug=true' : '')).done((data) => {
  if(!data['success']) {
    showError('Holen der Rechtsgrundlagen', data['error']);
    return;
  }
  version = data['version'];
  lawsMapping = data['data'];
}).fail((jqXHR, error, errorThrown) => {
  showError('Holen der Rechtsgrundlagen', 'HTTP Code: ' + jqXHR.status + ' Fehler: ' + error + ' - ' + errorThrown);
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
 * Wird ausgeführt, falls ein Tabe geklickt wird (genutzt in {@link paper-bootstrap-wizard.js})
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
  var $valid = validator.form();
  if (!$valid) {
    validator.focusInvalid();
    return false;
  }

  debugLog('Speichere Tab ' + $(tab).text().trim());

  // Nur neu abspeichern, wenn etwas geändert wurde
  if(changedValues) {
    saveOnServer();
    changedValues = false;
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
    changedValues = false;
  }

  if(!savePromise) {
    setOverlay(false);
    return;
  }
  else {
    savePromise.then(() => {
      // Bestätigung zum Abschluss erfragen
      var confirmFinish = confirm('Wollen Sie das Verfahren wirklich abschließen? Im Anschluss wird eine PDF-Version generiert und per E-Mail an alle eingetragenen Ansprechpartner und Ersteller verschickt.');
      if(!confirmFinish) {
        setOverlay(false);
        return;
      }

      // HTML-Code für PDF-Version generieren
      var pdfCode = genHTMLforPDF();

      $.post(backendPath, JSON.stringify({'action': 'finish', 'debug': debug, 'id':  loadId, 'data': { 'title': $('[name="allgemein_bezeichnung"]').val(), 'status': 2, 'pdfCode': pdfCode, 'lastupdate': $('[name="meta_lastupdate"]').val()} })).done((data) => {
        if(!data['success']) {
          showError('Abschließen des Verfahrens', data['error']);
          return;
        }
        modal.find('.modal-title').text('Verfahrensdokumentation abgeschlossen');
        var modalBody = modal.find('.modal-body');
        modalBody.html('<p>Hiermit wurde die Verfahrensdokumentation als abgeschlossen gekennzeichnet.</p>');
        if(data['genpdf'] && data['genmail']) modalBody.append('<p class="alert alert-success">Die eingetragenen Ansprechpartner wurden per E-Mail informiert und haben eine PDF-Version der Dokumentation erhalten.</p>');
        if(data['gentxt']) modalBody.append('<p class="alert alert-success">Es wurde ein Include-Baustein zur Verwendung in Webseiten bzw. Webanwendungen als Ergänzung zur zentralen Datenschutzerklärung erstellt. Sie können den passenden Text im Webserverpark mit Hilfe von SSI per <code>&lt;!--#include virtual="/sys/secdoc/' + loadId + '.txt" --&gt;</code> bzw. PHP per <code>readfile("/www/data/sys/includes/secdoc/' + loadId + '.txt")</code> einbinden.</p>');
        if(!data['genpdf']) modalBody.append('<p class="alert alert-danger">Bei der Erstellung der PDF-Datei ist ein Fehler aufgetreten, bitte versuchen Sie es später erneut.</p>');
        if(!data['genmail']) modalBody.append('<p class="alert alert-danger">Beim Verschicken der E-Mail ist ein Fehler aufgetreten, bitte versuchen Sie es später erneut.</p>');
        if(!data['gentxt']) modalBody.append('<p class="alert alert-danger">Beim Erzeugen des Informations-Textes zum Einbinden in Webseiten ist ein Fehler aufgetreten, bitte versuchen Sie es später erneut.</p>');
        modalBody.append('<p>Die Dokumentation kann jederzeit aktualisiert werden und über den "Abschluss"-Knopf eine neue E-Mail sowie PDF-Datei erzeugt werden.</p>');
        modalBody.append('<p><button type="button" class="center-block btn btn-primary" data-dismiss="modal" aria-label="Close">Schließen</button></p>');
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
  modal.find('.modal-title').text('Liste bestehender Verfahren');
  var modalBody = modal.find('.modal-body');
  modalBody.html('<p>Wählen Sie ein Verfahren aus der Liste, um es zu bearbeiten oder einzusehen, oder legen Sie ein neues Verfahren an. Sie können nur Verfahren bearbeiten, für die Ihre Nutzerkennung als fachlicher oder technischer Verantwortlicher oder als Ersteller hinterlegt ist.</p>');
  modalBody.append('<h6>Meine Verfahren</h6><div class="col-sm-12 table-responsive"><table id="eigeneVerfahren" class="table table-striped table-hover btn-table"><thead><tr><th class="no-sort no-print"></th><th>Bezeichnung</th><th>Organisationseinheit</th><th>Status</th><th>Letzter Bearbeiter</th><th>Letzte Aktualisierung</th><th class="no-sort none"></th></tr></thead><tbody></tbody></table></div>');

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
      var currId = parseInt(data['data'][c]['ID']);
      var newEntry = $('<tr></tr>');
      data['data'][c]['Status'] = data['data'][c]['Status'] in statusMapping ? statusMapping[data['data'][c]['Status']] : statusMapping['9'];

      // Editierbare/Eigene Verfahren
      if(data['data'][c]['Editierbar'] === true) {
        //newEntry = $('<tr><td data-sort="' + data['data'][c]['Bezeichnung'] + '">' + data['data'][c]['Bezeichnung'] + ' <i data-toggle="tooltip" class="fa fa-info-circle" title="' + data['data'][c]['Beschreibung'] + '"></i><br><a class="btn" href="?id=' + currId + (debug ? '&debug=true' : '') + '" target="_blank"><i class="fa fa-edit"></i> Bearbeiten</a></td><td data-sort="' + data['data'][c]['Fachabteilung'] + '">' + data['data'][c]['Fachabteilung']  + '<br><a class="btn" href="?copy=' + currId + '" target="_blank"><i class="fa fa-copy"></i> Kopieren</a></td><td>' + data['data'][c]['Status'] + '</td><td>' + data['data'][c]['LetzterBearbeiter'] + ' <i class="fa fa-info-circle userdetail" data-user="' + data['data'][c]['LetzterBearbeiter'] + '" title=""></i></td><td>' + data['data'][c]['Aktualisierung'] + '<br><button type="button" data-id="' + currId +'" class="btn del btn-danger" ' + (data['data'][c]['Löschbar'] === true ? '' : 'disabled')  + '><i class="fa fa-minus"></i> Löschen</button></td></tr>');
        newEntry.append('<td style="width: 16px;"></td>');
        newEntry.append('<td>' + data['data'][c]['Bezeichnung'] + ' <i data-toggle="tooltip" class="fa fa-info-circle" title="' + data['data'][c]['Beschreibung'] + '"></i></td>');
        newEntry.append('<td>' + data['data'][c]['Fachabteilung']  + '</td>');
        newEntry.append('<td>' + data['data'][c]['Status'] + '</td>');
        newEntry.append('<td>' + data['data'][c]['LetzterBearbeiter'] + ' <i data-toggle="tooltip" class="fa fa-info-circle" title="' + (data['data'][c]['BearbeiterDetails'] ? data['data'][c]['BearbeiterDetails'] : '<Keine Details vorhanden>') + '"></i></td>');
        newEntry.append('<td>' + data['data'][c]['Aktualisierung'] + '</td>');
        newEntry.append('<td><div class="btn-group inline"><a class="btn" href="?id=' + currId + (debug ? '&debug=true' : '') + '" target="_blank"><i class="fa fa-edit"></i> Bearbeiten</a><a class="btn" href="?copy=' + currId + '" target="_blank"><i class="fa fa-copy"></i> Kopieren</a><button type="button" data-id="' + currId + '" class="btn pdfdownload" ' + (data['data'][c]['PDF'] ? '' : 'disabled') + '>PDF anzeigen</button></div> <button type="button" data-id="' + currId +'" class="btn del btn-danger" ' + (data['data'][c]['Löschbar'] === true ? '' : 'disabled')  + '><i class="fa fa-minus"></i> Löschen</button></td>');
        modalBody.find('#eigeneVerfahren tbody').append(newEntry);
      }
    }

    // Handler für PDF-Anzeige
    modalBody.on('click', 'button.pdfdownload', function(event){
      getPDFFromServer($(event.target).data('id'));
    });

    // Handler für das Löschen von Verfahren
    modalBody.on('click', 'button.del', function() {
      var confirmed = confirm('Achtung: Von diesem Verfahren könnten andere Verfahren abhängen! Wollen Sie das Verfahren wirklich löschen?');
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
      modalBody.append('<p><span><button type="button" class="btn loadEmpty btn-success">Neues Verfahren anlegen</button></span>' + (userIsDSB ? '<span class="pull-right"><a class="btn" href="?page=dsbview' + (debug ? '&debug=true' : '') + '">DSB Ansicht</a></span>' : '') + '</p>');
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
      } else {
        output[name].push(inp.val());
      }
    } else {
      if (inp[0].type === 'checkbox') {
        output[name] = inp.prop('checked') ? inp.val() : '0';
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
      else {
        debugLog('Keine oder mehrere Eingabefelder mit Namen "' + val + '" gefunden! Überspringe...');
      }
    }
  });
  $('select.selectpicker, select[data-tool=selectpicker]').selectpicker('refresh');
  $('select.selectpicker, select[data-tool=selectpicker]').selectpicker('render');
}

/**
 * Sendet die aktuellen Eingaben an den Server und versucht diese abzuspeichern
 * @returns {Promise|Boolean} Sollte das Formular fehldene Elemente enhalten false, sonst das Promise-Objekt der Ajax-Anfrage
 */
function saveOnServer() {
  setSaveLabel('saving');
  var idField = $('input[name=meta_id]');
  var currentState = saveAsObject();
  if(!validator.form()) {
    setSaveLabel('failed');
    var errorList = $('<ul></ul>');
    $(validator.toShow).each(function() {
      errorList.append('<li>' + $(this).closest('.form-group').find('label').first().text().trim() + '</li>');
    });
    showError('Speichern des Verfahrens', 'Es wurden nicht alle notwendigen Felder ausgefüllt:' + errorList[0].outerHTML);
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
      }
      else {
        showError('Anlegen eines Verfahrens', data['error']);
        setSaveLabel('failed');
      }
    }).fail((jqXHR, error, errorThrown) => {
      showError('Anlegen eines Verfahrens', 'HTTP Code: ' + jqXHR.status + ' Fehler: ' + error + ' - ' + errorThrown);
      setSaveLabel('failed');
    });
  }
  // Falls die ID != 0 ist, wird ein vorhandenes Verfahren aktualisiert
  else {
    return $.post(backendPath, JSON.stringify({'action':'update', 'debug': debug, 'id': loadId, 'data': currentState})).done(function(data) {
      if(!data['success']) {
        showError('Speichern des Verfahrens', data['error']);
        setSaveLabel('failed');
      }
      else {
        setSaveLabel('saved', new Date(data['data']['Date']));
        history.replaceState({}, document.title, window.location.href.split('?')[0] + '?id=' + loadId);
      }
    }).fail((jqXHR, error, errorThrown) => {
      showError('Speichern des Verfahrens', 'HTTP Code: ' + jqXHR.status + ' Fehler: ' + error + ' - ' + errorThrown);
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
        showError('Laden eines Verfahrens', 'Kein JSON-Inhalt zum Laden verfügbar!');
        return;
      }
      loadFromJSON(data['data'][0]['JSON']);
      loadId = parseInt(data['data'][0]['ID']);
      $('input[name="meta_id"]').val(loadId);
      $('input[name="meta_lastupdate"').val(data['data'][0]['Aktualisierung']);
      if(!data['data'][0]['Editierbar']) {
        $('input, textarea, select, button[id!="showVerfahrensliste"]').prop('disabled', true);
      }
      setSaveLabel('saved', new Date(data['data'][0]['Aktualisierung']));
      document.title = data['data'][0]['Bezeichnung'] + ' - ' + document.title;
      changedValues = false;
    }
    else {
      loadId = 0;
      showError('Laden eines Verfahrens', data['error']);
    }
  }).fail((jqXHR, error, errorThrown) => {
    loadId = false;
    showError('Laden eines Verfahrens', 'HTTP Code: ' + jqXHR.status + ' Fehler: ' + error + ' - ' + errorThrown);
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
      showError('Kopieren eines Verfahrens', data['error']);
    }
  }).fail((jqXHR, error, errorThrown) => {
    showError('Kopieren eines Verfahrens', 'HTTP Code: ' + jqXHR.status + ' Fehler: ' + error + ' - ' + errorThrown);
  }).always(() => { setOverlay(false); console.timeEnd('Verfahren kopieren'); });
}

/**
 * Löscht ein Verfahren vom Server
 * @param {type} id Eindeutige ID des Verfahrens
 * @returns {undefined}
 */
function deleteFromServer(id) {
  $.get(backendPath, { 'action': 'delete', 'id': id, 'debug': debug }).done(function(data) {
    if(!data['success']) {
      showError('Löschen eines Verfahrens', data['error']);
    }
  }).fail((jqXHR, error, errorThrown) => {
    showError('Löschen eines Verfahrens', 'HTTP Code: ' + jqXHR.status + ' Fehler: ' + error + ' - ' + errorThrown);
  });
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
  toSend.append('<h2 class="text-center">Dokumentation der Verarbeitungstätigkeit</h2>');
  toSend.append('<h3 class="text-center">' + $('[name="allgemein_bezeichnung"]').val() + '</h3>');
  toSend.append('<h4 class="pull-left" style="color: darkgray;">Letzte Aktualisierung: ' + $('#saveTime').text() + '</h4>');
  toSend.append('<h4 class="pull-right" style="color: darkgray;">Lfd. Nr.: ' + loadId + '</h4>');

  /* Daten aus Wizard einsammeln */
  $('.tab-content .tab-pane').each(function(idx) {
    toSend.append($(this).clone().addClass('active'));
  });

  /* Maßnahmen Eingabefelder aus Bootstrap-Accordion holen */
  toSend.find('textarea[name="massnahmen_vertraulichkeit"], textarea[name="massnahmen_integritaet"], textarea[name="massnahmen_verfuegbarkeit"]').each(function() {
    $(this).closest('.printHide').before($(this));
  });

  /* Link hinzufügen */
  var link = window.location.href.split('?')[0].replace(/x?sso/i, 'www') + '?id=' + loadId;
  toSend.append('<div class="text-center"><h5 class="info-text text-ul">Verfahren online einsehen</h5><p><a href="' + link + '">' + link + '</a></p></div>');

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

  /* Eingabeelemente durch grau hinterlegten Text ersezten */
  toSend.find('input[type!=checkbox][type!=hidden], textarea, select').replaceWith(function() { if($(this).parents('td').length>0) { return '<p>' + $(this).val() + '</p>'; } else { return '<p style="background-color: lightyellow">' + $(this).val() + '</p>'; }});

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
      if(checkbox.attr('name') === 'abschluss_datenschutz_folgeabschaetzung') {
        checkbox.parent().replaceWith('<label><span style="color: red;">&#10006;</span> Es ist keine Datenschutzfolgeabschätzung notwendig</label>');
        return;
      }

      checkbox.parent().parent().addClass('hidden');
      if(['allgemein_verantwortlich_extern', 'datenzugriff_empfaenger_extern'].includes(checkbox.attr('name'))) {
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

  // Überprüfen, ob Typeahead auf dem Element nicht schon initialisiert wurde
  if(nodeData['typeahead']) {
    return null;
  }

  // Überprüft ob eine explizite URL gegeben ist, sonst wird die hinterlegte verwaltung.php genutzt
  if(nodeData['url'] === undefined) {
    nodeData['url'] = backendPath + '?action=' + nodeData['action'] + (debug ? '&debug=true' : '') + '&search=';
    nodeData['path'] = 'data';
  }
  else {
    nodeData['path'] = '';
  }

  // Fügt einen onChange-Listener an, damit das versteckte Feld geleert wird bei Änderung
  if(nodeData['hiddenfield']) {
    node.change(function() {
      $(this).closest('.typeahead__container').parent().find('input[name="' + nodeData['hiddenfield'] + '"]').val('').trigger('change');
    });
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
      if(item[itemKeys[c]] !== null && item[itemKeys[c]].toLowerCase().search(lowcaseQuery) > -1) {
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
          if(item[itemKeys[k]].toLowerCase().search(split[c]) > -1) {
            foundinKeys = true;
            break;
          }
        }
        if(!foundinKeys) break;
      }
      return found;
    }
    return undefined;
  };

  /**
   * Sortiert die Auswahlmöglichkeiten in Typeahead nach der Position des ersten Suchbegriffs
   * @private
   * @param {Object} node  Typeahead-Node
   * @param {array} data   Zu sortierende Daten
   * @param {String} group Anzeigegruppe
   * @param {String} path  Pfad zum Label
   * @returns {array} Sortierte/Modifizierte Elemente zur Anzeige
   */
  function onPopulateSourceCustom(node, data, group, path) {
    var search = this.query.trim().split(' ')[0].toLowerCase();
    data.sort((a,b) => {
        var foundA = a['label'].toLowerCase().search(search);
        var foundB = b['label'].toLowerCase().search(search);
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
        [nodeData['url']]: {
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
      onClick: function(node, a, item, event) {
        if(nodeData['hiddenfield']) {
          $(node).closest('.typeahead__container').parent().find('input[name="' + nodeData['hiddenfield'] + '"]').val(item.value).trigger('change');
        }
      },
      onCancel: function(node, a, item, event) {
        if(nodeData['hiddenfield']) {
          $(node).closest('.typeahead__container').parent().find('input[name="' + nodeData['hiddenfield'] + '"]').val('').trigger('change');
        }
      },
      onSubmit: function(node, form, item, event) {
        event.preventDefault();
      }
    }
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
    deselectAllText: 'Alle abwählen',
    selectAllText: 'Alle auswählen'
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
      $('select.nutzt_' + table + '_nummer option[value=' + currNum + ']').text(currNum + ' - ' + currVal);
      endlessTables.forEach(function(tempTable) {
        $(endlessTemplates[tempTable]).find('select.nutzt_' + table + '_nummer option[value=' + currNum + ']').text(currNum + ' - ' + currVal); // Templates aktualisieren
      });

      // Selectpicker aktualisieren
      $('select.nutzt_' + table + '_nummer').selectpicker('refresh');
    });

    // Delete Funktion an den neuen Button binden
    clone.find('.' + table + '_del').click(function(evt, force = false) {
      var currNum = parseInt($(this).closest('tr').find('input[name="' + table + '_nummer[]"]').val());
      var usedIn = $('select.nutzt_' + table + '_nummer option[value=' + currNum + ']:selected').closest('table');
      // Sollte die zu löschende Zeile noch referenziert werden, wird das Löschen unterbunden
      if(usedIn.length > 0 && !force) {
        modal.find('.modal-title').text('Eintrag kann nicht gelöscht werden');
        modal.find('.modal-body').html('<p>Der gewählte Eintrag kann nicht gelöscht werden, da er noch in folgenden Tabellen verwendet wird:</p><ul></ul>');
        usedIn.each(function() {
          modal.find('.modal-body ul').append('<li>' + $(this).closest('div').prevAll().find('h5, h6').last().text() + '</li>'); // Listet die Titel aller Tabellen auf, in denen die jeweilige Zeile referenziert wird
        });
        modal.find('.modal-body').append('<p><button type="button" class="center-block btn btn-primary" data-dismiss="modal" aria-label="Close">Schließen</button></p>');
        modal.modal();
      }
      // Wird die zu löschende Zeile nicht referenziert, wird sie gelöscht
      else {
        $('select.nutzt_' + table + '_nummer option[value=' + currNum + ']').detach();
        endlessTables.forEach(function(tempTable) {
          $(endlessTemplates[tempTable]).find('select.nutzt_' + table + '_nummer option[value=' + currNum + ']').detach(); // Zeile in den Optionen der Templates, die sie nutzen, löschen
        });

        // Nummerierung aller folgenden Tabellenzeilen anpassen
        var rows = $(this).closest('tbody').find('tr');
        for(var c = currNum; c < endlessCounts[table]; c++) {
          $(rows[c]).find('input[name="' + table + '_nummer[]"]').val(c);
          var currLabel = $(rows[c]).children('td:nth-child(2)').children('input[type=text], textarea').first().val();
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
      }
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

debugLog('Beginne Setup...');

// Abwarten, bis alle notwendigen Daten über AJAX-Requests geholt wurden
Promise.all(promises).then(function() {
  if(lawsMapping.length === 0) {
    console.error('Kann ohne Rechtsgrundlagen nicht fortfahren! Beende...');
    return;
  }

  // Rechtsgrundlagen zur Auswahl hinzufügen
  lawsMapping.forEach(function(row) {
    $('[name="daten_grundlagen_bezeichnung[]"]').append('<option value="' + row['ID'] + '">' + row['Artikel'] + ' - ' + row['Beschreibung'] + '</option>');
  });

  /*
   * Dynamische Inhalte initialisieren
   */
  debugLog('Initialisiere dynamische Inhalte...');
  console.time('Dynamische Inhalte initialisieren');
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
    placement: 'auto'
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
  $('#showVerfahrensliste').click(function() { $(this).prop('disabled', true); showVerfahrensliste();});

  // Manuelles Speichern über das Speicher-Status-Label
  $('#successLabel, #savingLabel, #failedLabel').click(function() {saveOnServer();}).css({'cursor': 'pointer'});

  // Setzt den Status zurück auf "In Bearbeitung", falls Ansprechpartner geändert werden
  $('[name="allgemein_fachlich_kennung"], [name="allgemein_technisch_kennung"]').change(() => {
    $.post(backendPath, JSON.stringify({'action':'updateStatus', 'id': loadId, 'data': { 'status': '0' }, 'debug': debug})).done((data) => {
      if(!data['success']) {
        console.error('Fehler beim Zurücksetzen des Status! Fehler: ' + data['error']);
        return;
      }
      if(data['changed']) {
        modal.find('.modal-title').text('Status zurückgesetzt');
        modal.find('.modal-body').html('<p>Durch das Ändern von Ansprechpartnern wurde der Status des Verfahrens zurück auf "In Bearbeitung" gesetzt.</p><p>Das Verfahren muss erneut abgeschlossen werden, um es als "In Betrieb" zu kennzeichnen und die neuen Ansprechpartner zu informieren.</p>');
        modal.find('.modal-body').append('<p><button type="button" class="center-block btn btn-primary" data-dismiss="modal" aria-label="Close">Schließen</button></p>');
        modal.modal();
      }
    }).fail((jqXHR, error, errorThrown) => {
      console.error('Fehler beim Zurücksetzen des Status! HTTP Code: ' + jqXHR.status + ' Fehler: ' + error + ' - ' + errorThrown);
    });
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
