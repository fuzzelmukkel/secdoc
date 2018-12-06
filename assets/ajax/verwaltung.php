<?php
  /**
   * verwaltung.php - REST-API zur Speicherung und Bearbeitung von Verfahren und Bereitstellung von Ausfüllhinweisen
   *
   * Die Schnittstelle stellt verschiedene Funktionen bereit, die über einfache HTTP-Anfragen genutzt werden können.
   * Die Anfragen können als GET- oder POST-Requests gestellt werden und müssen auf jeden Fall den Paramter `action`
   * enthalten, der die gewünschte Funktion repräsentiert. Für einige Aufrufe sind weitere Parameter notwendig.
   * Beispiel: `verwaltung.php?action=get&id=13`
   *
   * @author Thorsten Küfer <thorsten.kuefer@uni-muenster.de>
   * @author Dustin Gawron <dustin.gawron@uni-muenster.de>
   * @author Marius Timmer <marius.timmer@uni-muenster.de>
   * @copyright (c) 2018 Westfälische Wilhelms-Universität Münster
   * @license AGPL-3.0-or-later <https://www.gnu.org/licenses/agpl.html>
   *
   */

  # Ausgabe-Puffer einschalten
  ob_start();

  # Benötigte Dateien einbinden
  require_once('config.inc.php');

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
    echo '<br><b>Fatal error</b>:  Exception \'' . get_class($exception) . '\' with message ';
    echo $exception->getMessage() . '<br>';
    echo 'Stack trace:<pre>' . $exception->getTraceAsString() . '</pre>';
    echo 'thrown in <b>' . $exception->getFile() . '</b> on line <b>' . $exception->getLine() . '</b><br>';

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
              gettext('Das Verfahren <strong>%s</strong> verarbeitet zum Zweck <strong>%s</strong> die folgenden personenbezogenen Daten.'),
              $verfahrensbezeichnung,
              $verfahrenszweck
          ) .'</p>';
      $output .= sprintf(
          '<table><thead><tr><th>%s</th><th>%s</th><th>%s</th><th>%s</th><th>%s</th></tr></thead><tbody>',
          gettext("Kategorie"),
          gettext("Betroffene"),
          gettext("Herkunft"),
          gettext("Rechtsgrundlage"),
          gettext("Löschfrist")
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
                            if (!isset($verfahrensdaten['daten_grundlagen_bezeichnung'][$grundlageID])) {
                                /**
                                 * Der gewaehlte Rechtstext (oder viel mehr die ID)
                                 * konnte nicht ausgelesen werden. Um Fehler zu
                                 * vermeiden ueberspringen wir diesen Durchlauf
                                 * einfach.
                                 */
                                continue;
                            }
                            $rechtstextID = $verfahrensdaten['daten_grundlagen_bezeichnung'][$grundlageID];
                            $rechtstext = '';
                            $rechtsdaten = $dbcon->getRechtsgrundlagen($rechtstextID);
                            if ((is_array($rechtsdaten)) &&
                                (count($rechtsdaten) > 0)) {
                                $rechtstext = $rechtsdaten[0]['Beschreibung'];
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
   * @return boolean True bei Erfolg sonst false
   */
  function generatePDF(string $title, string $html, int $verfahrensId): bool {

    require_once '../vendor/autoload.php';

    global $dbcon, $userId, $pdf_dir, $prog_name, $prog_version;
    $res = $dbcon->searchPerson($userId);
    $author = $res[0]['Name'];

    # MPDF initialisieren
    $mpdf = new \Mpdf\Mpdf(['debug' => false, 'CSSselectMedia' => 'screen', 'mode' => 'utf-8', 'format' => 'A4']);
    $mpdf->SetTitle('Verfahrensdokumentation - ' . $title);
    $mpdf->SetAuthor($author);
    $mpdf->SetCreator($prog_name . ' v' . $prog_version);

    # Wasserzeichen setzen?
    #$mpdf->SetWatermarkText('DRAFT');
    #$mpdf->showWatermarkText = false;
    if(stripos($prog_name, 'test') !== FALSE || stripos($prog_name, 'demo') !== FALSE) {
      $mpdf->SetWatermarkText('TEST');
      $mpdf->showWatermarkText = TRUE;
    }

    # PDF mit Passwort sichern? (https://mpdf.github.io/reference/mpdf-functions/setprotection.html)
    #$mpdf->SetProtection(array(), 'UserPassword', 'MyPassword');

    # Style-Dateien laden
    $style = file_get_contents('../css/bootstrap.min.css');
    $mpdf->WriteHTML($style,1);
    $style = file_get_contents('../css/custom.css');
    $mpdf->WriteHTML($style,1);

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
            <img src="../img/logo2.png" alt="ZIV logo" title="Zentrum für Informationsverarbeitung" width="180">
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
    $mpdf->WriteHTML($finalHTML,2);

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

    $filename = $pdf_dir . DIRECTORY_SEPARATOR . $verfahrensId . '.pdf';
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
   * @author Thorsten Küfer <thorsten.kuefer@uni-muenster.de>
   *
   * @global string $pdf_dir Verzeichnis für die PDF-Speicherung
   * @param DBCon  $dbcon        Datenbank-Verbindung als PDO Objekt
   * @param string $userId       Nutzerkennung
   * @param array  $userGroups   Nutzergruppen
   * @param bool   $userIsDSB    DSB-Berechtigung
   * @param int    $verfahrensId ID des zu exportierenden Verfahrensverzeichnisses
   * @return boolean True bei Erfolg sonst false
   */
  function generateEmail(DBCon $dbcon, string $userId, array $userGroups, bool $userIsDSB, int $verfahrensId): bool
  {
    global $pdf_dir;

    // Daten auslesen
    $data = $dbcon->getVerfahren($verfahrensId, $userId, $userGroups, $userIsDSB);
    if (($data === false) || (empty($data)) || (empty($data[0]['JSON']))) {
      /**
       * Beim Auslesen der Daten ist ein Fehler aufgetreten.
       * Daher muss an dieser Stelle abgebrochen werden.
       */
      trigger_error('[SecDoc] verwaltung.php -> Kann keine Verfahrensdaten auslesen!');
      error_log('[SecDoc] verwaltung.php -> Kann keine Verfahrensdaten auslesen!');
      return false;
    }

    // Infos für E-Mail zusammenstellen
    $anrede = "Sehr geehrte Damen und Herren";
    $subject = "[SecDoc] Neues Verfahren angelegt: «{$data[0]['Bezeichnung']}»";
    $empfaenger = array_unique(
      array(
        $data[0]['Ersteller'],
        $data[0]['FachKontakt'],
        $data[0]['TechKontakt']
      )
    );
    $empfaenger = array_filter($empfaenger); // leere ELemente ausfiltern
    $bcc = '';
    //$bcc = get_email_from_nid('unidsb'); /* TODO: Kopie an Datenschutzbeauftragte? */

    // HTML-Entities dekodieren
    $data[0]['Beschreibung'] = htmlspecialchars_decode($data[0]['Beschreibung']);

    $text = <<<EOT
Sie erhalten diese E-Mail, da im Verfahrensdokumentationssystem der WWU (SecDoc) das Verfahren «{$data[0]['Bezeichnung']}» abgeschlossen wurde und Sie als Kontaktperson eingetragen sind.

Beschreibung:
{$data[0]['Beschreibung']}

Die gesamte Verfahrensdokumentation ist als PDF-Datei angehängt.

EOT;
    $text = strip_tags($text);   # HTML- und evtl. Links entfernen => kein bösartiger Code in signierter E-Mail!

    $text .= <<<EOT

Es wurde ein Include-Baustein zur Verwendung in Webseiten bzw. Webanwendungen als Ergänzung zur zentralen Datenschutzerklärung erstellt. Sie können den passenden Text im Webserverpark mit Hilfe von SSI per <!--#include virtual="/sys/secdoc/$verfahrensId.txt" --> bzw. PHP per readfile("/www/data/sys/includes/secdoc/$verfahrensId.txt") einbinden.
EOT;

    # Anhang für imap_handle_attachments() vorbereiten
    $temp_filename = $pdf_dir . DIRECTORY_SEPARATOR . $verfahrensId . '.pdf';
    $last_update = date('YmdHi', strtotime($data[0]['Aktualisierung']));
    if (!is_readable($temp_filename)) {
      /**
       * Die PDF Datei kann nicht von der erwarteten Stelle aus gelesen werden.
       * Entweder liegt sie dort nicht, oder die Berechtigungen stimmen nicht.
       */
      trigger_error(
        sprintf(
          '[SecDoc] verwaltung.php -> PDF-Datei "%s" nicht gefunden/lesbar',
          $temp_filename
        )
      );
      error_log(sprintf('[SecDoc] verwaltung.php -> PDF-Datei "%s" nicht gefunden/lesbar', $temp_filename));
      return false;
    }
    $attachment = array(
      'name'     => "Verfahrensdokumentation_{$verfahrensId}_{$last_update}.pdf",
      'tmp_name' => $temp_filename,
      'size'     => filesize($temp_filename),
      'type'     => 'application/pdf',
      'nodelete' => 1,
      'error'    => 0
    );

    $signatur = <<<EOT
Mit freundlichen Grüßen
Ihr ZIV

-- 
Westfälische Wilhelms-Universität Münster (WWU)
Zentrum für Informationsverarbeitung (ZIV)
Röntgenstr. 7-13
48149 Münster
Tel.: +49 251 83 31600
E-Mail: secdoc@uni-muenster.de
Web: https://www.uni-muenster.de/ZIV.CERT/secdoc
EOT;

    $ret = true;
    foreach ($empfaenger as $to)
    {
      $anrede = Utils::getUserAnrede($to);
      $to = Utils::getUserEmail($to);
      $cc = '';

      $body = <<<EOT
$anrede,

$text

$signatur
EOT;

      # Falls Nutzer kein E-Mail-Postfach hat (sollte nicht vorkommen)
      if (empty($to)) {
        continue;
      }
      $mailstatus = Utils::imapSendMimeMail(
        $to,
        $cc,
        $bcc,
        # TODO Reply-To an $userId
        $subject,
        $body,
        array(
          $attachment
        )
      );
      if (!$mailstatus) {
        $ret = false;
      }
    }
    return $ret;
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
  $dbcon = new DBCon($db_dir);
  $output['version'] = $prog_name . ' ' . $prog_version;
  $reqMethod = is_string($_SERVER['REQUEST_METHOD']) ? $_SERVER['REQUEST_METHOD'] : '';
  $action = '';
  $verfahrensId = NULL;
  $data = NULL;
  $userId = NULL;
  $userGroups = [];
  $userIsDSB = FALSE;
  $fachabteilung = '-- keine --';
  $ivv = '-- keine --';
  $search = '';

  # Nutzerkennung des aktuellen Nutzers holen
  $userId = Utils::getCurrentUserId();

  # Überprüfen, ob die Nutzerkennung gefunden wurde
  if(empty($userId)) {
    returnError('Es konnte keine Nutzerkennung über das SSO-System erlangt werden! Eventuell sind Sie nicht über SSO eingeloggt.');
  }

  # Nutzergruppen holen
  $userGroups = Utils::getUserGroups($userId);

  # Prüfen, ob der Nutzer ein DSB ist
  $userIsDSB = in_array($userId, $dsbIDs);

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

  if(!$dbcon->isConnected()) {
    returnError('Es konnte keine DB-Verbindung hergestellt werden! Versuchen Sie es später erneut.');
  }

  switch($action) {
    # Liest alle Verfahren aus, auf die $userId Zugriff hat
    case 'list': {
      $list = $dbcon->listVerfahrenOwn($userId, $userGroups);
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

    # Durchsucht die für den aktuellen Nutzer einsehbaren Verfahren
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
        array_push($result, array('value' => $entry['ID'], 'label' => $entry['Bezeichnung'] . " [" . $entry['Fachabteilung'] . "]"));
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
        'allgemein_bezeichnung',
        'allgemein_beschreibung',
        'allgemein_abteilung',
        'allgemein_ivv',
        'allgemein_fachlich_kennung',
        'allgemein_technisch_kennung'
      );
      foreach($reqVars as $reqVar) {
        if(!isset($data[$reqVar])) {
          returnError('Ein oder mehrere notwendige Parameter fehlen - Aktuell: ' . $reqVar);
        }
      }

      # HTML Symbole ersetzen
      $data = Utils::encodeHTMLArray($data);

      $id = $dbcon->addVerfahren($userId, $newId, $data['allgemein_bezeichnung'], $data['allgemein_datum'], $data['allgemein_beschreibung'], $data['allgemein_abteilung'], $data['allgemein_ivv'], $data['allgemein_fachlich_kennung'], $data['allgemein_technisch_kennung'], $data['meta_bearbeiter_gruppe'], json_encode($data));

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
        'allgemein_bezeichnung',
        'allgemein_beschreibung',
        'allgemein_abteilung',
        'allgemein_ivv',
        'allgemein_fachlich_kennung',
        'allgemein_technisch_kennung',
        'meta_lastupdate',
        'meta_bearbeiter_gruppe'
      );
      foreach($reqVars as $reqVar) {
        if(!isset($data[$reqVar])) {
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

      $success = $dbcon->updateVerfahren($verfahrensId, $userId, $userGroups, $data['allgemein_bezeichnung'], $data['allgemein_datum'], $data['allgemein_beschreibung'], $data['allgemein_abteilung'], $data['allgemein_ivv'], $data['allgemein_fachlich_kennung'], $data['allgemein_technisch_kennung'], isset($data['meta_sichtbarkeit']) ? $data['meta_sichtbarkeit'] : 0, $data['meta_bearbeiter_gruppe'], json_encode($data), $userIsDSB);

      if($success && $dbcon->getStatus($verfahrensId, $userId, $userGroups, $userIsDSB) === 2) {
        /**
         * Sobald das Verfahrensverzeichnis aktualisiert wurde, muss auch der
         * Textschnipsel dementsprechend angepasst werden. Dabei ist es nicht
         * schlimm, dass das Verfahrensverzeichnis noch gar nicht fertig
         * gestellt wurde.
         */
        $output['gentxt'] = generateTXT($dbcon, $userId, $userGroups, $userIsDSB, $verfahrensId);
      }

      if($success === FALSE) {
        returnError('Kein Verfahren wurde aktualisiert, da entweder das Verfahren nicht gefunden wurde oder Sie keine Berechtigung haben!');
      }

      $output['data'] = ['Date' => date("Y-m-d H:i:s")];
      $output['success'] = TRUE;
      break;
    }

    # Aktualisiert nur den Status eines Verfahrens
    case 'updatestatus': {
      if(empty($verfahrensId)) {
        returnError('Keine ID für ein Verfahren wurde übergeben!');
      }

      if(empty($data) || !isset($data['status'])) {
        returnError('Keine JSON-kodierter Inhalt zum Statusupdate wurde übergeben (Fehlt: status)!');
      }

      $statusOld = $dbcon->getStatus($verfahrensId, $userId, $userGroups, $userIsDSB);

      if($statusOld === intval($data['status'])) {
        $output['changed'] = FALSE;
      }
      else {
        $success = $dbcon->updateStatus($verfahrensId, $userId, $userGroups, $data['status'], $userIsDSB);

        if($success === FALSE) {
          returnError('Kein Verfahren wurde aktualisiert, da entweder das Verfahren nicht gefunden wurde oder Sie keine Berechtigung haben!');
        }
        $output['changed'] = TRUE;
      }
      break;
    }

    # Schließt das Verfahren ab
    case 'finish': {
      if(empty($verfahrensId)) {
        returnError('Keine ID für ein Verfahren wurde übergeben!');
      }

      if(empty($data)) {
        returnError('Keine JSON-kodierter Inhalt zum Abschluss wurde übergeben (title, status, pdfCode)!');
      }

      // Überprüfen, ob das Verfahren nicht durch eine andere Person seit dem letzten Laden bearbeitet wurde
      $lastUpdate = $dbcon->getHistorie($verfahrensId);
      if($lastUpdate && isset($lastUpdate[0]['Datum']) && (strtotime($lastUpdate[0]['Datum']) - 1) > strtotime($data['lastupdate'])) {
        returnError('Das Verfahren wurde seit der letzten Synchronisation bearbeitet (Nutzer: ' . ($lastUpdate[0]['Anzeigename'] ?: ($lastUpdate[0]['Name'] ?: 'Unbekannt' ) . ' (' . $lastUpdate[0]['Kennung'] . ')') . ' - Datum: ' . $lastUpdate[0]['Datum'] . ')! Bitte laden Sie die Seite neu für eine aktuelle Version des Verfahrens!');
        break;
      }

      $success = $dbcon->updateStatus($verfahrensId, $userId, $userGroups, $data['status'], $userIsDSB);

      if($success === 0) {
        returnError('Kein Verfahren wurde aktualisiert, da entweder das Verfahren nicht gefunden wurde oder Sie keine Berechtigung haben!');
      }

      if(intval($data['status']) === 2 && $success) {
        $output['gentxt'] = generateTXT($dbcon, $userId, $userGroups, $userIsDSB, $verfahrensId);
        $output['genpdf'] = generatePDF($data['title'], $data['pdfCode'], $verfahrensId);
        $output['genmail'] = FALSE;
        if ($output['genpdf']) {
          $output['genmail'] = generateEmail($dbcon, $userId, $userGroups, $userIsDSB, $verfahrensId);
        }
      }

      $output['success'] = TRUE;
      break;
    }

    # Löscht ein Verfahren
    case 'delete': {
      if(empty($verfahrensId)) {
        returnError('Keine ID für ein Verfahren wurde übergeben!');
      }

      $success = $dbcon->delVerfahren($verfahrensId, $userId, $userGroups);

      if($success) {
        if(!unlink($includes_dir . DIRECTORY_SEPARATOR . $verfahrensId . '.txt')) {
          error_log('[SecDoc] verwaltung.php -> Konnte Include-Textbaustein zur ID "' . $verfahrensId . '" nicht löschen!');
        }

        if(!unlink($pdf_dir . DIRECTORY_SEPARATOR . $verfahrensId . '.pdf')) {
          error_log('[SecDoc] verwaltung.php -> Konnte PDF zur ID "' . $verfahrensId . '" nicht löschen!');
        }
      }

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

    # Gibt die zuletzt erstellte PDF eines Verfahrens zurück
    case 'getpdf': {
      if(empty($verfahrensId)) {
        returnError('Keine ID für ein Verfahren oder kein Inhalt wurde übergeben!');
      }

      $details = $dbcon->getVerfahren($verfahrensId, $userId, $userGroups, $userIsDSB);

      if(empty($details)) {
        returnError('Das Verfahren existiert nicht oder Sie haben keine Berechtigung darauf zuzugreifen!');
      }

      $filename = $pdf_dir . DIRECTORY_SEPARATOR . $verfahrensId . '.pdf';
      $fh = fopen($filename, 'r');

      if($fh) {
        $filesize = filesize($filename);
        $pdfContent = file_get_contents($filename);
        $output['count'] = $filesize;
        $output['data']['status'] = intval($details[0]['Status']);
        $output['data']['lastupdate'] = $details[0]['Aktualisierung'];
        $output['data']['pdf'] = base64_encode($pdfContent);
        $output['success'] = TRUE;
      }
      else {
        trigger_error('[SecDoc] verwaltung.php -> Kann PDF-Datei nicht öffnen');
        error_log('[SecDoc] verwaltung.php -> Kann PDF-Datei nicht öffnen');
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

    # Gibt die Rechtsgrundlagen zurück
    case 'getlaws': {
      $result = $dbcon->getRechtsgrundlagen();

      $output['count'] = count($result);
      $output['data'] = $result;
      $output['success'] = TRUE;
      break;
    }

    # Personensuche nach Name und Kennung
    case 'searchperson': {
      if(empty($search)) {
        $search = $userId;
      }
      $result = $dbcon->searchPerson($search);
      $resultMod = [];
      foreach($result as $val) {
        array_push($resultMod, ['value' => $val['Kennung'], 'label' => $val['Name'], 'name' => $val['Name']]);
      }
      if($search == $userId) {
        $resultMod[0]['userIsDSB'] = $userIsDSB;
      }
      $output['data'] = $resultMod;
      $output['count'] = count($resultMod);
      break;
    }

    # Mitarbeitersuche nach Name und Kennung
    case 'searchmitarbeiter': {
      if(empty($search)) {
        $search = $userId;
      }
      $result = $dbcon->searchPerson($search, TRUE);
      $resultMod = [];
      foreach($result as $val) {
        array_push($resultMod, ['value' => $val['Kennung'], 'label' => $val['Anzeigename'] , 'name' => $val['Name']]);
      }
      $output['data'] = $resultMod;
      $output['count'] = count($resultMod);
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
      $result = $userGroups;
      $resultMod = [];
      foreach($result as $val) {
        array_push($resultMod, ['value' => $val, 'label' => $val . ': ' . Utils::getGroupName($val)]);
      }
      $output['data'] = $resultMod;
      $output['count'] = count($resultMod);
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

    case 'getstats': {
      if(!$userIsDSB) {
        returnError('Sie haben keine Berechtigung diese Funktion aufzurufen!');
      }

      $output['data'] = $dbcon->getStats();
      $output['count'] = 1;
      break;
    }

    # Falls keine bekannte Aktion angegeben wurde
    default: {
      $output['error'] = 'Es wurde kein oder kein unterstützter Modus (list, listdsb, get, create, update, updatestatus, delete, finish, updatecomment, history, laws, searchperson, serachabteilung, searchivv, getusergroups, searchapp, searchos, searchipdns, getaufstellungsort, getstats) angegeben!';
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
