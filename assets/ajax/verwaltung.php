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
    return true;
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

    global $dbcon, $userId, $pdf_dir, $prog_name, $prog_version;
    $res = $dbcon->searchPerson($userId);
    $author = $res[0]['Name'];

    # MPDF initialisieren
    $mpdf = new \Mpdf\Mpdf(['debug' => false, 'CSSselectMedia' => 'screen', 'mode' => 'utf-8', 'format' => 'A4']);
    $mpdf->SetTitle('Verfahrensdokumentation - ' . $title . ($isDraft ? ' (ENTWURF)' : ''));
    $mpdf->SetAuthor($author);
    $mpdf->SetCreator($prog_name . ' v' . $prog_version);

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
   * Generiert eine kombinierte PDF mit allen PDFs von abgeschlossenen Verfahren.
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
    $mpdf->SetTitle('Verzeichnis der Verarbeitungstätigkeiten');
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
    ]);

    $procCount = count($processes);

    # Nach ID sortieren? Oder eher nach Name, Erstelldatum oder Aktualisierungsdatum?
    usort($processes, function($a, $b) { return (intval($a['ID']) - intval($b['ID'])); });

    for($p = 0; $p < $procCount; $p++) {
      $filePath = $pdf_dir . DIRECTORY_SEPARATOR . $processes[$p]['ID'] . '.pdf';

      if(file_exists($filePath)) {
        $mpdf->setFooter(htmlspecialchars("#{$processes[$p]['ID']}|{$processes[$p]['Bezeichnung']}") . '|{PAGENO}');
        $mpdf->TOC_Entry(htmlspecialchars("#{$processes[$p]['ID']} - {$processes[$p]['Bezeichnung']}"));

        $pageCount = $mpdf->SetSourceFile($filePath);

        for($c = 1; $c <= $pageCount; $c++) {
          $mpdf->UseTemplate($mpdf->ImportPage($c));
          if($p !== ($procCount - 1)) $mpdf->WriteHTML('<pagebreak />');
          if($p === ($procCount - 1) && $c !== $pageCount) $mpdf->WriteHTML('<pagebreak />');
        }
      }
      # Fehlende PDF, obwohl als "abgeschlossen" gekennzeichnet
      elseif(intval($processes[$p]['Status']) === 2) {
        $mpdf->setFooter(htmlspecialchars("#{$processes[$p]['ID']}|{$processes[$p]['Bezeichnung']}") . '|{PAGENO}');
        $mpdf->TOC_Entry(htmlspecialchars("#{$processes[$p]['ID']} - {$processes[$p]['Bezeichnung']}"));

        $mpdf->WriteHTML("<h2>PDF für Verarbeitungstätigkeit #{$processes[$p]['ID']} - '" . htmlspecialchars("{$processes[$p]['Bezeichnung']}") . "' fehlt</h2><p>Die Verarbeitungstätigkeit #{$processes[$p]['ID']} ist als abgeschlossen markiert, aber es ist keine PDF vorhanden!</p><p>Bitte schließen Sie die Verarbeitungstätigkeit neu ab, um eine korrekte PDF-Version zu erzeugen.</p><pagebreak />");
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
    return true;
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
      $list = array_merge($list, $dbcon->listVerfahrenShared($userId, $userGroups));
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
        'allgemein_typ',
        'allgemein_bezeichnung',
        'allgemein_abteilung',
      );
      foreach($reqVars as $reqVar) {
        if(!isset($data[$reqVar]) || empty($data[$reqVar])) {
          returnError('Ein oder mehrere notwendige Parameter fehlen - Aktuell: ' . $reqVar);
        }
      }

      # HTML Symbole ersetzen
      $data = Utils::encodeHTMLArray($data);

      # Verfahren erstellen
      $id = $dbcon->addVerfahren($userId, $newId, intval($data['allgemein_typ']), $data['allgemein_bezeichnung'], $data['allgemein_datum'], $data['allgemein_beschreibung'], intval($data['massnahmen_risiko']), $data['allgemein_abteilung'], $data['allgemein_ivv'], $data['allgemein_fachlich_kennung'], $data['allgemein_technisch_kennung'], json_encode($data));

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
      $success = $dbcon->updateVerfahren($verfahrensId, $userId, $userGroups, intval($data['allgemein_typ']), $data['allgemein_bezeichnung'], $data['allgemein_datum'], $data['allgemein_beschreibung'], intval($data['massnahmen_risiko']), $data['allgemein_abteilung'], $data['allgemein_ivv'], $data['allgemein_fachlich_kennung'], $data['allgemein_technisch_kennung'], isset($data['meta_sichtbarkeit']) ? $data['meta_sichtbarkeit'] : 0, json_encode($data), $userIsDSB);

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

      if(empty($data)) {
        returnError('Kein JSON-kodierter Inhalt zum Abschluss wurde übergeben (title, pdfCode)!');
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

    # Löscht ein Verfahren
    case 'delete': {
      if(empty($verfahrensId)) {
        returnError('Keine ID für ein Verfahren wurde übergeben!');
      }

      $dependencies = $dbcon->getDependencies($verfahrensId, $userId, $userGroups, $userIsDSB);

      if(is_array($dependencies) && count($dependencies) > 0) {
        returnError('Kein Verfahren wurde gelöscht, da das Verfahren noch als Abhängigkeit für andere Verfahren eingetragen ist!');
      }

      $success = $dbcon->delVerfahren($verfahrensId, $userId, $userGroups, $userIsDSB);

      if($success) {
        if(!unlink($includes_dir . DIRECTORY_SEPARATOR . $verfahrensId . '.txt')) {
          error_log('[SecDoc] verwaltung.php -> Konnte Include-Textbaustein zur ID "' . $verfahrensId . '" nicht löschen!');
        }

        if(!unlink($pdf_dir . DIRECTORY_SEPARATOR . $verfahrensId . '.pdf')) {
          error_log('[SecDoc] verwaltung.php -> Konnte PDF zur ID "' . $verfahrensId . '" nicht löschen!');
        }

        if(!unlink($pdf_dir . DIRECTORY_SEPARATOR . $verfahrensId . '_DRAFT.pdf')) {
          error_log('[SecDoc] verwaltung.php -> Konnte Vorschau-PDF zur ID "' . $verfahrensId . '" nicht löschen!');
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
        $result[0]['userIsDSB'] = $userIsDSB;
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
      $result = Utils::searchUsers($search);
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
      $output['data'] = $dbcon->getTOMs();
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

      $output['success'] = generatePDF(htmlspecialchars($data['title'], ENT_QUOTES, 'UTF-8', FALSE), $data['pdfCode'], $verfahrensId, TRUE);
      break;
    }

    case 'gencombinedpdf': {
      if(!$userIsDSB) {
        returnError('Sie haben keine Berechtigung diese Funktion aufzurufen!');
      }

      if(!generateCombinedPDF($dbcon->listVerfahrenDSB())) {
        returnError('Interner Fehler beim Erstellen der kombinierten PDF!');
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
        returnError('Die PDF zum Verzeichnis von Verarbeitungstätigkeiten existiert nicht.');
      }

      if(!unlink($filename)) error_log("[SecDoc] verwaltung.php -> Konnte kombinierte PDF '$filename' nicht löschen!");
      break;
    }

    # Falls keine bekannte Aktion angegeben wurde
    default: {
      $output['error'] = 'Es wurde kein oder kein unterstützter Modus (list, listdsb, get, create, update, delete, finish, updatecomment, history, dependencies, searchperson, serachabteilung, searchivv, getusergroups, searchapp, searchos, searchipdns, getaufstellungsort, getstats, gettoms, getsuggestions, gencombinedpdf) angegeben!';
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
