/**
 * main.js - Zentrale Funktionen für das secdoc-Tool
 *
 * @file Kapselt die zentralen Funktionen und steuert das Laden der Unterseiten
 *
 * @requires assets/js/jquery-3.3.1.min.js
 *
 * @author Thorsten Küfer <thorsten.kuefer@uni-muenster.de>
 * @author Dustin Gawron <dustin.gawron@uni-muenster.de>
 * @copyright (c) 2018 Westfälische Wilhelms-Universität Münster
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
var page = ['dsbview'].includes(GetURLParameter('page')) ? GetURLParameter('page') : 'wizard';

/**
 * Gibt an, ob der Nutzer ein Datenschutzbeauftragter ist
 * @global
 * @type {Boolean}
 */
var userIsDSB = false;

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
 * @param {String} action  Aktion, bei der der Fehler aufgetreten ist
 * @param {String} message (optional) Fehlermeldung
 * @returns {undefined}
 */
function showError(action, message = false) {
  console.error('Fehler beim ' + action + ' - Fehlermeldung: ' + message);
  modal.find('.modal-title').text('Fehler');
  if(message) {
    modal.find('.modal-body').html('<div class="alert alert-danger"><p>Beim ' + action + ' ist ein Fehler aufgetreten!</p> <p><strong>Fehlermeldung:</strong> ' + message + '</p></div>');
  }
  else {
    modal.find('.modal-body').html('<div class="alert alert-danger"><p>Beim ' + action + ' ist ein unbekannter Fehler aufgetreten! Bitte versuchen Sie es in Kürze erneut!</p></div>');
  }
  modal.find('.modal-body').append('<p><button type="button" class="center-block btn btn-primary" data-dismiss="modal" aria-label="Close">Schließen</button></p>');
  modal.modal();
}

/**
 * Fragt die PDF für das Verfahren mit der übergebenen ID an und öffnet einen "Öffnen/Speichern"-Dialog
 * @param {Number} id ID für die gewünschte PDF
 * @return {undefined}
 */
function getPDFFromServer(id) {
  setOverlay();

  $.post(backendPath, JSON.stringify({'action':'getpdf', 'id': id, 'debug': debug})).done((data) => {
    if(!data['success']) {
      showError('Laden der PDF', data['error']);
      return;
    }

    if(data['data']['status'] === 0) {
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
    let lastUpdate = new Date(data['data']['lastupdate'].replace(' ', 'T'));  // Safari benötigt das Format YYYY-MM-DDTHH:MM:SS (mit T)

    // PDF-Anzeige starten (Unterscheidung, ob Edge genutzt wird)
    if(window.navigator && window.navigator.msSaveOrOpenBlob) {
      window.navigator.msSaveOrOpenBlob(blob, 'Verfahrensdokumentation_' + id + '_' + lastUpdate.getFullYear() + ('0' + (lastUpdate.getMonth() + 1)).slice(-2) + ('0' + lastUpdate.getDate()).slice(-2) + ('0' + lastUpdate.getHours()).slice(-2) + ('0' + lastUpdate.getMinutes()).slice(-2)  + '.pdf');
    }
    else {
      let url = window.URL.createObjectURL(blob);
      let download = $('<a></a>');
      download.attr('href', url).attr('download', 'Verfahrensdokumentation_' + id + '_' + lastUpdate.getFullYear() + ('0' + (lastUpdate.getMonth() + 1)).slice(-2) + ('0' + lastUpdate.getDate()).slice(-2) + ('0' + lastUpdate.getHours()).slice(-2) + ('0' + lastUpdate.getMinutes()).slice(-2)  + '.pdf').addClass('hidden');;
      $('body').append(download);
      download[0].click();
      window.URL.revokeObjectURL(url);
      download.remove();
    }
  }).fail((jqXHR, error, errorThrown) => {
    showError('Laden der PDF', 'HTTP Code: ' + jqXHR.status + ' Fehler: ' + error + ' - ' + errorThrown);
  }).always(() => {
    setOverlay(false);
  });
}

/*
 * Nutzerkennung holen und anzeigen
 */
$.getJSON(backendPath + '?action=searchperson' + (debug ? '&debug=true' : '')).done((data) => {
  if(data.length !== 0 && data['data'].length !== 0) {
    $('#userLabel').text(data['data'][0]['name']);
    $('#userLabel').attr('title', 'SSO-Kennung: ' + data['data'][0]['value']);
    version = data['version'];
    userIsDSB = data['data'][0]['userIsDSB'];
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
$.get('assets/html/' + page + '.inc.html').done((data) => { $('#content').html(data); }).fail((jqXHR, error, errorThrown) => {
  console.error('Fehler beim Laden der Unterseite "' + page + '"! HTTP Code: ' + jqXHR.status + ' Fehler: ' + error + ' - ' + errorThrown);
  showError('Laden der Unterseite "' + page + '"');
});
