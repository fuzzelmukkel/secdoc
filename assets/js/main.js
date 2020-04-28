/**
 * main.js - Zentrale Funktionen für das secdoc-Tool
 *
 * @file Kapselt die zentralen Funktionen und steuert das Laden der Unterseiten
 *
 * @requires assets/js/jquery-3.4.1.min.js
 *
 * @author Thorsten Küfer <thorsten.kuefer@uni-muenster.de>
 * @author Dustin Gawron <dustin.gawron@uni-muenster.de>
 * @copyright (c) 2018-2020 Westfälische Wilhelms-Universität Münster
 * @license AGPL-3.0-or-later <https://www.gnu.org/licenses/agpl.html>
 */

// Zeitmessung starten
console.time('Gesamte Vorbereitungszeit');

/*
 * Globale Variablen initialisieren
 */
// Allgemeine Variablen
/**
 * Steuert die Debug-Ausgaben
 * @global
 * @type {Boolean}
 */
var debug = (GetURLParameter('debug') === 'true' || GetURLParameter('debug') == 1) ? true : false;

/**
 * Aktuelle Versions-Nummer
 * @global
 * @type {String}
 */
var version = '';

/**
 * Angabe der Ziel-Unterseite
 * @global
 * @type {String}
 */
var page = ['dsbview', 'home', 'login', 'wizit', 'wizproc', 'wizapp'].includes(GetURLParameter('page')) ? GetURLParameter('page') : 'home';

/**
 * ID der Dokumentation, die geladen werden soll
 * @type {Number}
 */
var loadIdMain = GetURLParameter('id') === false ? 0 : parseInt(GetURLParameter('id'));

/**
 * ID der Dokumentation, die kopiert werden soll
 * @type {Number}
 */
var copyIdMain = GetURLParameter('copy') === false ? 0 : parseInt(GetURLParameter('copy'));

/**
 * Gibt an, ob der Nutzer ein Datenschutzbeauftragter ist
 * @global
 * @type {Boolean}
 */
var userIsDSB = false;

/**
 * Gibt an, ob der Nutzer die Rolle eines Datenschutzbeauftragten annehmen kann
 * @global
 * @type {Boolean}
 */
var userCanDSB = false;

/**
 * Relativer Pfad zur verwaltung.php
 * @global
 * @type {String}
 */
var backendPath = 'assets/ajax/verwaltung.php';

/**
 * JQuery Object des Modal-Elements
 * @global
 * @type {jQuery-Object}
 */
var modal = $('#modalWindow'); // Modal-Fenster für Meldungen/Fehler

/**
 * Promise für die Abfrage des eingeloggten Nutzers
 * @global
 * @type {Promise}
 */
var getUserPromise = Promise.resolve();

// Mappings
/**
 * Mapping für die Stati von Verfahren
 * @global
 * @type {Object}
 */
var statusMapping = {'0': 'In Bearbeitung', '1': 'Zur Freigabe', '2': 'In Betrieb', '9': 'Unbekannt'};

/*
 * Debug Modus initialisieren
 */
var reqNumber = 0;
if(debug) {
  $('#debug').removeClass('hidden');
  // Zeitmessung und Debugausgaben für Ajax-Anfragen initialisieren
  $(document).ajaxSend((event, request, settings) => { console.time('Anfragezeit für Request #' + reqNumber + ' - ' + settings.type + ':' + settings.url); settings.reqNumber = reqNumber; reqNumber++; });
  $(document).ajaxComplete((event, request, settings) => {
    console.timeEnd('Anfragezeit für Request #' + settings.reqNumber + ' - ' + settings.type + ':' + settings.url);
    debugLog(null, {'settings.url': settings.url, 'settings.type': settings.type, 'settings.async': settings.async, 'settings.crossDomain': settings.crossDomain, 'request.readyState': request.readyState, 'request.responseText': request.responseText, 'request.status': request.status});
    if(request.responseJSON && request.responseJSON['debug']) {
      $('#debug').find('pre').append(request.responseJSON['debug']);
    }
  });
}

/*
 * Ausgabe wichtiger Variablen zu Debug-Zwecken
 */
debugLog('URL Parameter:', {'debug': debug});
debugLog('Backend Pfade:', {'verwaltung.php': backendPath});

/*
 * Hilfsfunktionen
 */
/**
 * Liest Parameter aus der URL
 * @see {@link https://stackoverflow.com/a/21903119 Stackoverflow}
 * @example
 * // Gibt 0 zurück, wenn die aktuelle URL "...?id=0" ist
 * GetURLParamter('id');
 * @param {String} sParam Parametername
 * @returns {String|Boolean} Gibt den Wert des Parameters zurück oder false, falls der Parameter nicht gesetzt ist
 */
function GetURLParameter(sParam) {
    var sPageURL = window.location.search.substring(1);
    var sURLVariables = sPageURL.split('&');
    for (var i = 0; i < sURLVariables.length; i++) {
        var sParameterName = sURLVariables[i].split('=');
        if (sParameterName[0] === sParam) return sParameterName[1];
    }
    return false;
}

/**
 * Ersetzt Symbole (&, <, > ", ') durch HTML-Entities, um HTML-Code Injection zu verhindern
 * @see {@link https://stackoverflow.com/a/6234804 Stackoverflow}
 * @example
 * // Gibt "&lt;h1&gt;" zurück
 * htmlEncode('<h1>');
 * @param {String} unsafe Eingabestring
 * @return {String} Eingabestring mit ersetzten Symbolen
 */
function htmlEncode(unsafe) {
    return unsafe
         .replace(/&/g, "&amp;")
         .replace(/</g, "&lt;")
         .replace(/>/g, "&gt;")
         .replace(/"/g, "&quot;")
         .replace(/'/g, "&#039;");
}

/**
 * Ersetzt HTML-Entities durch Symbole, um sie korrekt darzustellen in Eingabefeldern
 * @see {@link https://stackoverflow.com/a/34064434 Stackoverflow}
 * @example
 * // Gibt "<h1>" zurück
 * htmlDecode('&lt;h1&gt;');
 * @param {String} input Eingabestring
 * @return {String} Eingabestring mit ersetzten HTML-Entities
 */
function htmlDecode(input) {
  var doc = new DOMParser().parseFromString(input, "text/html");
  return doc.documentElement.textContent;
}

/**
 * Generiert eine Debug-Ausgabe, falls der globale debug-Parameter 'true' ist
 * @param {Object} msg Ausgabenachricht (kann null sein) (wird mittels console.log(msg) ausgegeben)
 * @param {Object} obj (optional) Objekt, was formatiert ausgegeben werden soll (wird mittels console.table(obj) ausgegeben)
 * @return {undefined}
 */
function debugLog(msg, obj = null) {
  if(!debug) return;
  if(msg !== null) console.debug(msg);
  if(obj !== null) console.table(obj);
}

/**
 * Setzt das Label zum aktuellen Speicher-Status
 * @param {String} action Aktueller Speicherstatus
 * @param {Date} currDate (optional) Aktuelles Datum
 * @returns {undefined}
 */
function setSaveLabel(action, currDate = new Date()) {
  var options = { year: 'numeric', month: 'numeric', day: 'numeric', hour: 'numeric', minute: 'numeric', second: 'numeric' };
  var saveTime = currDate.toLocaleDateString('de-DE', options);
  $('#successLabel, #savingLabel, #failedLabel, #refreshedLabel').addClass('hidden');
  switch(action) {
    case 'saving':
      $('#savingLabel').removeClass('hidden');
      break;

    case 'saved':
      $('#saveTime').text(saveTime);
      $('#successLabel').removeClass('hidden');
      $('input[name="meta_lastupdate"]').val(saveTime);
      break;

    case 'failed':
      $('#failedLabel').removeClass('hidden');
      break;

    case 'refreshed':
      $('#loadTime').text(saveTime);
      $('#refreshedLabel').removeClass('hidden');
      break;
  }
}

/**
 * Aktiviert oder daktiviert das Overlay während Ladevorgängen
 * @param {Boolean} active True aktiviert das Overlay, false deaktiviert es
 * @returns {undefined}
 */
function setOverlay(active = true) {
  if(active) $('.loadingOverlay').removeClass('hidden');
  if(!active) $('.loadingOverlay').addClass('hidden');
}

/**
 * Zeigt dem Nutzer eine Fehlermeldung an
 * @param {String} action    Aktion, bei der der Fehler aufgetreten ist
 * @param {String} message   (optional) Fehlermeldung
 * @param {Object} httperror (optional) Objekt der Form {'jqXHR':..., 'error':..., 'errorThrown':...} für HTTP Fehlermeldungen
 * @returns {undefined}
 */
function showError(action, message = false, httperror = false) {
  console.error('Fehler beim ' + action + ' - Fehlermeldung: ' + message + (httperror ? (' - HTTP Error: ' + httperror) : ''));
  modal.find('.modal-title').text('Fehler');
  if(message) {
    modal.find('.modal-body').html('<div class="alert alert-danger"><h3>Beim ' + action + ' ist ein Fehler aufgetreten!</h3><p><strong>Fehlermeldung:</strong> ' + message + '</p></div>');
  }
  else {
    if(httperror !== false) {
      if(httperror.jqXHR.status === 401) {
        modal.find('.modal-body').html('<div class="alert alert-danger"><h3>Beim ' + action + ' ist ein Fehler aufgetreten!</h3><p><strong>Fehlermeldung:</strong> Sie sind nicht angemeldet! Bitte erneut anmelden: <a class="btn btn-success btn-fill" href="index.html" target="_blank">Anmelden</a></p></div>');
      }
      else {
        modal.find('.modal-body').html('<div class="alert alert-danger"><h3>Beim ' + action + ' ist ein Fehler aufgetreten!</h3><p><strong>Fehlermeldung:</strong> HTTP Code: ' + httperror.jqXHR.status + ' Fehler: ' + httperror.error + ' - ' + httperror.errorThrown + '</p></div>');
      }
    }
    else {
      modal.find('.modal-body').html('<div class="alert alert-danger"><h3>Beim ' + action + ' ist ein unbekannter Fehler aufgetreten! Bitte versuchen Sie es in Kürze erneut!</h3></div>');
    }
  }
  modal.find('.modal-body').append('<p><button type="button" class="center-block btn btn-primary" data-dismiss="modal" aria-label="Close">Schließen</button></p>');
  modal.modal();
  modal.find('button[aria-label=Close]').focus();
}

/**
 * Fragt die PDF für das Verfahren mit der übergebenen ID an und öffnet einen "Öffnen/Speichern"-Dialog
 * @param {Number}  id    ID für die gewünschte PDF
 * @param {Boolean} draft (optional) Wenn true wird die letzte Draft-Version der PDF zurückgegeben
 * @return {undefined}
 */
function getPDFFromServer(id, draft = false) {
  setOverlay();

  $.post(backendPath, JSON.stringify({'action':'getpdf', 'id': id, 'data': {'draft': draft}, 'debug': debug})).done((data) => {
    if(!data['success']) {
      showError('Laden der PDF', data['error']);
      return;
    }

    if(!draft && data['data']['status'] === 0) {
      modal.find('.modal-title').text('Hinweis');
      modal.find('.modal-body').html('<div class="alert alert-warning"><p>Da sich das Verfahren wieder im Zustand "In Bearbeitung" befindet, stimmen die Angaben in der PDF unter Umständen nicht mehr mit der aktualisierten Version überein! Die PDF wird nur bei einem erneuten Abschluss des Verfahrens aktualisiert.</p></div>');
      modal.find('.modal-body').append('<p><button type="button" class="center-block btn btn-primary" data-dismiss="modal" aria-label="Close">Schließen</button></p>');
      modal.modal();
    }

    // Base64 Kodierung umkehren und Blob zum Download erstellen
    let pdfData = atob(data['data']['pdf'].replace(/\s/g, ''));
    let pdfBuffer = new Uint8Array(new ArrayBuffer(pdfData.length));
    for(let i=0; i < pdfData.length; i++) {
      pdfBuffer[i] = pdfData.charCodeAt(i);
    }
    let blob = new Blob([pdfBuffer], {type: "application/pdf"});
    let lastUpdate = data['data']['lastupdate'] ? new Date(data['data']['lastupdate'].replace(' ', 'T')) : new Date();  // Safari benötigt das Format YYYY-MM-DDTHH:MM:SS (mit T)

    // PDF-Anzeige starten (Unterscheidung, ob Edge genutzt wird)
    if(window.navigator && window.navigator.msSaveOrOpenBlob) {
      window.navigator.msSaveOrOpenBlob(blob, 'SecDoc_Dokumentation_' + id + '_' + lastUpdate.getFullYear() + ('0' + (lastUpdate.getMonth() + 1)).slice(-2) + ('0' + lastUpdate.getDate()).slice(-2) + ('0' + lastUpdate.getHours()).slice(-2) + ('0' + lastUpdate.getMinutes()).slice(-2)  + (draft ? '_DRAFT' : '' ) + '.pdf');
    }
    else {
      let url = window.URL.createObjectURL(blob);
      let download = $('<a></a>');
      download.attr('href', url).attr('download', 'SecDoc_Dokumentation_' + id + '_' + lastUpdate.getFullYear() + ('0' + (lastUpdate.getMonth() + 1)).slice(-2) + ('0' + lastUpdate.getDate()).slice(-2) + ('0' + lastUpdate.getHours()).slice(-2) + ('0' + lastUpdate.getMinutes()).slice(-2)  + (draft ? '_DRAFT' : '' ) + '.pdf').addClass('hidden');;
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
 * Löscht ein Verfahren vom Server
 * @param {type} id Eindeutige ID des Verfahrens
 * @returns {undefined}
 */
function deleteFromServer(id) {
  $.get(backendPath, { 'action': 'delete', 'id': id, 'debug': debug }).done(function(data) {
    if(!data['success']) {
      showError('Löschen der Dokumentation', data['error']);
    }
  }).fail((jqXHR, error, errorThrown) => {
    showError('Löschen der Dokumentation', false, {'jqXHR': jqXHR, 'error': error, 'errorThrown': errorThrown});
  });
}

/*
 * Login-Unterseite laden
 */
function loadLogin() {
  $.get('assets/html/login.inc.html').done((data) => { $('#content').html(data); }).fail((jqXHR, error, errorThrown) => {
    showError('Laden der Unterseite "' + page + '"', false, {'jqXHR': jqXHR, 'error': error, 'errorThrown': errorThrown});
    setOverlay(false);
  });
}

/**
 * Läd die angefragte Unterseite und Informationen über den aktuell eingeloggten Nutzer
 * @return {undefined}
 */
function loadSubpage() {
  $('#loginLabel').removeClass('hidden');
  $('#logoutLabel').removeClass('hidden');

  /*
   * Nutzerkennung holen und anzeigen
   */
  getUserPromise = $.getJSON(backendPath + '?action=searchperson' + (debug ? '&debug=true' : '')).done((data) => {
    if(data.length !== 0 && data['data'].length !== 0) {
      version = data['version'];
      userIsDSB = data['data'][0]['userIsDSB'];
      userCanDSB = data['data'][0]['userCanDSB'];

      $('#userLabel').text(data['data'][0]['name'] + (userIsDSB ? ' (Rolle: DSB)' : ' (Rolle: Nutzer)'));
      $('#userLabel').attr('title', 'Kennung: ' + data['data'][0]['value']);

      if(userCanDSB) {
        $('#roleLabel').find('span').text(userIsDSB ? 'Nutzer' : 'DSB');
        $('#roleLabel').removeClass('hidden').click(() => {
          document.cookie = version.replace(/\W/g, '_') + '_dsb=' + (userIsDSB ? '0' : '1');
          location.reload(true);
        });
      }
    }
    else {
      console.error('Fehler beim Abruf der Nutzerkennung! Antwort: ' + data);
      $('#userLabel').text('Unbekannt');
    }
    console.info(version);
  }).fail((jqXHR, error, errorThrown) => {
    console.error('Fehler beim Abruf der Nutzerkennung! HTTP Code: ' + jqXHR.status + ' Fehler: ' + error + ' - ' + errorThrown);
    $('#userLabel').text('Unbekannt');
  });

  /*
   * Angefragte Unterseite laden
   */
  if(page === 'home' && (loadIdMain > 0 || copyIdMain > 0)) {
    $.getJSON(backendPath + '?action=get&id=' + (copyIdMain ? copyIdMain : loadIdMain)+ (debug ? '&debug=true' : '')).done((data) => {
      if(data['success']) {
        page = 'home';
        if(parseInt(data['data'][0]['Typ']) === 1) page = 'wizproc';
        if(parseInt(data['data'][0]['Typ']) === 2) page = 'wizit';
        if(parseInt(data['data'][0]['Typ']) === 3) page = 'wizapp';

        $.get('assets/html/' + page + '.inc.html?' + Date.now()).done((data) => { $('#content').html(data); }).fail((jqXHR, error, errorThrown) => {
          showError('Laden der Unterseite "' + page + '"', false, {'jqXHR': jqXHR, 'error': error, 'errorThrown': errorThrown});
          setOverlay(false);
        });
      }
      else {
        showError('Laden der Dokumentation', data['error']);
        $.get('assets/html/' + page + '.inc.html?' + Date.now()).done((data) => { $('#content').html(data); }).fail((jqXHR, error, errorThrown) => {
          showError('Laden der Unterseite "' + page + '"', false, {'jqXHR': jqXHR, 'error': error, 'errorThrown': errorThrown});
          setOverlay(false);
        });
      }
    }).fail((jqXHR, error, errorThrown) => {
      showError('Laden der Dokumentation', false, {'jqXHR': jqXHR, 'error': error, 'errorThrown': errorThrown});
      setOverlay(false);
    });
  }
  else {
    $.get('assets/html/' + page + '.inc.html?' + Date.now()).done((data) => { $('#content').html(data); }).fail((jqXHR, error, errorThrown) => {
      showError('Laden der Unterseite "' + page + '"', false, {'jqXHR': jqXHR, 'error': error, 'errorThrown': errorThrown});
      setOverlay(false);
    });
  }
}

/*
 * Logout Button
 */
$('#logoutLabel').click(() => {
  setOverlay(true);
  $.getJSON(backendPath + '?action=logout' + (debug ? '&debug=true' : '')).done((data) => {
    if(data['success']) {
      $(window).off('beforeunload'); // Meldung vor dem Verlassen der Seite abschalten
      window.location.replace('index.html');
    }
    else {
      showError('Abmelden', 'Funktion nicht verfügbar bei externer Anmeldung!');
      setOverlay(false);
    }
  }).fail((jqXHR, error, errorThrown) => {
    showError('Abmelden', false, {'jqXHR': jqXHR, 'error': error, 'errorThrown': errorThrown});
    setOverlay(false);
  });
});

/*
 * Überprüfen ob der Nutzer eingeloggt ist
 */
$.getJSON(backendPath + '?action=loggedin' + (debug ? '&debug=true' : '')).done((data) => {
  if(data.length !== 0 && data['success']) {
    loadSubpage();
  }
}).fail((jqXHR, error, errorThrown) => {
  loadLogin();
});
