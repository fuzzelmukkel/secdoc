<?php
  /**
   * verwaltung.php - REST-API zur Speicherung und Bearbeitung von Verfahren und Bereitstellung von Ausfüllhinweisen
   *
   * Die Schnittstelle stellt verschiedene Funktionen bereit, die über einfache HTTP-Anfragen genutzt werden können.
   * Die Anfragen können als GET- oder POST-Requests gestellt werden und müssen auf jeden Fall den Parameter `action`
   * enthalten, der die gewünschte Funktion angibt. Für einige Aufrufe sind weitere Parameter notwendig.
   *
   * Beispiel: `verwaltung.php?action=get&id=13`
   *
   * @author Thorsten Küfer <thorsten.kuefer@uni-muenster.de>
   * @author Dustin Gawron <dustin.gawron@uni-muenster.de>
   * @author Marius Timmer <marius.timmer@uni-muenster.de>
   * @copyright (c) 2018-2020 Westfälische Wilhelms-Universität Münster
   * @license AGPL-3.0-or-later <https://www.gnu.org/licenses/agpl.html>
   *
   */

  # Ausgabe-Puffer einschalten
  ob_start();

  # Benötigte Dateien einbinden
  require_once('config.inc.php');
  use PHPMailer\PHPMailer\PHPMailer;
  use PHPMailer\PHPMailer\SMTP;
  use PHPMailer\PHPMailer\Exception;

  # Ausgabe Array vorbereiten
  $output = [];
  $output['success'] = FALSE;

  # Exception Handler festlegen
  /**
   * Fängt eine Exception ab und gibt eine Nutzerfreundliche Meldung zurück. Die Meldung selbst wird in der Variable $output['debug'] ausgegeben, wenn das Debugging eingeschaltet ist.
   *
   * @global bool   $debug       Debug-Einstellung
   * @global string $userId      Nutzerkennung des aktuellen Nutzers
   * @global array  $userGroups  Nutzergruppen des aktuellen Nutzers
   * @global array  $debugGroups Nutzergruppen, die Fehlermeldungen anzeigen dürfen
   * @param Exception $exception Geworfene Exception
   * @return void
   */
  function customExceptionHandler($exception): void {

    global $debug, $userId, $userGroups, $debugGroups;

    $output['success'] = FALSE;
    $output['error'] = "Ein interner Fehler ist aufgetreten! Bitte versuchen Sie es später erneut oder wenden Sie sich an einen Administrator.";

    # Meldung als HTML ausgeben
    echo '<br /><b>Fatal error</b>:  Exception \'' . get_class($exception) . '\' with message ';
    echo $exception->getMessage() . '<br />';
    echo 'Stack trace:<pre>' . $exception->getTraceAsString() . '</pre>';
    echo 'thrown in <b>' . $exception->getFile() . '</b> on line <b>' . $exception->getLine() . '</b><br />';

    # Meldung zusätzlich in Log schreiben
    error_log("[SecDoc] Exception " . get_class($exception) . ' with message ' . $exception->getMessage() . ' thrown in ' . $exception->getFile() . ' on line ' . $exception->getLine());

    if($debug && !empty($userId) && Utils::checkUserGroups($userGroups, $debugGroups)) {
      $output['debug'] = ob_get_contents();
    }
    ob_clean();

    # Ergebnis als JSON zurückgeben
    $result = json_encode($output);
    header('Content-type: application/json; charset=utf-8');
    header('Content-length: ' . strlen($result));
    print($result);
    ob_end_flush();
    exit(1);
  }

  set_exception_handler('customExceptionHandler');

  /**
   * Generiert eine Textdatei, um als SSI genutzt zu werden.
   *
   * @author Marius Timmer <marius.timmer@uni-muenster.de>
   *
   * @global string $includes_dir Verzeichnis für Textdateien
   * @param DBCon  $dbcon        Datenbank-Verbindung als PDO Objekt
   * @param string $userId       Nutzerkennung
   * @param array  $userGroups   Nutzergruppen
   * @param bool   $userIsDSB    DSB-Berechtigung
   * @param int    $verfahrensId ID des zu exportierenden Verfahrensverzeichnisses
   * @return boolean True bei Erfolg sonst false
   */
  function generateTXT(DBCon $dbcon, string $userId, array $userGroups, bool $userIsDSB, int $verfahrensId): bool
  {
    global $includes_dir;

    // Daten auslesen
    $data = $dbcon->getVerfahren($verfahrensId, $userId, $userGroups, $userIsDSB);
    if (($data === false) ||
        (empty($data)) ||
        (empty($data[0]['JSON']))) {
        /**
         * Beim Auslesen der Daten ist ein Fehler aufgetreten.
         * Daher muss an dieser Stelle abgebrochen werden.
         */
        trigger_error('[SecDoc] verwaltung.php -> Kann keine Verfahrensdaten auslesen!');
        error_log('[SecDoc] verwaltung.php -> Kann keine Verfahrensdaten auslesen!');
        return false;
    }
    $verfahrensdaten = json_decode($data[0]['JSON'], true);// Text generieren
    $verfahrensbezeichnung = Utils::valueOrDefault($verfahrensdaten['allgemein_bezeichnung']);
    $verfahrenszweck = Utils::valueOrDefault($verfahrensdaten['allgemein_zweck']);
    $output = '<p>'. sprintf(
            'Das Verfahren <strong>%s</strong> verarbeitet zum Zweck <strong>%s</strong> die folgenden personenbezogenen Daten.',
            $verfahrensbezeichnung,
            $verfahrenszweck
        ) .'</p>';
    $output .= sprintf(
        '<table><thead><tr><th>%s</th><th>%s</th><th>%s</th><th>%s</th><th>%s</th></tr></thead><tbody>',
        "Kategorie",
        "Betroffene",
        "Herkunft",
        "Rechtsgrundlage",
        "Löschfrist"
    );
    if (array_key_exists('daten_kategorien_nummer', $verfahrensdaten) && is_array($verfahrensdaten['daten_kategorien_nummer'])) {
      for ($i = 0; $i < count($verfahrensdaten['daten_kategorien_nummer']); $i++) {
          $id = $verfahrensdaten['daten_kategorien_nummer'][$i];
          $kategoriename = Utils::valueOrDefault(
                $verfahrensdaten['daten_kategorien_beschreibung'][$i]
          );
          $kategorieherkunft = Utils::valueOrDefault(
              $verfahrensdaten['daten_kategorien_herkunft'][$i]
          );
          // Auslesen und Zuordnen der jeweils betroffenen Personengruppen
          $betroffene = array();
          if (is_array($verfahrensdaten['daten_personen_kategorie'])) {
              foreach ($verfahrensdaten['daten_personen_kategorie'] AS $personID => $zuweisungen) {
                  foreach ($zuweisungen AS $kategorieID) {
                      if ($kategorieID == $id) {
                          array_push(
                              $betroffene,
                              Utils::valueOrDefault(
                                  $verfahrensdaten['daten_personen_betroffene'][$personID]
                              )
                          );
                      }
                  }
              }
          }
          // Auslesen und Zuordnen der jeweiligen Rechtsgrundlage und ggf. eine passende erläuterung
          $rechtsgrundlagen = array();
          if (is_array($verfahrensdaten['daten_grundlagen_kategorie'])) {
              foreach ($verfahrensdaten['daten_grundlagen_kategorie'] AS $grundlageID => $zuweisungen) {
                  foreach ($zuweisungen AS $kategorieID) {
                      if ($kategorieID == $id) {
                          if ((isset($verfahrensdaten['daten_grundlagen_bezeichnung'][$grundlageID])) &&
                              (!empty(trim($verfahrensdaten['daten_grundlagen_bezeichnung'][$grundlageID])))) {
                              $rechtstext = $verfahrensdaten['daten_grundlagen_bezeichnung'][$grundlageID];
                          }
                          if ((isset($verfahrensdaten['daten_grundlagen_erlaeuterung'][$grundlageID])) &&
                              (!empty(trim($verfahrensdaten['daten_grundlagen_erlaeuterung'][$grundlageID])))) {
                              $erlaeuterung = $verfahrensdaten['daten_grundlagen_erlaeuterung'][$grundlageID];
                              $rechtstext .= ' <em>Erl&auml;uterung: '. $erlaeuterung .'</em>';
                          }
                          array_push(
                              $rechtsgrundlagen,
                              $rechtstext
                          );
                      }
                  }
              }
          }
          // Auslesen und Zuordnen der jeweiligen Löschfristen
          $fristen = array();
          if (is_array($verfahrensdaten['daten_loeschung_kategorie'])) {
              foreach ($verfahrensdaten['daten_loeschung_kategorie'] AS $fristID => $zuweisungen) {
                  foreach ($zuweisungen AS $kategorieID) {
                      if ($kategorieID == $id) {
                          array_push(
                              $fristen,
                              $verfahrensdaten['daten_loeschung_frist'][$fristID]
                          );
                      }
                  }
              }
          }
          /**
           * Aus den ggf. in einem Array abgelegten Rechtsgrundlagen generieren
           * wir einen Text. Falls es mehrere Rechtsgrundlagen gibt, wird eine
           * Liste erzeugt.
           */
          if (count($rechtsgrundlagen) === 0) {
              $rechtsgrundlagen = Utils::valueOrDefault(null);
          } else if (count($rechtsgrundlagen) > 1) {
              $rechtsgrundlagen = '<ul><li>'. implode('</li><li>', $rechtsgrundlagen) .'</li></ul>';
          } else {
              $rechtsgrundlagen = $rechtsgrundlagen[0];
          }
          if (count($fristen) === 0) {
              array_push($fristen, Utils::valueOrDefault(null));
          }
          $output .= sprintf(
              '<tr><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td></tr>',
              $kategoriename,
              implode(', ', $betroffene),
              $kategorieherkunft,
              $rechtsgrundlagen,
              implode('. ', $fristen)
          );
      }
    }
    $output .= '</tbody></table>';
    /**
     * Am Ende betten wir unseren eigentlichen Output noch einmal in das
     * Article- und div tag um korrekt in Imperiaseiten eingebunden werden
     * zu koennen.
     */
    $output = '<article class="module extended"><div class="module-content">'. $output .'</div></article>';
    // Auf Datei zugreifen, schreiben und schliessen.
    $filename = sprintf(
        '%s/%d.txt',
        $includes_dir,
        $verfahrensId
    );
    $fh = fopen($filename, 'w');
    if (!$fh) {
        error_log(
            sprintf(
                'Kann nicht in Datei "%s" schreiben!',
                $filename
            )
        );
        return false;
    }
    $written_bytes = fwrite($fh, $output);
    return ((fclose($fh)) &&
        ($written_bytes === strlen($output)));
  }

  /**
   * Generiert eine PDF-Datei aus dem übergebenen HTML-Code.
   *
   * @author Dustin Gawron <dustin.gawron@uni-muenster.de>
   *
   * @global string $pdf_dir     Verzeichnis für die PDF-Speicherung
   * @param string $title        Titel des Verfahrens
   * @param string $html         HTML-Code, der als PDF gerendert werden soll
   * @param int    $verfahrensId ID des zu exportierenden Verfahrensverzeichnisses
   * @param bool   $isDraft      (optional) Erstellt eine Vorschau-PDF bei TRUE
   * @return boolean True bei Erfolg sonst false
   */
  function generatePDF(string $title, string $html, int $verfahrensId, bool $isDraft = FALSE): bool {

    require_once '../vendor/autoload.php';

    global $dbcon, $userId, $pdf_dir, $prog_name, $prog_version, $prog_url, $docmgmtClass, $docmgmt_maxAttachSize, $temp_dir;
    $res = Utils::searchUsers($userId, TRUE);
    $author = !empty($res) ? $res[0]['name'] : '';

    # MPDF initialisieren
    $mpdf = new \Mpdf\Mpdf(['debug' => false, 'CSSselectMedia' => 'screen', 'mode' => 'utf-8', 'format' => 'A4']);
    $mpdf->SetTitle('SecDoc Dokumentation - ' . $title . ($isDraft ? ' (ENTWURF)' : ''));
    $mpdf->SetAuthor($author);
    $mpdf->SetCreator($prog_name . ' v' . $prog_version);

    # Überschriften zu Bookmarks machen
    $mpdf->h2bookmarks = ['H3' => 0, 'H5' => 1];

    # Wasserzeichen setzen?
    #$mpdf->SetWatermarkText('DRAFT');
    #$mpdf->showWatermarkText = false;
    if(stripos($prog_name, 'test') !== FALSE || stripos($prog_name, 'demo') !== FALSE) {
      $mpdf->SetWatermarkText('TEST');
      $mpdf->showWatermarkText = TRUE;
    }

    if($isDraft) {
      $mpdf->SetWatermarkText('ENTWURF');
      $mpdf->showWatermarkText = TRUE;
    }

    # PDF mit Passwort sichern? (https://mpdf.github.io/reference/mpdf-functions/setprotection.html)
    #$mpdf->SetProtection(array(), 'UserPassword', 'MyPassword');

    # Style-Dateien laden
    $style = file_get_contents('../css/bootstrap.min.css');
    $mpdf->WriteHTML($style,1);
    $style = file_get_contents('../css/custom.css');
    $mpdf->WriteHTML($style,1);
    $style = file_get_contents('../css/custom_pdf.css');
    $mpdf->WriteHTML($style,1);

    # Ersetzungen durchführen
    $lastUpdate = $dbcon->getHistorie($verfahrensId)[0];
    $lastEditor = !empty($lastUpdate['Anzeigename']) ? $lastUpdate['Anzeigename'] : $lastUpdate['Kennung'];
    $html = str_replace('$lasteditor$', $lastEditor, $html);
    $html = str_replace('$docurl$', $prog_url . "?id=$verfahrensId", $html);
    $html = str_replace('$baseurl$', $prog_url, $html);
    $html = str_replace('$lastedited$', $lastUpdate['Datum'], $html);

    # Revisionen holen und einfügen
    $revisionsHTML = <<<EOH
      <p class="info-text text-ul text-center">Revisionen</p>
      <table id="abschluss_revisionen" class="table table-hover btn-table" style="border: 1px solid darkgray; padding: 5px;">
        <thead>
          <tr>
            <th style="border: 1px solid darkgray; padding: 5px; background-color: lightgray;">Revision</th>
            <th style="border: 1px solid darkgray; padding: 5px; background-color: lightgray;">Datum</th>
            <th style="border: 1px solid darkgray; padding: 5px; background-color: lightgray;">Bearbeiter</th>
            <th style="border: 1px solid darkgray; padding: 5px; background-color: lightgray;">Kommentar</th>
          </tr>
        </thead>
        <tbody>
EOH;
    foreach($dbcon->listRevisions($verfahrensId) as $revision) {
      $revisionsHTML .= <<<EOH
          <tr>
            <td style="border: 1px solid darkgray; padding: 5px;">{$revision['Revision']}</td>
            <td style="border: 1px solid darkgray; padding: 5px;">{$revision['Date']}</td>
            <td style="border: 1px solid darkgray; padding: 5px;">{$revision['Editor']}</td>
            <td style="border: 1px solid darkgray; padding: 5px;">{$revision['Comment']}</td>
          </tr>
EOH;
    }
    $revisionsHTML .= <<<EOH
        </tbody>
      </table>
EOH;
    $html = str_replace('$docrevisions$', $revisionsHTML, $html);

    # HTML aufbauen
    $finalHTML = <<<EOH
      <body>
        <div class="logo-container-left">
          <div class="logo">
            <img src="../img/logo1.png" alt="WWU logo" title="Westfälische Wilhelms-Universität" width="200">
          </div>
        </div>
        <div class="logo-container-right">
          <div class="logo">
            <img src="../img/logo2.png" alt="SecDoc logo" title="SecDoc" width="180">
          </div>
        </div>
        <div style="padding-top: 50px;">
EOH;
    $finalHTML .= $html;
    $finalHTML .= <<<EOH
      </div>
    </body>
EOH;

    # HTML in PDF schreiben
    $htmlParts = explode('<span class="snip"></span>', $finalHTML);
    foreach($htmlParts as $part) {
      $mpdf->WriteHTML($part,2);
    }

    if(!$isDraft) {
      # Angehängte PDF-Dokumente einbetten
      $attachedDocs = $dbcon->listDocuments($verfahrensId);
      $attachedDocs = array_filter($attachedDocs, function($doc) { return ($doc['Attach'] > 0 ? TRUE : FALSE); });
      $attachedSize = 0;
      if(count($attachedDocs) > 0) {
        $mpdf->Bookmark("Angehängte Dokumente", 0);
      }
      foreach($attachedDocs as $doc) {
        # Prüfen, ob Anhanggröße überschritten wird
        $attachedSize += $doc['FileSize'];
        if($attachedSize > $docmgmt_maxAttachSize) break;

        $file = $docmgmtClass->getDocument($verfahrensId, $doc['FileRef']);
        $tmpFile = $temp_dir . DIRECTORY_SEPARATOR . "{$verfahrensId}_{$doc['DocID']}.pdf";
        if(file_put_contents($tmpFile, base64_decode($file['fileContent'])) === FALSE) {
          error_log("[SecDoc] verwaltung.php -> Konnte temporäre PDF von angehängtem Dokument nicht erstellen (Dokumentation #{$verfahrensId} - Dokument #{$doc['DocID']})");
          continue;
        }

        $mpdf->WriteHTML('<pagebreak />');

        $tocTitle = empty($doc['Description']) ? $doc['FileRef'] : $doc['Description'];
        if(strlen($tocTitle) > 43) {
          $tocTitle = trim(substr($tocTitle, 0, 40)) . '...';
        }
        $mpdf->Bookmark(htmlspecialchars($tocTitle), 1);

        try {
          $pageCount = $mpdf->SetSourceFile($tmpFile);

          for($c = 1; $c <= $pageCount; $c++) {
            $mpdf->UseTemplate($mpdf->ImportPage($c));
            if($c !== $pageCount) $mpdf->WriteHTML('<pagebreak />');
          }
        } catch(\Exception $e) {
          $mpdf->WriteHTML('<h6>Die angehängte PDF konnte nicht gelesen werden! Möglicherweise wird das Format nicht unterstützt.</h6>');
          error_log("[SecDoc] verwaltung.php -> PDF konnte nicht gelesen werden (Dokument #{$doc['DocID']}) (Fehler: " . $e->getMessage() . ")");
          unlink($tmpFile);
          continue;
        }

        unlink($tmpFile);
      }
    }

    # PDF generieren und zurückgeben
    #$title = preg_replace('/\W/', '_', $title);  # Alle Nicht-Wort-Zeichen in Unterstriche umwandeln
    $pdf_content = $mpdf->Output(
      '',
      \Mpdf\Output\Destination::STRING_RETURN
    );

    # Überprüfen, ob PDF Inhalt hat
    if(empty($pdf_content)) {
      trigger_error('[SecDoc] verwaltung.php -> Generierte PDF ist leer');
      error_log('[SecDoc] verwaltung.php -> Generierte PDF ist leer');
      return FALSE;
    }

    $filename = $pdf_dir . DIRECTORY_SEPARATOR . $verfahrensId . ($isDraft ? '_DRAFT' : '') . '.pdf';
    $fh = fopen($filename, 'w+');
    if ($fh) {
      $written_bytes = fwrite($fh, $pdf_content);
      if ($written_bytes == 0) {
        // Es konnte nicht alles geschrieben werden / Kein Speicherplatz mehr?
        trigger_error('[SecDoc] verwaltung.php -> Konnte nicht in PDF-Datei schreiben');
        error_log('[SecDoc] verwaltung.php -> Konnte nicht in PDF-Datei schreiben');
        fclose($fh);
        return FALSE;
      }
      fclose($fh);
    } else {
      /**
       * Fehler beim Öffnen der Datei. Ungültiger Dateiname / Pfad
       * oder eine fehlende Berechtigung könnten die Ursache sein.
       */
      trigger_error('[SecDoc] verwaltung.php -> Kann PDF-Datei nicht anlegen');
      error_log('[SecDoc] verwaltung.php -> Kann PDF-Datei nicht anlegen');
      return FALSE;
    }
    return TRUE;
  }

  /**
   * Generiert eine kombinierte PDF-Datei mit allen PDFs von abgeschlossenen Verarbeitungstätigkeiten (VVT).
   *
   * @param  array $processes Array von Verfahren (wie von DBCon->listVerfahrenDSB() zurückgegeben)
   * @return bool             TRUE bei Erfolg (PDF wurde in $pdf_dir abgespeichert), FALSE sonst
   */
  function generateCombinedPDF(array $processes): bool {
    set_time_limit(0);

    require_once '../vendor/autoload.php';

    global $dbcon, $userId, $pdf_dir, $prog_name, $prog_version;
    $res = Utils::searchUsers($userId, TRUE);
    $author = $res[0]['name'];

    # MPDF initialisieren
    $mpdf = new \Mpdf\Mpdf(['debug' => false, 'CSSselectMedia' => 'screen', 'mode' => 'utf-8', 'format' => 'A4']);
    $mpdf->SetTitle('Verzeichnis von Verarbeitungstätigkeiten');
    $mpdf->SetAuthor($author);
    $mpdf->SetCreator($prog_name . ' v' . $prog_version);

    # Stylesheets machen Probleme mit bestehenden PDFs...
    #$style = file_get_contents('../css/bootstrap.min.css');
    #$mpdf->WriteHTML($style,1);
    #$style = file_get_contents('../css/custom.css');
    #$mpdf->WriteHTML($style,1);

    # Titelseite ohne Fußzeile initialisieren
    $mpdf->AddPage('','','','','on');

    # Titelseite einfügen
    $titlePage = file_get_contents('../html/pdf_titlepage.inc.html');
    $titlePage .= '<pagebreak resetpagenum="1" pagenumstyle="1" suppress="off" />';
    $mpdf->Bookmark(htmlspecialchars("Verzeichnis abgeschlossener Dokumentationen", ENT_QUOTES), 0);
    $mpdf->WriteHTML($titlePage);

    # TOC einfügen (ein Eintrag pro Verfahren)
    $mpdf->TOCpagebreakByArray([
      'tocfont' => 'sans-serif',
      'tocfontsize' => '',
      'tocindent' => '',
      'TOCusePaging' => TRUE,
      'TOCuseLinking' => TRUE,
      'toc_preHTML' => "<h2>Inhaltsverzeichnis</h2>",
      'toc_ohvalue' => 'off',
      'toc_ofvalue' => 'off',
      'toc_bookmarkText' => 'Inhaltsverzeichnis'
    ]);

    $procCount = count($processes);

    # Nach ID sortieren? Oder eher nach Name, Erstelldatum oder Aktualisierungsdatum?
    # Am besten alphabetisch nach Name
    usort($processes, function($a, $b) { return strcmp(strval($a['Bezeichnung']), strval($b['Bezeichnung'])); });

    for($p = 0; $p < $procCount; $p++) {
      $filePath = $pdf_dir . DIRECTORY_SEPARATOR . $processes[$p]['ID'] . '.pdf';
      $procName = trim($processes[$p]['Bezeichnung']);
      if(strlen($procName) > 43) {
        $procName = trim(substr($procName, 0, 40)) . '...';
      }

      if(file_exists($filePath)) {
        $mpdf->setFooter(htmlspecialchars("#{$processes[$p]['ID']}|$procName") . '|{PAGENO}');
        $mpdf->TOC_Entry(htmlspecialchars("$procName (#{$processes[$p]['ID']})"));
        $mpdf->Bookmark(htmlspecialchars("$procName (#{$processes[$p]['ID']})", ENT_QUOTES), 0);

        $pageCount = $mpdf->SetSourceFile($filePath);

        for($c = 1; $c <= $pageCount; $c++) {
          $mpdf->UseTemplate($mpdf->ImportPage($c), 5, 0, 200, 282);
          if($p !== ($procCount - 1)) $mpdf->WriteHTML('<pagebreak />');
          if($p === ($procCount - 1) && $c !== $pageCount) $mpdf->WriteHTML('<pagebreak />');
        }
      }
      # Fehlende PDF, obwohl als "abgeschlossen" gekennzeichnet
      elseif(intval($processes[$p]['Status']) === 2) {
        $mpdf->setFooter(htmlspecialchars("#{$processes[$p]['ID']}|$procName") . '|{PAGENO}');
        $mpdf->TOC_Entry(htmlspecialchars("$procName (#{$processes[$p]['ID']})"));
        $mpdf->Bookmark(htmlspecialchars("$procName (#{$processes[$p]['ID']})", ENT_QUOTES), 0);

        $mpdf->WriteHTML("<h2>Die PDF-Datei für die Dokumentation #{$processes[$p]['ID']} - '" . htmlspecialchars("{$processes[$p]['Bezeichnung']}") . "' fehlt</h2><p>Die Dokumentation #{$processes[$p]['ID']} ist als abgeschlossen markiert, aber es ist keine PDF-Datei vorhanden!</p><p>Bitte schließen Sie die Dokumentation erneut ab, um eine vollständige PDF-Version zu erzeugen.</p><pagebreak />");
      }
    }

    $pdf_content = $mpdf->Output(
      '',
      \Mpdf\Output\Destination::STRING_RETURN
    );

    # Überprüfen, ob PDF Inhalt hat
    if(empty($pdf_content)) {
      trigger_error('[SecDoc] verwaltung.php -> Generierte PDF ist leer');
      error_log('[SecDoc] verwaltung.php -> Generierte PDF ist leer');
      return FALSE;
    }

    $filename = $pdf_dir . DIRECTORY_SEPARATOR . 'combined.pdf';
    $fh = fopen($filename, 'w+');
    if ($fh) {
      $written_bytes = fwrite($fh, $pdf_content);
      if ($written_bytes == 0) {
        // Es konnte nicht alles geschrieben werden / Kein Speicherplatz mehr?
        trigger_error('[SecDoc] verwaltung.php -> Konnte nicht in PDF-Datei schreiben');
        error_log('[SecDoc] verwaltung.php -> Konnte nicht in PDF-Datei schreiben');
        fclose($fh);
        return FALSE;
      }
      fclose($fh);
    } else {
      /**
       * Fehler beim Öffnen der Datei. Ungültiger Dateiname / Pfad
       * oder eine fehlende Berechtigung könnten die Ursache sein.
       */
      trigger_error('[SecDoc] verwaltung.php -> Kann PDF-Datei nicht anlegen');
      error_log('[SecDoc] verwaltung.php -> Kann PDF-Datei nicht anlegen');
      return FALSE;
    }
    return TRUE;
  }

  /**
   * Erstellt eine komplette PDF-Dokumentation einer Verarbeitungstätigkeit mit allen Abhängigkeiten.
   *
   * @param  array $process     Array der Hauptverarbeitungstätigkeit
   * @param  array $procDep     Array der Abhängigkeiten von Verarbeitungstätigkeiten
   * @param  array $appDep      Array der Abhängigkeiten von Fachapplikationen
   * @param  array $itDep       Array der Abhängigkeiten von IT-Verfahren
   * @param  array $measuresDep Array der Abhängigkeiten von übergreifenden Massnahmen
   * @return bool               TRUE bei Erfolg, sonst FALSE
   */
  function generateCompletePDF(array $process, array $procDep, array $appDep, array $itDep, array $measuresDep): bool {
    set_time_limit(0);

    require_once '../vendor/autoload.php';

    global $userId, $pdf_dir, $prog_name, $prog_version, $prog_url;
    $res = Utils::searchUsers($userId, TRUE);
    $author = $res[0]['name'];

    # MPDF initialisieren
    $mpdf = new \Mpdf\Mpdf(['debug' => false, 'CSSselectMedia' => 'screen', 'mode' => 'utf-8', 'format' => 'A4']);
    $mpdf->SetTitle("Dokumentation #{$process['ID']} - {$process['Bezeichnung']}");
    $mpdf->SetAuthor($author);
    $mpdf->SetCreator($prog_name . ' v' . $prog_version);

    # Stylesheets machen Probleme mit bestehenden PDFs...
    #$style = file_get_contents('../css/bootstrap.min.css');
    #$mpdf->WriteHTML($style,1);
    #$style = file_get_contents('../css/custom.css');
    #$mpdf->WriteHTML($style,1);

    # Titelseite ohne Fußzeile initialisieren
    $mpdf->AddPage('','','','','on');

    # Titelseite einfügen
    $titlePage = file_get_contents('../html/pdf_titlepage.inc.html');
    $titlePage = preg_replace('/<h1>.*<\/h1>/', "<h1>Gesamtdokumentation</h1><br /><h2>#{$process['ID']} - {$process['Bezeichnung']}</h2>", $titlePage);
    $titlePage .= '<pagebreak resetpagenum="1" pagenumstyle="1" suppress="off" />';

    $docName = trim($process['Bezeichnung']);
    if(strlen($docName) > 43) {
      $docName = trim(substr($docName, 0, 40)) . '...';
    }
    $mpdf->Bookmark(htmlspecialchars("Gesamtdokumentation #{$process['ID']} - $docName", ENT_QUOTES), 0);
    $mpdf->WriteHTML($titlePage);

    # TOC einfügen
    $mpdf->TOCpagebreakByArray([
      'tocfont' => 'sans-serif',
      'tocfontsize' => '',
      'tocindent' => '',
      'TOCusePaging' => TRUE,
      'TOCuseLinking' => TRUE,
      'toc_preHTML' => "<h2>Inhaltsverzeichnis</h2>",
      'toc_ohvalue' => 'off',
      'toc_ofvalue' => 'off',
      'toc_bookmarkText' => 'Inhaltsverzeichnis'
    ]);

    # Hauptverarbeitungstätigkeit hinzufügen
    $filePath = $pdf_dir . DIRECTORY_SEPARATOR . $process['ID'] . '.pdf';
    if(file_exists($filePath)) {
      $mpdf->SetFooter(htmlspecialchars("#{$process['ID']}|$docName") . '|{PAGENO}');
      $mpdf->TOC_Entry(htmlspecialchars("Hauptverarbeitungstätigkeit #{$process['ID']} - $docName"));
      $mpdf->Bookmark(htmlspecialchars("Hauptverarbeitungstätigkeit #{$process['ID']} - $docName", ENT_QUOTES), 0);

      $pageCount = $mpdf->SetSourceFile($filePath);

      for($c = 1; $c <= $pageCount; $c++) {
        $mpdf->UseTemplate($mpdf->ImportPage($c), 5, 0, 200, 282);
        $mpdf->WriteHTML('<pagebreak />');
      }
    }
    else {
      trigger_error('[SecDoc] verwaltung.php -> Komplett-PDF kann nicht generiert werden, da PDF für Hauptverarbeitungstätigkeit fehlt');
      error_log('[SecDoc] verwaltung.php -> Komplett-PDF kann nicht generiert werden, da PDF für Hauptverarbeitungstätigkeit fehlt');
      return FALSE;
    }

    # Abhängigkeiten hinzufügen
    $dependencies = [
      'Verarbeitungstätigkeiten' => $procDep,
      'Fachapplikationen' => $appDep,
      'IT-Verfahren' => $itDep,
      'übergreifenden Maßnahmen' => $measuresDep
    ];

    foreach($dependencies as $key => $deps) {
      $docCount = count($deps);
      if($docCount === 0) continue;

      usort($deps, function($a, $b) { return (intval($a['id']) - intval($b['id'])); });

      # Überschrift im TOC
      $mpdf->TOC_Entry(htmlspecialchars("Abhängigkeiten von $key"));
      $mpdf->Bookmark(htmlspecialchars("Abhängigkeiten von $key", ENT_QUOTES), 0);

      for($doc = 0; $doc < $docCount; $doc++) {
        $filePath = $pdf_dir . DIRECTORY_SEPARATOR . $deps[$doc]['id'] . '.pdf';

        $docName = trim($deps[$doc]['name']);
        if(strlen($docName) > 43) {
          $docName = trim(substr($docName, 0, 40)) . '...';
        }

        if(file_exists($filePath)) {
          $mpdf->setFooter(htmlspecialchars("#{$deps[$doc]['id']}|$docName") . '|{PAGENO}');
          $mpdf->TOC_Entry(htmlspecialchars("$docName (#{$deps[$doc]['id']})"), 1);
          $mpdf->Bookmark(htmlspecialchars("$docName (#{$deps[$doc]['id']})", ENT_QUOTES), 1);

          $pageCount = $mpdf->SetSourceFile($filePath);

          for($c = 1; $c <= $pageCount; $c++) {
            $mpdf->UseTemplate($mpdf->ImportPage($c), 5, 0, 200, 282);
            $mpdf->WriteHTML('<pagebreak />');
          }
        }
        # Fehlende PDF, obwohl abgeschlossen
        elseif(intval($deps[$doc]['status']) === 2) {
          $mpdf->setFooter(htmlspecialchars("#{$deps[$doc]['id']}|$docName") . '|{PAGENO}');
          $mpdf->TOC_Entry(htmlspecialchars("$docName (#{$deps[$doc]['id']})"), 1);
          $mpdf->Bookmark(htmlspecialchars("$docName (#{$deps[$doc]['id']})", ENT_QUOTES), 1);

          $mpdf->WriteHTML("<h2>Die PDF-Datei für die Dokumentation #{$deps[$doc]['id']} - '" . htmlspecialchars("{$deps[$doc]['name']}") . "' fehlt</h2><p>Die Dokumentation #{$deps[$doc]['id']} ist als abgeschlossen markiert, aber es ist keine PDF-Datei vorhanden!</p><p>Bitte schließen Sie die Dokumentation erneut ab, um eine vollständige PDF-Version zu erzeugen.</p><p><a href=\"$prog_url?id={$deps[$doc]['id']}\">Dokumentation online einsehen</a></p><pagebreak />");
        }
        # Fehlende PDF, da noch nicht abgeschlossen
        elseif(intval($deps[$doc]['status']) === 0) {
          $mpdf->setFooter(htmlspecialchars("#{$deps[$doc]['id']}|$docName") . '|{PAGENO}');
          $mpdf->TOC_Entry(htmlspecialchars("$docName (#{$deps[$doc]['id']})"), 1);
          $mpdf->Bookmark(htmlspecialchars("$docName (#{$deps[$doc]['id']})", ENT_QUOTES), 1);

          $mpdf->WriteHTML("<h2>Die PDF-Datei für die Dokumentation #{$deps[$doc]['id']} - '" . htmlspecialchars("{$deps[$doc]['name']}") . "' fehlt</h2><p>Die Dokumentation #{$deps[$doc]['id']} wurde noch nicht abgeschlossen, so dass bisher keine PDF-Datei existiert.</p><p>Bitte schließen Sie die Dokumentation ab, um eine vollständige PDF-Version zu erzeugen.</p><p><a href=\"$prog_url?id={$deps[$doc]['id']}\">Dokumentation online einsehen</a></p><pagebreak />");
        }
      }
    }

    $pdf_content = $mpdf->Output(
      '',
      \Mpdf\Output\Destination::STRING_RETURN
    );

    # Überprüfen, ob PDF Inhalt hat
    if(empty($pdf_content)) {
      trigger_error('[SecDoc] verwaltung.php -> Generierte PDF ist leer');
      error_log('[SecDoc] verwaltung.php -> Generierte PDF ist leer');
      return FALSE;
    }

    $filename = $pdf_dir . DIRECTORY_SEPARATOR . 'complete.pdf';
    $fh = fopen($filename, 'w+');
    if ($fh) {
      $written_bytes = fwrite($fh, $pdf_content);
      if ($written_bytes == 0) {
        // Es konnte nicht alles geschrieben werden / Kein Speicherplatz mehr?
        trigger_error('[SecDoc] verwaltung.php -> Konnte nicht in PDF-Datei schreiben');
        error_log('[SecDoc] verwaltung.php -> Konnte nicht in PDF-Datei schreiben');
        fclose($fh);
        return FALSE;
      }
      fclose($fh);
    } else {
      /**
       * Fehler beim Öffnen der Datei. Ungültiger Dateiname / Pfad
       * oder eine fehlende Berechtigung könnten die Ursache sein.
       */
      trigger_error('[SecDoc] verwaltung.php -> Kann PDF-Datei nicht anlegen');
      error_log('[SecDoc] verwaltung.php -> Kann PDF-Datei nicht anlegen');
      return FALSE;
    }
    return TRUE;
  }

  /**
   * Generiert eine E-Mail an die eingetragenen Verantwortlichen mit PDF-Datei des Verfahrens als Anhang.
   *
   * @author Victor Nellißen <vinellis@uni-mainz.de>
   *
   * @global string $pdf_dir Verzeichnis für die PDF-Speicherung
   * @global array  $eMail_config Konfiguration für den E-Mail Versand
   * @param DBCon  $dbcon        Datenbank-Verbindung als PDO Objekt
   * @param string $userId       Nutzerkennung
   * @param array  $userGroups   Nutzergruppen
   * @param bool   $userIsDSB    DSB-Berechtigung
   * @param int    $verfahrensId ID des zu exportierenden Verfahrensverzeichnisses
   * @return boolean True bei Erfolg sonst false
   */
  function generateEmail(DBCon $dbcon, string $userId, array $userGroups, bool $userIsDSB, int $verfahrensId): bool
  {
    global $pdf_dir, $eMail_config;

    $ersteller = $userId;
    $techkontakt = $dbcon->getTechKontakt($verfahrensId);
    $fachkontakt = $dbcon->getFachKontakt($verfahrensId);

    $verfahrensInfo = $dbcon->getVerfahrenInfo($verfahrensId);
    $lastUpdate = date('YmdHi', strtotime($verfahrensInfo['Aktualisierung']));
    if ($verfahrensInfo['Typ'] == 1)
    {
      $verfahrensTyp = "einer Verarbeitungstätigkeit";
    }
    elseif ($verfahrensInfo['Typ'] == 3)
    {
      $verfahrensTyp = "einer Fachapplikation";
    }
    elseif ($verfahrensInfo['Typ'] == 2)
    {
      $verfahrensTyp = "eines IT-Verfahrens";
    }
    elseif ($verfahrensInfo['Typ'] == 4)
    {
      $verfahrensTyp = "einer übergreifenden Massnahme";
    }

    $personen = array(
      "Ersteller" => array(
        "uid" => $ersteller,
        "mail" => Utils::getUserAlias($ersteller),
      ),
      "Technischer Ansprechpartner" => array(
        "uid" => $techkontakt,
        "mail" => Utils::getUserAlias($techkontakt),
      ),
      "Fachlicher Ansprechpartner" => array(
        "uid" => $fachkontakt,
        "mail" => Utils::getUserAlias($fachkontakt),
      ),
    );



    # Create a new PHPMailer instance
    require_once '../vendor/autoload.php';
    $mail = new PHPMailer;
    $mail->isSendmail();
    $mail->CharSet = "UTF-8";
    $mail->setFrom($eMail_config['fromEmail'], $eMail_config['fromName']);
    $mail->addReplyTo($eMail_config['replyEmail'], $eMail_config['replyName']);
    $mail->Subject = "[SecDoc] Dokumentation $verfahrensTyp abgeschlossen (Nr. $verfahrensId)";
    $mail->addAttachment($pdf_dir.DIRECTORY_SEPARATOR."$verfahrensId.pdf", "Dokumentation_{$verfahrensId}_{$lastUpdate}.pdf");

    # Überprüft ob smtp genutzt werden soll und holt entsprechend die Einstellungen
    if ($eMail_config['smtp'] === true) {
        $mail->isSMTP();
        $mail->Host = $eMail_config['host'];
        $mail->SMTPAuth = $eMail_config['SMTPAuth'];
        $mail->SMTPSecure =$eMail_config['SMTPSecure'];
        $mail->Username = $eMail_config['Username'];
        $mail->Password = $eMail_config['Password'];
        $mail->Port = $eMail_config['Port'];
     }

     if ($eMail_config['signed'] === true) {
     $mail->sign(
       $eMail_config['CRT'], //The location of your certificate file
       $eMail_config['KEY'], //The location of your private key file
       //The password you protected your private key with (not the Import Password!)
       //May be empty but the parameter must not be omitted!
       $eMail_config['PKP'],
       $eMail_config['PEM'] //The location of your chain file
      );
    }

    # Überprüft ob ein Kontakt merhmals eingetragen worden ist
    if ($personen['Ersteller']['uid'] === $personen['Technischer Ansprechpartner']['uid'] && $personen['Ersteller']['uid'] === $personen['Fachlicher Ansprechpartner']['uid'] ) {
      $personen['Ersteller, Technischer Ansprechpartner, Fachlicher Ansprechpartner'] = $personen['Ersteller'];
      unset($personen['Ersteller']);
      unset($personen['Technischer Ansprechpartner']);
      unset($personen['Fachlicher Ansprechpartner']);
    } elseif ($personen['Ersteller']['uid'] === $personen['Technischer Ansprechpartner']['uid']) {
      $personen['Ersteller, Technischer Ansprechpartner'] = $personen['Ersteller'];
      unset($personen['Ersteller']);
      unset($personen['Technischer Ansprechpartner']);
    } elseif ($personen['Ersteller']['uid'] === $personen['Fachlicher Ansprechpartner']['uid']) {
      $personen['Ersteller, Fachlicher Ansprechpartner'] = $personen['Ersteller'];
      unset($personen['Ersteller']);
      unset($personen['Fachlicher Ansprechpartner']);
    } elseif ($personen['Fachlicher Ansprechpartner']['uid'] === $personen['Technischer Ansprechpartner']['uid']) {
      $personen['Fachlicher Ansprechpartner, Technischer Ansprechpartner'] = $personen['Technischer Ansprechpartner'];
      unset($personen['Fachlicher Ansprechpartner']);
      unset($personen['Technischer Ansprechpartner']);
    }

    $mailSuccess = TRUE;

    foreach($personen as $key => $value) {
      $emailText = str_replace('$role', $key, $eMail_config['text']);
      $emailText = str_replace('$verfahrensId', $verfahrensId, $emailText);
      $emailText = str_replace('$verfahrensTyp', $verfahrensTyp, $emailText);
      $emailText = str_replace('$title', $verfahrensInfo['Bezeichnung'], $emailText);
      $emailText = str_replace('\n', "\n", $emailText);
      $emailText = strip_tags($emailText);

      if (!empty($personen[$key]['mail'])) {
        $mail->addAddress($personen[$key]['mail'], $personen[$key]['name']);
        $mail->Body = Utils::getUserAnrede($personen[$key]['uid']) . ",\n\n$emailText";
        $currSuccess = $mail->send();
        $mailSuccess = $mailSuccess && $currSuccess;
        if (!$currSuccess) {
          trigger_error("[SecDoc] Verwaltung.php -> Fehler beim Senden der E-Mail. $mail->ErrorInfo");
          error_log("[SecDoc] Verwaltung.php -> Fehler beim Senden der E-Mail. $mail->ErrorInfo ");
          break;
        }
      }
      $mail->clearAddresses();
    }

    return $mailSuccess;
  }

  /**
   * Gibt eine Fehlermeldung im einheitlichen Format zurück und beendet die Ausführung danach (genutzt für fehlerhafte Aufrufe).
   *
   * @global bool $debug
   * @global string $userId     Nutzerkennung
   * @global array $userGroups  Nutzergruppen des aktuellen Nutzers
   * @global array $debugGroups Nutzergruppen, die Fehlermeldungen anzeigen dürfen
   * @param string $msg Fehlermeldung
   * @return void
   */
  function returnError(string $msg): void {

    global $debug, $userId, $userGroups, $debugGroups;

    if($debug && !empty($userId) && Utils::checkUserGroups($userGroups, $debugGroups)) {
      $output['debug'] = ob_get_contents();
    }
    ob_clean();

    $output['success'] = FALSE;
    $output['error'] = $msg;
    $result = json_encode($output);
    header('Content-type: application/json; charset=utf-8');
    header('Content-length: ' . strlen($result));
    print($result);
    ob_end_flush();
    exit(1);
  }

  /*
   * Hauptprogramm
   */
  # Variablen setzen
  $dbcon = new DBCon($db_dir, $db_name);
  $output['version'] = $prog_name . ' ' . $prog_version;
  $reqMethod = is_string($_SERVER['REQUEST_METHOD']) ? $_SERVER['REQUEST_METHOD'] : '';
  $action = '';
  $verfahrensId = NULL;
  $data = NULL;
  $userId = NULL;
  $userGroups = [];
  $userCanDSB = FALSE;
  $userIsDSB = FALSE;
  $fachabteilung = '-- keine --';
  $ivv = '-- keine --';
  $search = '';

  # Anfrageparamter holen
  switch($reqMethod) {
    case 'GET': {
      $action = isset($_REQUEST['action']) ? filter_var($_REQUEST['action'], FILTER_SANITIZE_STRING) : '';
      $verfahrensId = isset($_REQUEST['id']) ? filter_var($_REQUEST['id'], FILTER_SANITIZE_NUMBER_INT) : NULL;
      $data = isset($_REQUEST['data']) ? json_decode($_REQUEST['data'], TRUE) : NULL;
      $search = isset($_REQUEST['search']) ? filter_var($_REQUEST['search'], FILTER_SANITIZE_STRING) : '';
      break;
    }

    case 'POST': {
      $postData = json_decode(file_get_contents("php://input"), TRUE);
      if($postData === NULL) {
        returnError('Die POST-Daten müssen JSON-kodiert übertragen werden!');
      }
      $action = isset($postData['action']) ? filter_var($postData['action'], FILTER_SANITIZE_STRING) : '';
      $verfahrensId = isset($postData['id']) ? filter_var($postData['id'], FILTER_SANITIZE_NUMBER_INT) : NULL;
      $data = isset($postData['data']) ? $postData['data'] : NULL;
      $search = isset($postData['search']) ? filter_var($postData['search'], FILTER_SANITIZE_STRING) : '';
      break;
    }

    default: {
      returnError('Keine unterstützte Anfragemethode wurde gewählt (GET oder POST)!');
    }
  }

  $action = strtolower(trim($action));

  # Prüfen ob ein Login durchgeführt werden soll
  if($action === 'login') {
    if(!isset($data['user']) || !isset($data['password'])) {
      http_response_code(401);
      returnError('Keine Zugangsdaten übergeben!');
    }

    if(!$authClass->loginUser(trim($data['user']), $data['password'])) {
      http_response_code(401);
      returnError('Ungültige Zugangsdaten übergeben!');
    }
  }

  # Prüfen ob der Nutzer eingeloggt ist
  if(!$authClass->checkSession()) {
    http_response_code(401);
    returnError('Keine gültige Session vorhanden! Bitte zuerst einloggen!');
  }

  # Prüfen ob der Nutzer Berechtigung zur Nutzung von SecDoc hat
  if(!$authClass->checkUsePerm()) {
    http_response_code(403);
    returnError('Sie haben keine Berechtigung zur Nutzung von SecDoc!');
  }

  # Nutzerkennung des aktuellen Nutzers holen
  $userId = $authClass->getUserID();
  $cert_bearbeiter = $userId; # Infos über eingeloggten Bearbeiter holen (wird genutzt von imap_send_mime_mail())

  # Nutzergruppen holen
  $userGroups = $authClass->getUserGroups();

  # Prüfen, ob der Nutzer ein DSB, Admin oder Bereichsleiter ist
  $userCanDSB    = in_array($userId, $dsbIDs) || $authClass->checkDPOPerm();
  $userIsAdmin   = $authClass->checkAdminPerm();
  $userIsManager = $authClass->checkManagerPerm();

  $dsbCookie = preg_replace("/\W/", '_', $prog_name . ' ' . $prog_version) . '_dsb';
  if(isset($_COOKIE[$dsbCookie]) && $_COOKIE[$dsbCookie] === '1' && $userCanDSB) {
    $userIsDSB = TRUE;
  }

  # DB Verbindung überprüfen
  if(!$dbcon->isConnected()) {
    returnError('Es konnte keine DB-Verbindung hergestellt werden! Versuchen Sie es später erneut.');
  }

  # Im Wartungs Fehler bei schreibenden Funktionen ausgeben
  if($maintenanceMode && in_array($action, ['create', 'update', 'finish', 'delete', 'updatecomment', 'gendraftpdf', 'adddocument', 'updatedocument', 'deletedocument'])) {
    returnError('Funktion steht im Wartungsmodus nicht zur Verfügung!');
  }

  # Gewünschte Aktion ausführen
  switch($action) {
    # Liest alle Verfahren aus, auf die $userId Zugriff hat
    case 'list': {
      if($userIsDSB) {
        $list = $dbcon->listVerfahrenDSB();
      }
      else {
        $list = $dbcon->listVerfahrenOwn($userId, $userGroups);
        $list = array_merge($list, $dbcon->listVerfahrenShared($userId, $userGroups));
      }

      $count = count($list);

      # Prüft, welche PDFs bereits existieren
      $currPDFs = scandir($pdf_dir);
      for($c = 0; $c < $count; $c++) {
        $list[$c]['PDF'] = array_search($list[$c]['ID'] . '.pdf', $currPDFs) ? TRUE : FALSE;
      }

      $output['count'] = $count;
      $output['data'] = $list;
      break;
    }

    # Listet alle Verfahren auf, die einsehbar, aber nicht bearbeitbar sind
    case 'listshared': {
      $list = $dbcon->listVerfahrenShared($userId, $userGroups);
      $count = count($list);

      # Prüft, welche PDFs bereits existieren
      $currPDFs = scandir($pdf_dir);
      for($c = 0; $c < $count; $c++) {
        $list[$c]['PDF'] = array_search($list[$c]['ID'] . '.pdf', $currPDFs) ? TRUE : FALSE;
      }

      $output['count'] = $count;
      $output['data'] = $list;
      break;
    }

    # Listet alle Verfahren für DSBs auf
    case 'listdsb': {
      if(!$userIsDSB) {
        returnError('Sie haben keine Berechtigung diese Funktion aufzurufen!');
      }

      $list = $dbcon->listVerfahrenDSB();
      $count = count($list);

      # Prüft, welche PDFs bereits existieren
      $currPDFs = scandir($pdf_dir);
      for($c = 0; $c < $count; $c++) {
        $list[$c]['PDF'] = array_search($list[$c]['ID'] . '.pdf', $currPDFs) ? TRUE : FALSE;
      }

      $output['count'] = $count;
      $output['data'] = $list;
      break;
    }

    # Durchsucht die für den aktuellen Nutzer einsehbaren Verfahren (nur IT-Verfahren)
    case 'searchverfahren': {
      if($userIsDSB) {
        $list = $dbcon->listVerfahrenDSB($search);
      }
      else {
        $list = $dbcon->listVerfahrenOwn($userId, $userGroups, $search);
        $list = array_merge($list, $dbcon->listVerfahrenShared($userId, $userGroups, $search));
      }

      $result = array();
      foreach($list as $entry) {
        if(intval($entry['Typ']) === 2) array_push($result, array('value' => $entry['ID'], 'label' => $entry['Bezeichnung'] . " [" . $entry['Fachabteilung'] . "]"));
      }

      $output['data'] = $result;
      $output['count'] = count($result);
      $output['success'] = TRUE;
      break;
    }

    # Durchsucht die für den aktuellen Nutzer einsehbaren übergreifenden Massnahmen
    case 'searchmassnahmen': {
      if($userIsDSB) {
        $list = $dbcon->listVerfahrenDSB($search);
      }
      else {
        $list = $dbcon->listVerfahrenOwn($userId, $userGroups, $search);
        $list = array_merge($list, $dbcon->listVerfahrenShared($userId, $userGroups, $search));
      }

      $result = array();
      foreach($list as $entry) {
        if(intval($entry['Typ']) === 4) array_push($result, array('value' => $entry['ID'], 'label' => $entry['Bezeichnung'] . " [" . $entry['Fachabteilung'] . "]"));
      }

      $output['data'] = $result;
      $output['count'] = count($result);
      $output['success'] = TRUE;
      break;
    }

    # Durchsucht die für den aktuellen Nutzer einsehbaren Fachapplikationen
    case 'searchfachapp': {
      if($userIsDSB) {
        $list = $dbcon->listVerfahrenDSB($search);
      }
      else {
        $list = $dbcon->listVerfahrenOwn($userId, $userGroups, $search);
        $list = array_merge($list, $dbcon->listVerfahrenShared($userId, $userGroups, $search));
      }

      $result = array();
      foreach($list as $entry) {
        if(intval($entry['Typ']) === 3) array_push($result, array('value' => $entry['ID'], 'label' => $entry['Bezeichnung'] . " [" . $entry['Fachabteilung'] . "]"));
      }

      $output['data'] = $result;
      $output['count'] = count($result);
      $output['success'] = TRUE;
      break;
    }

    # Durchsucht die für den aktuellen Nutzer einsehbaren Verarbeitungstätigkeiten
    case 'searchverarbeitung': {
      if($userIsDSB) {
        $list = $dbcon->listVerfahrenDSB($search);
      }
      else {
        $list = $dbcon->listVerfahrenOwn($userId, $userGroups, $search);
        $list = array_merge($list, $dbcon->listVerfahrenShared($userId, $userGroups, $search));
      }

      $result = array();
      foreach($list as $entry) {
        if(intval($entry['Typ']) === 1) array_push($result, array('value' => $entry['ID'], 'label' => $entry['Bezeichnung'] . " [" . $entry['Fachabteilung'] . "]"));
      }

      $output['data'] = $result;
      $output['count'] = count($result);
      $output['success'] = TRUE;
      break;
    }

    # Liest ein bestehendes Verfahren aus (sowohl bearbeitbare, wie auch nur einsehbare)
    case 'get': {
      if(empty($verfahrensId)) {
        returnError('Keine ID für ein Verfahren wurde übergeben!');
      }

      $proc = $dbcon->getVerfahren($verfahrensId, $userId, $userGroups, $userIsDSB);

      if(empty($proc)) {
        returnError('Kein Verfahren mit der angebenen ID konnte gefunden werden oder Sie haben keinen Zugriff darauf!');
      }

      if(!empty($proc[0]['BearbeitetVon'])) {
        $editorDetails = Utils::searchUsers($proc[0]['BearbeitetVon'], TRUE);
        $proc[0]['BearbeitetVonName'] = !empty($editorDetails[0]['name']) ? $editorDetails[0]['name'] : 'Kennung: ' . $proc[0]['BearbeitetVon'];
      }

      if($maintenanceMode) {
        $proc[0]['Editierbar'] = FALSE;
      }

      $output['count'] = 1;
      $output['data'] = $proc;
      $output['success'] = TRUE;
      break;
    }

    # Erstellt ein neues Verfahren und vergibt eine eindeutige ID
    case 'create': {
      if(empty($data)) {
        returnError('Keine JSON-kodierter Inhalt für das neue Verfahren wurde übergeben!');
        break;
      }

      // Generiert eine neue VerfahrensID, die noch unbenutzt ist
      $newId = random_int(1000, 9999);
      while($dbcon->checkVerfahren($newId)) {
        $newId = random_int(1000, 9999);
      }

      // Benötigte Parameter in $data überprüfen
      $reqVars = array(
        'allgemein_typ',
        'allgemein_bezeichnung',
        'allgemein_abteilung',
      );
      foreach($reqVars as $reqVar) {
        if(!isset($data[$reqVar]) || empty($data[$reqVar])) {
          returnError('Ein oder mehrere notwendige Parameter fehlen - Aktuell: ' . $reqVar);
        }
      }

      if(intval($data['allgemein_typ']) === 4 && !$userIsDSB && !$userIsManager) {
        returnError('Nur Nutzer mit DSB- oder Bereichsleiter-Berechtigung können übergreifende Massnahmen anlegen!');
        break;
      }

      # HTML Symbole ersetzen
      $data = Utils::encodeHTMLArray($data);

      # Verfahren erstellen
      $id = $dbcon->addVerfahren($userId, $newId, intval($data['allgemein_typ']), $data['allgemein_bezeichnung'], $data['allgemein_datum'], $data['allgemein_beschreibung'], intval($data['massnahmen_risiko']), $data['allgemein_abteilung'], $data['allgemein_ivv'] ?: '', $data['allgemein_fachlich_kennung'] ?: '', $data['allgemein_technisch_kennung'] ?: '', json_encode($data));

      # Berechtigungen eintragen (falls schon gegeben)
      $newPermissions = [];

      if(isset($data['meta_nutzer_kennung'])) {
        for($c = 0; $c < count($data['meta_nutzer_kennung']); $c++) {
          if(empty($data['meta_nutzer_kennung'][$c]) && empty($data['meta_nutzer_name'][$c])) continue;

          array_push($newPermissions, [
            'id' => empty($data['meta_nutzer_kennung'][$c]) ? $data['meta_nutzer_name'][$c] : $data['meta_nutzer_kennung'][$c],
            'isgroup' => FALSE,
            'canedit' => intval($data['meta_nutzer_schreiben'][$c]) === 1 ? TRUE : FALSE
          ]);
        }
      }

      if(isset($data['meta_gruppen_kennung'])) {
        for($c = 0; $c < count($data['meta_gruppen_kennung']); $c++) {
          if(empty($data['meta_gruppen_kennung'][$c]) && empty($data['meta_gruppen_name'][$c])) continue;

          array_push($newPermissions, [
            'id' => empty($data['meta_gruppen_kennung'][$c]) ? $data['meta_gruppen_name'][$c] : $data['meta_gruppen_kennung'][$c],
            'isgroup' => TRUE,
            'canedit' => intval($data['meta_gruppen_schreiben'][$c]) === 1 ? TRUE : FALSE
          ]);
        }
      }

      $setPermission = $dbcon->updatePermissions($id, $userId, $userGroups, $newPermissions, $userIsDSB);

      if(!$setPermission) error_log("[SecDoc] verwaltung.php -> Konnte neue Berechtigungen für Verfahren #$id nicht setzen!");

      # Abhängigkeiten eintragen
      $newDependencies = [];
      if(isset($data['abschluss_abhaengigkeit_id']) && is_array($data['abschluss_abhaengigkeit_id'])) {
        foreach($data['abschluss_abhaengigkeit_id'] as $dependency) {
          $dependency = intval($dependency);
          if($dependency !== 0) array_push($newDependencies, $dependency);
        }
      }

      if(isset($data['itverfahren_abhaengigkeit_id']) && is_array($data['itverfahren_abhaengigkeit_id'])) {
        foreach($data['itverfahren_abhaengigkeit_id'] as $dependency) {
          $dependency = intval($dependency);
          if($dependency !== 0) array_push($newDependencies, $dependency);
        }
      }

      if(isset($data['verarbeitung_abhaengigkeit_id']) && is_array($data['verarbeitung_abhaengigkeit_id'])) {
        foreach($data['verarbeitung_abhaengigkeit_id'] as $dependency) {
          $dependency = intval($dependency);
          if($dependency !== 0) array_push($newDependencies, $dependency);
        }
      }

      if(!$dbcon->updateDependency($id, $newDependencies, $userId, $userGroups, $userIsDSB)) error_log("[SecDoc] verwaltung.php -> Konnte neue Abhängigkeiten für Verfahren #$id nicht eintragen!");

      $output['data'] = ['ID' => $id, 'Date' => date("Y-m-d H:i:s")];
      $output['success'] = TRUE;
      break;
    }

    # Aktualisiert ein Verfahren mit den übergebenen Daten
    case 'update': {
      if(empty($verfahrensId)) {
        returnError('Keine ID für ein Verfahren wurde übergeben!');
      }
      if(empty($data)) {
        returnError('Kein JSON-kodierter Inhalt für das neue Verfahren wurde übergeben!');
      }

      // Benötigte Parameter in $data überprüfen
      $reqVars = array(
        'allgemein_typ',
        'allgemein_bezeichnung',
        'allgemein_abteilung',
        'meta_lastupdate'
      );
      foreach($reqVars as $reqVar) {
        if(!isset($data[$reqVar]) || empty($data[$reqVar])) {
          returnError('Ein oder mehrere notwendige Parameter fehlen - Aktuell: ' . $reqVar);
          break;
        }
      }

      // Überprüfen, ob das Verfahren nicht durch eine andere Person seit dem letzten Laden bearbeitet wurde
      $lastUpdate = $dbcon->getHistorie($verfahrensId);
      if($lastUpdate && isset($lastUpdate[0]['Datum']) && (strtotime($lastUpdate[0]['Datum']) - 1) > strtotime($data['meta_lastupdate'])) {
        returnError('Das Verfahren wurde seit der letzten Synchronisation bearbeitet (Nutzer: ' . ($lastUpdate[0]['Anzeigename'] ?: ($lastUpdate[0]['Name'] ?: 'Unbekannt' ) . ' (' . $lastUpdate[0]['Kennung'] . ')') . ' - Datum: ' . $lastUpdate[0]['Datum'] . ')! Bitte laden Sie die Seite neu für eine aktuelle Version des Verfahrens!');
      }
      unset($data['meta_lastupdate']);

      # HTML Symbole ersetzen
      $data = Utils::encodeHTMLArray($data);

      # Verfahren aktualisieren
      $success = $dbcon->updateVerfahren($verfahrensId, $userId, $userGroups, intval($data['allgemein_typ']), $data['allgemein_bezeichnung'], $data['allgemein_datum'], $data['allgemein_beschreibung'], intval($data['massnahmen_risiko']), $data['allgemein_abteilung'], $data['allgemein_ivv'] ?: '', $data['allgemein_fachlich_kennung'] ?: '', $data['allgemein_technisch_kennung'] ?: '', isset($data['meta_sichtbarkeit']) ? $data['meta_sichtbarkeit'] : 0, json_encode($data), $userIsDSB);

      # Berechtigungen aktualisieren
      $newPermissions = [];

      if(isset($data['meta_nutzer_kennung'])) {
        for($c = 0; $c < count($data['meta_nutzer_kennung']); $c++) {
          if(empty($data['meta_nutzer_kennung'][$c])) continue;

          array_push($newPermissions, [
            'id' => $data['meta_nutzer_kennung'][$c],
            'isgroup' => FALSE,
            'canedit' => intval($data['meta_nutzer_schreiben'][$c]) === 1 ? TRUE : FALSE
          ]);
        }
      }

      if(isset($data['meta_gruppen_kennung'])) {
        for($c = 0; $c < count($data['meta_gruppen_kennung']); $c++) {
          if(empty($data['meta_gruppen_kennung'][$c])) continue;

          array_push($newPermissions, [
            'id' => $data['meta_gruppen_kennung'][$c],
            'isgroup' => TRUE,
            'canedit' => intval($data['meta_gruppen_schreiben'][$c]) === 1 ? TRUE : FALSE
          ]);
        }
      }

      $setPermission = $dbcon->updatePermissions($verfahrensId, $userId, $userGroups, $newPermissions, $userIsDSB);

      if(!$setPermission) error_log("[SecDoc] verwaltung.php -> Konnte neue Berechtigungen für Verfahren #$verfahrensId nicht setzen!");

      # Abhängigkeiten eintragen
      $newDependencies = [];
      if(isset($data['abschluss_abhaengigkeit_id']) && is_array($data['abschluss_abhaengigkeit_id'])) {
        foreach($data['abschluss_abhaengigkeit_id'] as $dependency) {
          $dependency = intval($dependency);
          if($dependency !== 0) array_push($newDependencies, $dependency);
        }
      }

      if(isset($data['itverfahren_abhaengigkeit_id']) && is_array($data['itverfahren_abhaengigkeit_id'])) {
        foreach($data['itverfahren_abhaengigkeit_id'] as $dependency) {
          $dependency = intval($dependency);
          if($dependency !== 0) array_push($newDependencies, $dependency);
        }
      }

      if(isset($data['verarbeitung_abhaengigkeit_id']) && is_array($data['verarbeitung_abhaengigkeit_id'])) {
        foreach($data['verarbeitung_abhaengigkeit_id'] as $dependency) {
          $dependency = intval($dependency);
          if($dependency !== 0) array_push($newDependencies, $dependency);
        }
      }

      if(isset($data['massnahmen_abhaengigkeit_id']) && is_array($data['massnahmen_abhaengigkeit_id'])) {
        foreach($data['massnahmen_abhaengigkeit_id'] as $dependency) {
          $dependency = intval($dependency);
          if($dependency !== 0) array_push($newDependencies, $dependency);
        }
      }

      if(!$dbcon->updateDependency($verfahrensId, $newDependencies, $userId, $userGroups, $userIsDSB)) error_log("[SecDoc] verwaltung.php -> Konnte neue Abhängigkeiten für Verfahren #$verfahrensId nicht eintragen!");

      if($success && $dbcon->getStatus($verfahrensId, $userId, $userGroups, $userIsDSB) === 2) {
        /**
         * Sobald das Verfahrensverzeichnis aktualisiert wurde, muss auch der
         * Textschnipsel dementsprechend angepasst werden. Dabei ist es nicht
         * schlimm, dass das Verfahrensverzeichnis noch gar nicht fertig
         * gestellt wurde.
         */
        $output['gentxt'] = generateTXT($dbcon, $userId, $userGroups, $userIsDSB, $verfahrensId);

        # Status zurücksetzen auf "In Bearbeitung", falls es zuvor als "In Betrieb" gekennzeichnet war
        $dbcon->updateStatus($verfahrensId, $userId, $userGroups, 0, $userIsDSB);
      }

      if($success === FALSE) {
        returnError('Kein Verfahren wurde aktualisiert, da entweder das Verfahren nicht gefunden wurde oder Sie keine Berechtigung haben!');
      }

      $output['data'] = ['Date' => date("Y-m-d H:i:s")];
      $output['success'] = TRUE;
      break;
    }

    # Schließt das Verfahren ab
    case 'finish': {
      if(empty($verfahrensId)) {
        returnError('Keine ID für ein Verfahren wurde übergeben!');
      }

      if(empty($data) || !array_key_exists('title', $data) || !array_key_exists('pdfCode', $data) || !array_key_exists('lastupdate', $data) || !array_key_exists('comment', $data)) {
        returnError('Kein JSON-kodierter Inhalt zum Abschluss wurde übergeben (title, pdfCode, lastupdate, comment)!');
      }

      // Überprüfen, ob das Verfahren nicht durch eine andere Person seit dem letzten Laden bearbeitet wurde
      $lastUpdate = $dbcon->getHistorie($verfahrensId);
      if($lastUpdate && isset($lastUpdate[0]['Datum']) && (strtotime($lastUpdate[0]['Datum']) - 1) > strtotime($data['lastupdate'])) {
        returnError('Das Verfahren wurde seit der letzten Synchronisation bearbeitet (Nutzer: ' . ($lastUpdate[0]['Anzeigename'] ?: ($lastUpdate[0]['Name'] ?: 'Unbekannt' ) . ' (' . $lastUpdate[0]['Kennung'] . ')') . ' - Datum: ' . $lastUpdate[0]['Datum'] . ')! Bitte laden Sie die Seite neu für eine aktuelle Version des Verfahrens!');
        break;
      }

      $success = $dbcon->updateStatus($verfahrensId, $userId, $userGroups, 2, $userIsDSB);

      if($success === 0) {
        returnError('Kein Verfahren wurde aktualisiert, da entweder das Verfahren nicht gefunden wurde oder Sie keine Berechtigung haben!');
      }

      # Revision anlegen (falls Kommentar angegeben)
      if(!empty($data['comment'])) {
        $editor = Utils::searchUsers($userId, TRUE);
        $editor = (empty($editor) || empty($editor[0]['name'])) ? $userId : $editor[0]['name'];
        $dbcon->addRevision($verfahrensId, htmlspecialchars($data['comment'], ENT_QUOTES, 'UTF-8', FALSE), $editor);
      }

      if($success) {
        $output['gentxt'] = generateTXT($dbcon, $userId, $userGroups, $userIsDSB, $verfahrensId);
        $output['genpdf'] = generatePDF(htmlspecialchars($data['title'], ENT_QUOTES, 'UTF-8', FALSE), $data['pdfCode'], $verfahrensId);
        $output['genmail'] = FALSE;
        if ($output['genpdf']) {
          $output['genmail'] = generateEmail($dbcon, $userId, $userGroups, $userIsDSB, $verfahrensId);
        }
      }

      $output['success'] = TRUE;
      break;
    }

    # Löscht ein Verfahren (es wird aktuell nur als gelöscht markiert)
    case 'delete': {
      if(empty($verfahrensId)) {
        returnError('Keine ID für ein Verfahren wurde übergeben!');
      }

      if(!$userIsDSB && $dbcon->getPermissionLevel($verfahrensId, $userId, $userGroups) < 2) {
        returnError('Keine Schreibberechtigung für die gewählte Dokumentation!');
      }

      $dependencies = $dbcon->getDependencies($verfahrensId, $userId, $userGroups, $userIsDSB);

      if(is_array($dependencies) && count($dependencies) > 0) {
        returnError('Kein Verfahren wurde gelöscht, da das Verfahren noch als Abhängigkeit für andere Verfahren eingetragen ist!');
      }

      $success = $dbcon->delVerfahren($verfahrensId, $userId, $userGroups, $userIsDSB);

      if(!$success) {
        returnError('Kein Verfahren wurde gelöscht, da entweder das Verfahren nicht gefunden wurde oder Sie keine Berechtigung haben!');
      }

      $output['success'] = TRUE;
      break;
    }

    # Gibt die Bearbeitungshistorie für ein Verfahren zurück
    case 'history': {
      if(empty($verfahrensId)) {
        returnError('Keine ID für ein Verfahren wurde übergeben!');
      }

      $history = $dbcon->getHistorie($verfahrensId);

      if(empty($history)) {
        $output['error'] = 'Kein Verfahren mit der angebenen ID konnte gefunden werden oder Sie haben keinen Zugriff darauf!';
        break;
      }

      $output['count'] = count($history);
      $output['data'] = $history;
      $output['success'] = TRUE;
      break;
    }

    # Gibt die Abhängigkeiten für ein Verfahren zurück
    case 'dependencies': {
      if(empty($verfahrensId)) {
        returnError('Keine ID für ein Verfahren wurde übergeben!');
      }

      $dependencies = $dbcon->getDependencies($verfahrensId, $userId, $userGroups, $userIsDSB);

      if($dependencies === FALSE) {
        $output['error'] = 'Keine Berechtigung zum Abruf der Abhängigkeiten für das gewählte Verfahren!';
        break;
      }

      $output['count'] = count($dependencies);
      $output['data'] = $dependencies;
      $output['success'] = TRUE;
      break;
    }

    # Gibt die Informationen für den Grundschutz-Check zurück
    case 'tomcheck': {
      if(!$userIsDSB) {
        returnError('Sie haben keine Berechtigung diese Funktion aufzurufen!');
      }

      if(empty($verfahrensId)) {
        returnError('Keine ID für ein Verfahren wurde übergeben!');
      }

      $mainDoc = $dbcon->getVerfahren($verfahrensId, $userId, $userGroups, $userIsDSB);

      if(empty($mainDoc)) returnError('Dokumentation existiert nicht');

      # Abhängigkeiten rekursiv durchsuchen
      $checkIDs     = [$verfahrensId];
      $doneIDS      = [];
      $dependencies = [];

      while(!empty($checkIDs)) {
        $currID = array_pop($checkIDs);
        array_push($doneIDS, $currID);
        $currDeps = $dbcon->getDependenciesOf($currID, $userId, $userGroups, $userIsDSB);

        if(!empty($currDeps)) {
          $dependencies = array_merge($dependencies, $currDeps);
          foreach($currDeps as $dep) {
            if(!in_array($dep['id'], $doneIDS)) array_push($checkIDs, $dep['id']); # Alle neuen IDs für die Abhängigkeiten-Suche einreihen, falls nicht schon zuvor verarbeitet
          }
        }
      }

      # Für alle Dokumentationen den Inhalt holen
      $contentStore = [
        $verfahrensId => json_decode($mainDoc[0]['JSON'], TRUE)
      ];
      foreach($dependencies as $doc) {
        $tempDoc = $dbcon->getVerfahren($doc['id'], $userId, $userGroups, $userIsDSB);
        $contentStore[$doc['id']] = json_decode($tempDoc[0]['JSON'], TRUE);
      }

      uasort($contentStore, function ($a, $b) { return strcmp(strval($a['allgemein_bezeichnung']), strval($b['allgemein_bezeichnung'])); });

      # TOMS zusammenführen
      $tomStore = [];
      foreach($contentStore as $doc) {
        $docKeys = array_keys($doc);
        # TOMs ignorieren, falls Template genutzt
        if(in_array('massnahmen_abhaengigkeit_id', $docKeys) && !empty($doc['massnahmen_abhaengigkeit_id'][0])) continue;

        foreach($docKeys as $key) {
          # Nur TOM Felder betrachten
          if(in_array($key, ['massnahmen_risiko', 'massnahmen_vertraulichkeit', 'massnahmen_integritaet', 'massnahmen_verfuegbarkeit']) || strpos($key, 'massnahmen_') !== 0) continue;

          if(!in_array($key, array_keys($tomStore))) $tomStore[$key] = [];

          //$tomStore[$key][$doc['meta_id']] = $doc[$key];
          array_push($tomStore[$key], ['id' => $doc['meta_id'], 'data' => $doc[$key]]);
        }
      }

      ksort($tomStore, SORT_NATURAL);

      $result = [
        'docs' => $contentStore,
        'toms' => $tomStore
      ];

      $output['count'] = 2;
      $output['data'] = $result;
      $output['success'] = TRUE;
      break;
    }

    # Gibt die zuletzt erstellte PDF eines Verfahrens zurück
    case 'getpdf': {
      if(empty($verfahrensId)) {
        returnError('Keine ID für ein Verfahren oder kein Inhalt wurde übergeben!');
      }

      $details = $dbcon->getVerfahren($verfahrensId, $userId, $userGroups, $userIsDSB);

      if(empty($details)) {
        returnError('Das Verfahren existiert nicht oder Sie haben keine Berechtigung darauf zuzugreifen!');
      }

      $draft = FALSE;
      if(!empty($data) && !empty($data['draft'])) {
        $draft = $data['draft'];
      }

      $filename = $pdf_dir . DIRECTORY_SEPARATOR . $verfahrensId . ($draft ? '_DRAFT' : '') . '.pdf';
      $fh = fopen($filename, 'r');

      if($fh) {
        $filesize = filesize($filename);
        $pdfContent = file_get_contents($filename);
        $output['count'] = $filesize;
        $output['data']['status'] = intval($details[0]['Status']);
        $output['data']['lastupdate'] = $details[0]['Aktualisierung'];
        $output['data']['title'] = $details[0]['Bezeichnung'];
        $output['data']['type'] = intval($details[0]['Typ']);
        $output['data']['pdf'] = base64_encode($pdfContent);
        $output['success'] = TRUE;
      }
      else {
        trigger_error('[SecDoc] verwaltung.php -> Kann PDF-Datei nicht öffnen');
        error_log('[SecDoc] verwaltung.php -> Kann PDF-Datei nicht öffnen');
        if($draft) returnError('Die gewünschte PDF existiert nicht! Es muss zuerst eine neue Vorschau-PDF generiert werden.');
        returnError('Die gewünschte PDF existiert nicht! Das Verfahren muss einmal abgeschlossen werden, damit eine PDF-Version generiert wird.');
      }

      break;
    }

    # Aktualisiert den DSB-Kommentar zu einem Verfahren
    case 'updatecomment': {
      if(empty($verfahrensId) || empty($data) || !isset($data['comment'])) {
        returnError('Keine ID für ein Verfahren oder kein Inhalt wurde übergeben!');
      }
      if(!$userIsDSB) {
        returnError('Sie haben keine Berechtigung diese Funktion aufzurufen!');
      }

      $success = $dbcon->updateDSBKommentar($verfahrensId, $data['comment']);

      if($success === FALSE) {
        returnError('Der Kommentar konnte nicht gespeichert werden, da das Verfahren nicht existiert!');
      }

      $output['success'] = TRUE;
      break;
    }

    # Personensuche nach Name und Kennung
    case 'searchperson': {
      if(empty($search)) {
        $search = $userId;
        $result = Utils::searchUsers($search, TRUE);
      }
      else {
        $result = Utils::searchUsers($search);
      }

      if($search == $userId) {
        $result[0]['userIsDSB']      = $userIsDSB;
        $result[0]['userCanDSB']     = $userCanDSB;
        $result[0]['userIsManager']  = $userIsManager;
      }
      $output['data'] = $result;
      $output['count'] = count($result);
      break;
    }

    # Mitarbeitersuche nach Name und Kennung
    case 'searchmitarbeiter': {
      if(empty($search)) {
        $search = $userId;
      }
      $result = Utils::searchUsers($search, FALSE, TRUE);
      $output['data'] = $result;
      $output['count'] = count($result);
      break;
    }

    # Suche nach Organisationseinheiten
    case 'searchabteilung': {
      $result = $dbcon->searchFachabteilung($search);
      $resultMod = [];
      foreach($result as $val) {
        array_push($resultMod, $val['Name']);
      }
      $output['data'] = $resultMod;
      $output['count'] = count($resultMod);
      break;
    }

    # Suche nach IVVen
    case 'searchivv': {
      $result = $dbcon->searchIVV($search);
      $resultMod = [];
      foreach($result as $val) {
        array_push($resultMod, $val['Name']);
      }
      $output['data'] = $resultMod;
      $output['count'] = count($resultMod);
      break;
    }

    # Durchsucht die CPE Datenbank nach Applikationen
    case 'searchapp': {
      $result = $dbcon->searchCPE($search, 'a');
      $resultMod = [];
      foreach($result as $val) {
        array_push($resultMod, ['value' => $val['CPE'], 'label' => $val['Name']]);
      }
      $output['data'] = $resultMod;
      $output['count'] = count($resultMod);
      break;
    }

    # Durchsucht die CPE Datenbank nach Betriebssystemen
    case 'searchos': {
      $result = $dbcon->searchCPE($search, 'o');
      $resultMod = [];
      foreach($result as $val) {
        array_push($resultMod, ['value' => $val['CPE'], 'label' => $val['Name']]);
      }
      $output['data'] = $resultMod;
      $output['count'] = count($resultMod);
      break;
    }

    # Liest die Nutzergruppen des eingeloggten Nutzers aus
    case 'getusergroups': {
      if(empty($search)) {
        $result = $userGroups;
        $resultMod = [];
        foreach($result as $val) {
          array_push($resultMod, ['value' => $val, 'label' => $val . ': ' . Utils::getGroupName($val)]);
        }
        $output['data'] = $resultMod;
        $output['count'] = count($resultMod);
      }
      else {
        $result = Utils::searchGroups($search);
        $output['data'] = $result;
        $output['count'] = count($result);
      }
      break;
    }

    # Durchsucht die Netzdatenbank nach DNS-Namen oder IP-Adressen
    case 'searchipdns': {
      $result = Utils::searchipdns($search);
      $output['data'] = $result;
      $output['count'] = count($result);
      break;
    }

    # Liest den Aufstellungsort zu einem System aus
    case 'getaufstellungsort': {
      $result = Utils::getAufstellungsort($search);
      $output['data']['aufstellungsort'] = $result;
      $output['count'] = 1;
      break;
    }

    # Gibt einige Statistiken aus
    case 'getstats': {
      if(!$userIsDSB) {
        returnError('Sie haben keine Berechtigung diese Funktion aufzurufen!');
      }

      $output['data'] = $dbcon->getStats();
      $output['count'] = 1;
      break;
    }

    case 'gettoms': {
      if(empty($data) || empty($data['tier'])) {
        $output['data'] = $dbcon->getTOMs();
      }
      else {
        $output['data'] = $dbcon->getTOMs(intval($data['tier']));
      }
      $output['count'] = count($output['data']);
      break;
    }

    case 'getsuggestions': {
      $output['data'] = $dbcon->getSuggestions();
      $output['count'] = count($output['data']);
      break;
    }

    case 'gendraftpdf': {
      if(empty($verfahrensId)) {
        returnError('Keine ID für ein Verfahren wurde übergeben!');
      }

      if(empty($data)) {
        returnError('Kein JSON-kodierter Inhalt zur PDF-Generierung wurde übergeben (title, pdfCode)!');
      }

      if($dbcon->getPermissionLevel($verfahrensId, $userId, $userGroups) === 0 && !$userIsDSB) {
        returnError('Sie haben keine Berechtigung, um auf das Verfahren zuzugreifen!');
      }

      if(generatePDF(htmlspecialchars($data['title'], ENT_QUOTES, 'UTF-8', FALSE), $data['pdfCode'], $verfahrensId, TRUE)) {
        $output['success'] = TRUE;
      }
      else {
        $output['error'] = 'Die PDF-Datei konnte nicht erzeugt werden. Bitte versuchen Sie es später erneut!';
      }
      break;
    }

    case 'gencombinedpdf': {
      if(!$userIsDSB) {
        returnError('Sie haben keine Berechtigung diese Funktion aufzurufen!');
      }

      if(!generateCombinedPDF($dbcon->listVerfahrenDSB('', 1))) {
        returnError('Interner Fehler beim Erstellen der kombinierten PDF-Datei!');
      }

      $filename = $pdf_dir . DIRECTORY_SEPARATOR . 'combined.pdf';
      $fh = fopen($filename, 'r');

      if($fh) {
        $filesize = filesize($filename);
        $pdfContent = file_get_contents($filename);
        $output['count'] = $filesize;
        $output['data']['pdf'] = base64_encode($pdfContent);
        $output['success'] = TRUE;
      }
      else {
        trigger_error('[SecDoc] verwaltung.php -> Kann PDF-Datei nicht öffnen');
        error_log('[SecDoc] verwaltung.php -> Kann PDF-Datei nicht öffnen');
        returnError('Die PDF-Datei zum Verzeichnis von Verarbeitungstätigkeiten existiert nicht.');
      }

      if(!unlink($filename)) error_log("[SecDoc] verwaltung.php -> Konnte kombinierte PDF-Datei '$filename' nicht löschen!");
      break;
    }

    case 'gencompletepdf': {
      if(!$userIsDSB) {
        returnError('Sie haben keine Berechtigung diese Funktion aufzurufen!');
      }

      if(empty($verfahrensId)) {
        returnError('Keine ID für ein Verfahren wurde übergeben!');
      }

      $mainDoc = $dbcon->getVerfahrenInfo($verfahrensId);

      if(empty($mainDoc)) returnError('Dokumentation existiert nicht');

      # Abhängigkeiten rekursiv durchsuchen
      $checkIDs     = [$verfahrensId];
      $doneIDS      = [];
      $dependencies = [];

      while(!empty($checkIDs)) {
        $currID = array_pop($checkIDs);
        array_push($doneIDS, $currID);
        $currDeps = $dbcon->getDependenciesOf($currID, $userId, $userGroups, $userIsDSB);

        if(!empty($currDeps)) {
          $dependencies = array_merge($dependencies, $currDeps);
          foreach($currDeps as $dep) {
            if(!in_array($dep['id'], $doneIDS)) array_push($checkIDs, $dep['id']); # Alle neuen IDs für die Abhängigkeiten-Suche einreihen, falls nicht schon zuvor verarbeitet
          }
        }
      }

      # Abhängigkeiten nach Typ sortieren
      $addedIDs    = [$verfahrensId];
      $procDep     = [];
      $appDep      = [];
      $itDep       = [];
      $measuresDep = [];

      foreach($dependencies as $dep) {
        if(in_array($dep['id'], $addedIDs)) continue;

        switch($dep['type']) {
          case 1:
            array_push($procDep, $dep);
            break;

          case 2:
            array_push($itDep, $dep);
            break;

          case 3:
            array_push($appDep, $dep);
            break;

          case 4:
            array_push($measuresDep, $dep);
            break;
        }

        array_push($addedIDs, $dep['id']);
      }

      if(!generateCompletePDF($mainDoc, $procDep, $appDep, $itDep, $measuresDep)) {
        returnError('Interner Fehler beim Erstellen der kombinierten PDF!');
      }

      $filename = $pdf_dir . DIRECTORY_SEPARATOR . 'complete.pdf';
      $fh = fopen($filename, 'r');

      if($fh) {
        $filesize = filesize($filename);
        $pdfContent = file_get_contents($filename);
        $output['count'] = $filesize;
        $output['data']['pdf'] = base64_encode($pdfContent);
        $output['data']['title'] = $mainDoc['Bezeichnung'];
        $output['data']['type'] = $mainDoc['Typ'];
        $output['success'] = TRUE;
      }
      else {
        trigger_error('[SecDoc] verwaltung.php -> Kann PDF-Datei nicht öffnen');
        error_log('[SecDoc] verwaltung.php -> Kann PDF-Datei nicht öffnen');
        returnError('Die Komplett-PDF existiert nicht.');
      }

      if(!unlink($filename)) error_log("[SecDoc] verwaltung.php -> Konnte komplette PDF '$filename' nicht löschen!");
      break;
    }

    case 'adddocument': {
      if(empty($verfahrensId)) {
        returnError('Keine ID für ein Verfahren wurde übergeben!');
      }
      if(empty($data) || empty($data['filename']) || empty($data['filecontent'])) {
        returnError('Dateiinformationen fehlen!');
      }
      if(!$userIsDSB && $dbcon->getPermissionLevel($verfahrensId, $userId, $userGroups) < 2) {
        returnError('Keine Schreibberechtigung für die gewählte Dokumentation!');
      }

      # Dateityp prüfen
      $finfo = finfo_open();
      if(!in_array(finfo_buffer($finfo, base64_decode($data['filecontent']), FILEINFO_MIME_TYPE), ['application/pdf'])) {
        returnError('Es können nur PDF Dateien hinterlegt werden!');
      }

      global $docmgmtClass;

      $newFileRef = $docmgmtClass->addDocument($verfahrensId, $data['filename'], $data['filecontent']);

      if(empty($newFileRef)) returnError('Konnte Dokument nicht abspeichern!');

      $newDocID = $dbcon->addDocument($verfahrensId, (!empty($data['description']) ? $data['description'] : ''), $newFileRef, strlen(base64_decode($data['filecontent'])), (!empty($data['attach']) ? intval($data['attach']) : 0));

      if($newDocID === -1) returnError('Konnte Document nicht in Datenbank anlegen!');

      $output['success'] = TRUE;
      break;
    }

    case 'updatedocument': {
      if(empty($data) || empty($data['docid'])) {
        returnError('Dokumentinformationen fehlen!');
      }

      $docDetails = $dbcon->getDocumentDetails(intval($data['docid']));

      if(empty($docDetails)) {
        returnError('Zu aktualisierendes Dokument existiert nicht!');
      }

      if(!$userIsDSB && $dbcon->getPermissionLevel($docDetails['ProcessID'], $userId, $userGroups) < 2) {
        returnError('Keine Schreibberechtigung für die gewählte Dokumentation!');
      }

      if(!empty($data['filename']) && !empty($data['filecontent'])) {
        # Dateityp prüfen
        $finfo = finfo_open();
        if(!in_array(finfo_buffer($finfo, base64_decode($data['filecontent']), FILEINFO_MIME_TYPE), ['application/pdf'])) {
          returnError('Es können nur PDF Dateien hinterlegt werden!');
        }

        global $docmgmtClass;

        $newFileRef  = $docmgmtClass->updateDocument($docDetails['ProcessID'], $docDetails['FileRef'], $data['filename'], $data['filecontent']);
        $newFileSize = strlen(base64_decode($data['filecontent']));

        if(empty($newFileRef)) returnError('Konnte Dokument nicht abspeichern!');
      }
      else {
        $newFileRef  = $docDetails['FileRef'];
        $newFileSize = $docDetails['FileSize'];
      }

      if(!array_key_exists('description', $data)) $data['description'] = $docDetails['Description'];

      if(!$dbcon->updateDocument($docDetails['DocID'], !empty($data['description']) ? $data['description'] : '', $newFileRef, $newFileSize, (array_key_exists('attach', $data) && $data['attach'] ? 1 : 0))) returnError('Konnte Document nicht in Datenbank aktualisieren!');

      $output['success'] = TRUE;
      break;
    }

    case 'getdocument': {
      if(empty($data['docid'])) {
        returnError('Dokumenten ID fehlt!');
      }

      $docDetails = $dbcon->getDocumentDetails(intval($data['docid']));

      if(empty($docDetails)) {
        returnError('Angefragtes Dokument existiert nicht!');
      }

      if(!$userIsDSB && $dbcon->getPermissionLevel($docDetails['ProcessID'], $userId, $userGroups) < 1) {
        returnError('Keine Leseberechtigung für das angefragte Dokument!');
      }

      global $docmgmtClass;

      $file = $docmgmtClass->getDocument($docDetails['ProcessID'], $docDetails['FileRef']);

      if(empty($file) || empty($file['fileName']) || empty($file['fileContent'])) returnError('Dokument konnte nicht gelesen werden!');

      $output['success'] = TRUE;
      $output['data']    = $file;
      break;
    }

    case 'deletedocument': {
      if(empty($data['docid'])) {
        returnError('Dokumenten ID fehlt!');
      }

      $docDetails = $dbcon->getDocumentDetails(intval($data['docid']));

      if(empty($docDetails)) {
        returnError('Angefragtes Dokument existiert nicht!');
      }

      if(!$userIsDSB && $dbcon->getPermissionLevel($docDetails['ProcessID'], $userId, $userGroups) < 2) {
        returnError('Keine Schreibberechtigung für das angefragte Dokument!');
      }

      global $docmgmtClass;

      $delSuccess = $docmgmtClass->deleteDocument($docDetails['ProcessID'], $docDetails['FileRef']);

      if(!$delSuccess) returnError('Dokument konnte nicht gelöscht werden!');

      $dbcon->deleteDocument(intval($data['docid']));

      $output['success'] = TRUE;
      break;
    }

    case 'listdocuments': {
      if(empty($verfahrensId)) {
        returnError('Keine ID für ein Verfahren wurde übergeben!');
      }

      if(!$userIsDSB && $dbcon->getPermissionLevel($verfahrensId, $userId, $userGroups) < 1) {
        returnError('Keine Leseberechtigung für die angefragte Dokumentation!');
      }

      $documents = $dbcon->listDocuments($verfahrensId);

      $combinedSize = 0;
      foreach($documents as $doc) {
        if($doc['Attach'] > 0) $combinedSize += $doc['FileSize'];
      }

      $output['success']  = TRUE;
      $output['data']     = $documents;
      $output['sizewarn'] = $combinedSize > $docmgmt_maxAttachSize ? TRUE : FALSE;
      $output['maxsize']  = $docmgmt_maxAttachSize;
      $output['count']    = count($documents);
      break;
    }

    case 'listrevisions': {
      if(empty($verfahrensId)) {
        returnError('Keine ID für ein Verfahren wurde übergeben!');
      }

      if(!$userIsDSB && $dbcon->getPermissionLevel($verfahrensId, $userId, $userGroups) < 1) {
        returnError('Keine Leseberechtigung für die angefragte Dokumentation!');
      }

      $revisions = $dbcon->listRevisions($verfahrensId);

      $output['success']  = TRUE;
      $output['data']     = $revisions;
      $output['count']    = count($revisions);
      break;
    }

    case 'login': {
      $output['data']['msg'] = 'Erfolgreich eingeloggt';
      break;
    }

    case 'logout': {
      $output['error'] = $authClass->logoutUser() ? '' : 'Abmeldung fehlgeschlagen oder nicht verfügbar.';
      break;
    }

    case 'loggedin': {
      $output['success'] = TRUE;
      $output['maintenance'] = $maintenanceMode;
      if($maintenanceMode) $output['maintenanceMessage'] = $maintenanceMessage;
      break;
    }

    # Falls keine bekannte Aktion angegeben wurde
    default: {
      $output['error'] = 'Es wurde kein oder kein unterstützter Modus (list, listdsb, get, create, update, delete, finish, updatecomment, history, dependencies, searchperson, serachabteilung, searchivv, getusergroups, searchapp, searchos, searchipdns, getaufstellungsort, getstats, gettoms, getsuggestions, gencombinedpdf, addDocument, listDocuments, updateDocument, deleteDocument, listRevisions) angegeben!';
      break;
    }
  }

  if(empty($output['error'])) {
    $output['success'] = TRUE;
  }
  else {
    $output['success'] = FALSE;
  }

  # Debugausgaben sammeln und in Ausgabearray schreiben
  if($debug && !empty($userId) && Utils::checkUserGroups($userGroups, $debugGroups)) {
    $output['debug'] = ob_get_contents();
  }
  ob_clean();

  # Ergebnis als JSON zurückgeben
  $output['time'] = microtime(TRUE) - $timer[0][1];
  $result = json_encode($output);
  header('Content-type: application/json; charset=utf-8');
  header('Content-length: ' . strlen($result));
  print($result);
  ob_end_flush();
  exit(0);
?>
