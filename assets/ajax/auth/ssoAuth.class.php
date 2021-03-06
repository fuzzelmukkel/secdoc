<?php
/**
 * Enthält die Implementierung der SSO-Authentifizierung.
 *
 * @author Dustin Gawron <dustin.gawron@uni-muenster.de>
 * @copyright (c) 2020 Westfälische Wilhelms-Universität Münster
 * @license AGPL-3.0-or-later <https://www.gnu.org/licenses/agpl.html>
 */

/**
 * Klasse zur Implementierung der SSO-Authentifizierung.
 * Erweitert die Grundklasse {@link Auth}.
 */
class ssoAuth extends Auth {

  /** @var string Nutzerkennung */
  protected $userID     = '';
  /** @var array Nutzergruppen */
  protected $userGroups = [];

  /**
   * Konstruktor, den SSO Login ausliest.
   */
  function __construct() {
    if(isset($_SERVER['HTTP_X_TRUSTED_REMOTE_USER']) && is_string($_SERVER['HTTP_X_TRUSTED_REMOTE_USER'])) { $this->userID = $_SERVER['HTTP_X_TRUSTED_REMOTE_USER']; } # WWU eigener Header
    elseif(isset($_SERVER['REDIRECT_REMOTE_USER']) && is_string($_SERVER['REDIRECT_REMOTE_USER']))         { $this->userID = $_SERVER['REDIRECT_REMOTE_USER']; }       # WWU eigener Header
    elseif(isset($_SERVER['REMOTE_USER']) && is_string($_SERVER['REMOTE_USER']))                           { $this->userID = $_SERVER['REMOTE_USER']; }
  }

  /**
   * Dummy-Funktion; Überprüfung der Zugangsdaten erfolgt extern.
   *
   * @param string $user Nutzerkennung
   * @param string $pass Nutzerpasswort
   * @return bool TRUE bei erfolgreicher Anmeldung, sonst FALSE
   */
  public function loginUser($user, $pass) {
    return FALSE;
  }

  /**
   * Dummy-Funktion; Logout erfolgt extern.
   *
   * @return bool TRUE bei erfolgreicher Abmeldung, sonst FALSE
   */
  public function logoutUser() {
    return FALSE;
  }

  /**
   * Überprüft, ob der Nutzer eine aktive Sitzung besitzt.
   *
   * @return bool TRUE falls der Nutzer eingeloggt ist, sonst FALSE
   */
  public function checkSession() {
    $validSession = FALSE;

    if(!empty($this->userID)) $validSession = TRUE;

    return $validSession;
  }

  /**
   * Gibt die Nutzergruppen der eingeloggten Person zurück.
   *
   * @return array String-Array der Nutzergruppen
   */
  public function getUserGroups() {
    # Check if login exists
    if(!$this->checkSession()) return [];

    if(empty($this->userGroups)) {
      require_once 'Utils.class.php';

      $this->userGroups = Utils::getUserGroups($this->userID);
    }

    if(is_array($this->userGroups)) {
      return $this->userGroups;
    }

    return [];
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

    if(empty($adminGroups)) return FALE;

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
    return $this->userID;
  }
}
?>
