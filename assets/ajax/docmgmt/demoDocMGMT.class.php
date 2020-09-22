<?php
/**
 * Implementierung einer Demo-Dateiverwaltung (ohne tatsächliche Speicherung der Dateien).
 *
 * @author Dustin Gawron <dustin.gawron@uni-muenster.de>
 * @copyright (c) 2020 Westfälische Wilhelms-Universität Münster
 * @license AGPL-3.0-or-later <https://www.gnu.org/licenses/agpl.html>
 */

/**
 * Klasse zur Implementierung einer Demo-Dateiverwaltung (ohne tatsächliche Speicherung der Dateien).
 * Erweitert die Grundklasse {@link DocMGMT}.
 */
class demoDocMGMT extends DocMGMT {
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
    $returnVal = [
      'fileName' => $fileRef,
      'fileContent' => ''
    ];

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
    return $fileName;
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
    return $fileName;
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
    return TRUE;
  }
}
