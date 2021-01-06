<?php
/**
 * Enthält eine abstrakte Implementierung der Klasse zur Dokumentenverwaltung.
 *
 * @author Dustin Gawron <dustin.gawron@uni-muenster.de>
 * @copyright (c) 2020-2021 Westfälische Wilhelms-Universität Münster
 * @license AGPL-3.0-or-later <https://www.gnu.org/licenses/agpl.html>
 */

/**
 * Abstrakte Klasse als Vorlage zur Dokumentenverwaltung.
 *
 * @abstract
 */
abstract class DocMGMT {
  /**
   * Holt den Inhalt eines Dokuments.
   *
   * @abstract
   * @param int    $processID ID der Dokumentation
   * @param string $fileRef   Dateireferenz
   * @return string[] Dateiname und Dateiinhalt (base64 kodiert) (['fileName' => 'test.pdf', 'fileContent' => '...'])
   */
  abstract public function getDocument($processID, $fileRef);

  /**
   * Fügt ein neues Dokument hinzu.
   *
   * @abstract
   * @param int    $processID   ID der Dokumentation
   * @param string $fileName    Dateiname
   * @param string $fileContent Dateiinhalt (base64 kodiert)
   * @return string Referenz zum Dokument
   */
  abstract public function addDocument($processID, $fileName, $fileContent);

  /**
   * Aktualisiert ein Dokument.
   *
   * @abstract
   * @param int    $processID ID der Dokumentation
   * @param string $fileRef   Dateireferenz
   * @param string $fileName  Dateiname
   * @param string $fileContent Dateiinhalt (base64 kodiert)
   * @return bool TRUE bei Erfolg, sonst FALSE
   */
  abstract public function updateDocument($processID, $fileRef, $fileName, $fileContent);

  /**
   * Löscht ein Dokument.
   *
   * @abstract
   * @param int    $processID ID der Dokumentation
   * @param string $fileRef   Dateireferenz
   * @return bool TRUE bei Erfolg, sonst FALSE
   */
  abstract public function deleteDocument($processID, $fileRef);
}
?>
