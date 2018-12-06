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
 * @copyright (c) 2018 Westfälische Wilhelms-Universität Münster
 * @license AGPL-3.0-or-later <https://www.gnu.org/licenses/agpl.html>
 */

/*
 * Tabellen befüllen
 */
$.get(backendPath, { 'action': 'listdsb', 'debug': debug }).done((data) => {
  if(!data['success']) {
    showError('Abrufen der Verfahrensliste', data['error']);
    setSaveLabel('none');
    return;
  }
  
  var abgTable = $('#abgeschlossen tbody').first();
  var inbTable = $('#inbearbeitung tbody').first();
  
  // Für jedes Verfahren einen Tabelleneinträg anlegen
  for(var c=0; c < data['count']; c++) {
    var newEntry = $('<tr></tr>');
    newEntry.append('<td style="width: 16px;"></td>');
    newEntry.append('<td>' + data['data'][c]['Bezeichnung'] + ' <i data-toggle="tooltip" class="fa fa-info-circle" title="' + data['data'][c]['Beschreibung'] + '"></i></td>');
    newEntry.append('<td>' + data['data'][c]['Fachabteilung'] + '</td>');
    newEntry.append('<td>' + (data['data'][c]['FachKontakt'] ? data['data'][c]['FachKontakt'] : '-- nicht angegeben --') + '</td>');
    newEntry.append('<td>' + (data['data'][c]['TechKontakt'] ? data['data'][c]['TechKontakt'] : '-- nicht angegeben --') + '</td>');
    newEntry.append('<td>' + data['data'][c]['Erstelldatum'] + '</td>');
    newEntry.append('<td>' + data['data'][c]['Aktualisierung'] + '</td>');
    newEntry.append('<td><textarea class="form-control comment" data-id="' + data['data'][c]['ID'] + '" style="resize: both;">' + htmlDecode(data['data'][c]['DSBKommentar']) + '</textarea></td>');
    newEntry.append('<td><div class="btn-group inline"><a class="btn" href="?id=' + data['data'][c]['ID'] + (debug ? '&debug=true' : '') + '" target="_blank">Bearbeiten</a><button type="button" class="btn pdfdownload" data-id="' + data['data'][c]['ID'] + '" ' + (data['data'][c]['PDF'] ? '' : 'disabled') + '>PDF anzeigen</button></div></td>');
    
    if(parseInt(data['data'][c]['Status']) === 0) {
      inbTable.append(newEntry);
    }
    else {
      abgTable.append(newEntry);
    }
  }
  
  // Event-Listener zum Speichern von Änderungen an den Kommentaren
  $('#content').on('input change', 'textarea.comment', function(event) {
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
        showError('Speichern des Kommentars', 'HTTP Code: ' + jqXHR.status + ' Fehler: ' + error + ' - ' + errorThrown);
        setSaveLabel('failed');
      });
    }, timeout));
  });
  
  // PDF-Download ermöglichen
  $('#content').on('click', 'button.pdfdownload', function(event) {
    getPDFFromServer($(event.target).data('id'));
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
    if(coldex === 0) return $.parseHTML(inner)[0].textContent;
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
  
  $('#content').find('[data-toggle="tooltip"]').tooltip({container: 'body'});
  
  // Tabellengröße anpassen, wenn der Tab gewechselt wird
  $('a[data-toggle="tab"]').on("shown.bs.tab", function (e) {
    $($.fn.dataTable.tables(true)).DataTable().columns.adjust().responsive.recalc();
  });
  
  setSaveLabel('refreshed');
}).fail((jqXHR, error, errorThrown) => {
  showError('Abrufen der Verfahrensliste', 'HTTP Code: ' + jqXHR.status + ' Fehler: ' + error + ' - ' + errorThrown);
  setSaveLabel('none');
}).always(() => {
  setOverlay(false);
});

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
  showError('Abrufen der Statistiken', 'HTTP Code: ' + jqXHR.status + ' Fehler: ' + error + ' - ' + errorThrown);
  setSaveLabel('none');
});

// Timer beenden
console.timeEnd('Gesamte Vorbereitungszeit');
