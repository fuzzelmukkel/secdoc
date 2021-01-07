<?php
/**
 * Enthält eine Pseudo-Authentifizierung für die Demo-Version.
 * Nur für Demo-Zwecke! Stellt keine Absicherung des Dienstes bereit!
 *
 * @author Dustin Gawron <dustin.gawron@uni-muenster.de>
 * @copyright (c) 2020-2021 Westfälische Wilhelms-Universität Münster
 * @license AGPL-3.0-or-later <https://www.gnu.org/licenses/agpl.html>
 */

/**
 * Klasse zur Implementierung der Demo-Authentifizierung.
 * Erweitert die Grundklasse {@link Auth}.
 */
class demoAuth extends Auth {
  /**
   * Dummy-Funktion
   *
   * @param string $user Nutzerkennung
   * @param string $pass Nutzerpasswort
   * @return bool FALSE
   */
  public function loginUser($user, $pass) {
    return FALSE;
  }

  /**
   * Dummy-Funktion
   *
   * @return bool FALSE
   */
  public function logoutUser() {
    return FALSE;
  }

  /**
   * Dummy-Funktion
   *
   * @return bool TRUE
   */
  public function checkSession() {
    return TRUE;
  }

  /**
   * Dummy-Funktion
   *
   * @return array String-Array der Nutzergruppen
   */
  public function getUserGroups() {
    return ['demogroup1', 'demogroup2', 'demogroup3'];
  }

  /**
   * Überprüft, ob Nutzer Berechtigung zur Verwendung des Tools besitzt.
   *
   * @global array Nutzergruppen berechtigt zur Verwendung des Tools
   * @return bool TRUE falls der Nutzer zur Verwendung berechtigt ist, sonst FALSE
   */
  public function checkUsePerm() {
    global $userGroups;

    # Check if login exists
    if(!$this->checkSession()) return FALSE;

    if(empty($userGroups)) return TRUE;

    $currentGroups = $this->getUserGroups();

    if(empty($currentGroups)) return FALSE;

    require_once 'Utils.class.php';

    return Utils::checkUserGroups($currentGroups, $userGroups);
  }

  /**
   * Überprüft Admin-Berechtigungen.
   *
   * @global array Nutzergruppen berechtigt zur Verwendung der Admin-Oberfläche
   * @return bool TRUE falls der Nutzer zur Administration berechtigt ist, sonst FALSE
   */
  public function checkAdminPerm() {
    global $adminGroups;

    # Check if login exists
    if(!$this->checkSession()) return FALSE;

    if(empty($adminGroups)) return FALSE;

    $currentGroups = $this->getUserGroups();

    if(empty($currentGroups)) return FALSE;

    require_once 'Utils.class.php';

    return Utils::checkUserGroups($currentGroups, $adminGroups);
  }

  /**
   * Überprüft Datenschutzbeauftragten-Berechtigung.
   *
   * @global array Nutzergruppen berechtigt zur Verwendung der Datenschutzbeauftragten-Oberfläche
   * @return bool TRUE fallse der Nutzer ein Datenschutzbeauftragter ist, sonst FALSE
   */
  public function checkDPOPerm() {
    global $dpoGroups;

    # Check if login exists
    if(!$this->checkSession()) return FALSE;

    if(empty($dpoGroups)) return FALSE;

    $currentGroups = $this->getUserGroups();

    if(empty($currentGroups)) return FALSE;

    require_once 'Utils.class.php';

    return Utils::checkUserGroups($currentGroups, $dpoGroups);
  }

  /**
   * Überprüft Bereichsleiter-Berechtigung.
   *
   * @global array Nutzergruppen von Bereichsleitern
   * @return bool TRUE fallse der Nutzer ein Bereichsleiter ist, sonst FALSE
   */
  public function checkManagerPerm() {
    global $managerGroups;

    # Check if login exists
    if(!$this->checkSession()) return FALSE;

    if(empty($managerGroups)) return FALSE;

    $currentGroups = $this->getUserGroups();

    if(empty($currentGroups)) return FALSE;

    require_once 'Utils.class.php';

    return Utils::checkUserGroups($currentGroups, $managerGroups);
  }

  /**
   * Gibt die Nutzerkennung der eingeloggten Person zurück.
   *
   * @return string Nutzerkennung
   */
  public function getUserID() {
    return 'demouser';
  }
}
?>
