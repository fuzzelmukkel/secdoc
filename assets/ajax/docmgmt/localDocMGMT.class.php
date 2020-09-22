<?php
/**
 * Implementierung einer lokalen Dateiverwaltung.
 *
 * @author Dustin Gawron <dustin.gawron@uni-muenster.de>
 * @copyright (c) 2020 Westfälische Wilhelms-Universität Münster
 * @license AGPL-3.0-or-later <https://www.gnu.org/licenses/agpl.html>
 */

/**
 * Klasse zur Implementierung einer lokalen Dateiverwaltung.
 * Erweitert die Grundklasse {@link DocMGMT}.
 */
class localDocMGMT extends DocMGMT {
  /**
   * Holt den Inhalt eines Dokuments.
   *
   * @abstract
   * @param int    $processID ID der Dokumentation
   * @param string $fileRef   Dateireferenz
   * @return string[] Dateiname und Dateiinhalt (base64 kodiert) (['fileName' => 'test.pdf', 'fileContent' => '...'])
   * @throws Exception
   */
  public function getDocument($processID, $fileRef) {
    global $pdf_dir;

    $filePath = $pdf_dir . DIRECTORY_SEPARATOR . $processID . DIRECTORY_SEPARATOR . $fileRef;

    $returnVal = [
      'fileName' => $fileRef,
      'fileContent' => ''
    ];

    if(file_exists($filePath) && is_readable($filePath)) {
      $returnVal['fileContent'] = base64_encode(file_get_contents($filePath));
    }
    else {
      trigger_error("[SecDoc] localDocMGMT.php -> Datei '$filePath' konnte nicht gelesen werden");
      error_log("[SecDoc] localDocMGMT.php -> Datei '$filePath' konnte nicht gelesen werden");
    }
    return $returnVal;
  }

  /**
   * Fügt ein neues Dokument hinzu.
   *
   * @abstract
   * @param int    $processID   ID der Dokumentation
   * @param string $fileName    Dateiname
   * @param string $fileContent Dateiinhalt (base64 kodiert)
   * @return string Referenz zum Dokument
   * @throws Exception
   */
  public function addDocument($processID, $fileName, $fileContent) {
    global $pdf_dir;

    if(!is_writable($pdf_dir)) throw new Exception("Fehlende Schreibberechtigung in '$pdf_dir'");

    $processDir = $pdf_dir . DIRECTORY_SEPARATOR . $processID;

    if(!file_exists($processDir)) {
      if(!mkdir($processDir)) throw new Exception("Kann Verzeichnis '$processDir' nicht erstellen");
    }

    # Sonderzeichen entschärfen
    $fileName = str_replace('.pdf', '', $fileName);
    $fileName = preg_replace('/[^A-Za-z0-9_\-]/', '_', $fileName);
    $fileName .= '.pdf';

    $filePath = $pdf_dir . DIRECTORY_SEPARATOR . $processID . DIRECTORY_SEPARATOR . $fileName;

    if(file_exists($filePath)) {
      $fileName = time() . '_' . $fileName;
      $filePath = $pdf_dir . DIRECTORY_SEPARATOR . $processID . DIRECTORY_SEPARATOR . $fileName;
    }

    if(file_put_contents($filePath, base64_decode($fileContent)) === FALSE) {
      trigger_error("[SecDoc] localDocMGMT.php -> Datei '$filePath' konnte nicht geschrieben werden");
      error_log("[SecDoc] localDocMGMT.php -> Datei '$filePath' konnte nicht geschrieben werden");
      return '';
    }
    else {
      return $fileName;
    }
  }

  /**
   * Aktualisiert ein Dokument.
   *
   * @abstract
   * @param int    $processID ID der Dokumentation
   * @param string $fileRef   Dateireferenz
   * @param string $fileName  Dateiname
   * @param string $fileContent Dateiinhalt (base64 kodiert)
   * @return bool Neue Referenz zum Dokument
   * @throws Exception
   */
  public function updateDocument($processID, $fileRef, $fileName, $fileContent){
    global $pdf_dir;

    if(!is_writable($pdf_dir)) throw new Exception("Fehlende Schreibberechtigung in '$pdf_dir'");

    # Sonderzeichen entschärfen
    $fileName = str_replace('.pdf', '', $fileName);
    $fileName = preg_replace('/[^A-Za-z0-9_\-]/', '_', $fileName);
    $fileName .= '.pdf';

    $filePathOld = $pdf_dir . DIRECTORY_SEPARATOR . $processID . DIRECTORY_SEPARATOR . $fileRef;
    $filePathNew = $pdf_dir . DIRECTORY_SEPARATOR . $processID . DIRECTORY_SEPARATOR . $fileName;

    if($filePathOld !== $filePathNew && file_exists($filePathNew)) {
      $fileName = time() . $fileName;
      $filePathNew = $pdf_dir . DIRECTORY_SEPARATOR . $processID . DIRECTORY_SEPARATOR . $fileName;
    }

    if(file_put_contents($filePathNew, base64_decode($fileContent)) === FALSE) {
      trigger_error("[SecDoc] localDocMGMT.php -> Datei '$filePathNew' konnte nicht geschrieben werden");
      error_log("[SecDoc] localDocMGMT.php -> Datei '$filePathNew' konnte nicht geschrieben werden");
      return '';
    }
    else {
      if($filePathOld !== $filePathNew) {
        if(!unlink($filePathOld)) {
          trigger_error("[SecDoc] localDocMGMT.php -> Datei '$filePathOld' konnte nicht gelöscht werden");
          error_log("[SecDoc] localDocMGMT.php -> Datei '$filePathOld' konnte nicht gelöscht werden");
        }
      }
      return $fileName;
    }
  }

  /**
   * Löscht ein Dokument.
   *
   * @abstract
   * @param int    $processID ID der Dokumentation
   * @param string $fileRef   Dateireferenz
   * @return bool TRUE bei Erfolg, sonst FALSE
   * @throws Exception
   */
  public function deleteDocument($processID, $fileRef) {
    global $pdf_dir;

    if(!is_writable($pdf_dir)) throw new Exception("Fehlende Schreibberechtigung in '$pdf_dir'");

    $filePath = $pdf_dir . DIRECTORY_SEPARATOR . $processID . DIRECTORY_SEPARATOR . $fileRef;

    if(unlink($filePath)) {
      if(count(glob($pdf_dir . DIRECTORY_SEPARATOR . $processID . DIRECTORY_SEPARATOR . '*')) === 0) {
        if(!rmdir($pdf_dir . DIRECTORY_SEPARATOR . $processID)) {
          trigger_error("[SecDoc] localDocMGMT.php -> Leerer Ordner '" . $pdf_dir . DIRECTORY_SEPARATOR . $processID . "' konnte nicht gelöscht werden");
          error_log("[SecDoc] localDocMGMT.php -> Leerer Ordner '" . $pdf_dir . DIRECTORY_SEPARATOR . $processID . "' konnte nicht gelöscht werden");
        }
      }
      return TRUE;
    }
    else {
      trigger_error("[SecDoc] localDocMGMT.php -> Datei '$filePath' konnte nicht gelöscht werden");
      error_log("[SecDoc] localDocMGMT.php -> Datei '$filePath' konnte nicht gelöscht werden");
      return FALSE;
    }
  }
}
