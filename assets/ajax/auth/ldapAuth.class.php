<?php
/**
 * Enthält die Implementierung der LDAP-Authentifizierung.
 *
 * @author Dustin Gawron <dustin.gawron@uni-muenster.de>
 * @copyright (c) 2020 Westfälische Wilhelms-Universität Münster
 * @license AGPL-3.0-or-later <https://www.gnu.org/licenses/agpl.html>
 */

/**
 * Klasse zur Implementierung der LDAP-Authentifizierung.
 * Erweitert die Grundklasse {@link Auth}.
 */
class ldapAuth extends Auth {

  /**
   * Konstruktor, der eien PHP Session initiiert.
   *
   * @global string Pfad zur Session-Speicherung
   * @global string Anwendungsname für Session-Bezeichnung
   * @global string LDAP Auth Konfigurationen
   */
  function __construct() {
    global $sessions_dir, $prog_name, $auth_ldap_config;

    # Start session
    session_start([
      'save_path' => $sessions_dir,
      'name' => preg_replace('/\s+/', '_', $prog_name) . "_session",
      'cookie_lifetime' => $auth_ldap_config['cookie_lifetime'],
      'cookie_secure' => $auth_ldap_config['cookie_secure'],
      'cookie_httponly' => TRUE,
      'cookie_samesite' => 'Strict',
      'use_strict_mode' => TRUE
    ]);

    # Set default values if no session exists
    if(!isset($_SESSION['login'])) {
      $_SESSION['login'] = FALSE;
      $_SESSION['user'] = '';
      $_SESSION['groups'] = NULL;
      $_SESSION['userAgent'] = '';
      $_SESSION['expires'] = time() + $auth_ldap_config['cookie_lifetime'];
    }
  }

  /**
   * Überprüft die Zugangsdaten eines Nutzers im LDAP und erstellt eine neue Session.
   *
   * @global string LDAP Auth Konfiguration
   * @param string $user Nutzerkennung
   * @param string $pass Nutzerpasswort
   * @return bool TRUE bei erfolgreicher Anmeldung, sonst FALSE
   */
  public function loginUser($user, $pass) {
    global $auth_ldap_config;
    if(empty($user) || empty($pass)) return FALSE;

    # Connect to LDAP
    $ldap_handle = @ldap_connect($auth_ldap_config['host'], $auth_ldap_config['port']);

    if(!$ldap_handle) {
      trigger_error('[SecDoc] ldapAuth.class.php -> ldap_connect() Fehler: ' . ldap_error());
      error_log('[SecDoc] ldapAuth.class.php ->ldap_connect() Fehler: ' . ldap_error());
      return FALSE;
    }

    $ldapOptSuccess = @ldap_set_option($ldap_handle, LDAP_OPT_PROTOCOL_VERSION, 3)
      && @ldap_set_option($ldap_handle, LDAP_OPT_X_TLS_PROTOCOL_MIN, LDAP_OPT_X_TLS_PROTOCOL_TLS1_2)
      && @ldap_set_option($ldap_handle, LDAP_OPT_NETWORK_TIMEOUT, 3);

    if($auth_ldap_config['startTLS']) {
      $ldapOptSuccess = $ldapOptSuccess && @ldap_start_tls($ldap_handle);
    }

    if(!$ldapOptSuccess) {
      trigger_error('[SecDoc] ldapAuth.class.php -> Fehler beim Setzen der LDAP Optionen: ' . ldap_error($ldap_handle));
      error_log('[SecDoc] ldapAuth.class.php -> Fehler beim Setzen der LDAP Optionen: ' . ldap_error($ldap_handle));
      return FALSE;
    }

    # Try to login with supplied data
    $ldap_success = @ldap_bind($ldap_handle, $user . $auth_ldap_config['domain'], $pass);

    if(!$ldap_success) {
      trigger_error('[SecDoc] ldapAuth.class.php -> ldap_bind() Fehler: ' . ldap_error($ldap_handle));
      error_log('[SecDoc] ldapAuth.class.php ->ldap_bind() Fehler: ' . ldap_error($ldap_handle));
      return FALSE;
    }

    # Create new session token
    session_regenerate_id(TRUE);

    $_SESSION['login'] = TRUE;
    $_SESSION['user'] = $user;
    $_SESSION['groups'] = NULL;
    $_SESSION['userAgent'] = $_SERVER['HTTP_USER_AGENT'];
    $_SESSION['userIP'] = isset($_SERVER['HTTP_X_FORWARDED_FOR']) ? $_SERVER['HTTP_X_FORWARDED_FOR'] : $_SERVER['REMOTE_ADDR'];
    $_SESSION['expires'] = time() + $auth_ldap_config['cookie_lifetime'];

    return TRUE;
  }

  /**
   * Beendet die Session eines Nutzers durch Löschen der Session.
   *
   * @return bool TRUE bei erfolgreicher Abmeldung, sonst FALSE
   */
  public function logoutUser() {
    session_unset();
    session_destroy();
    return TRUE;
  }

  /**
   * Überprüft, ob der Nutzer eine aktive Sitzung besitzt.
   *
   * @global string LDAP Auth Konfiguration
   * @return bool TRUE falls der Nutzer eingeloggt ist, sonst FALSE
   */
  public function checkSession() {
    global $auth_ldap_config;

    $validSession = FALSE;

    # Check if user is logged in
    if(isset($_SESSION['login']) && $_SESSION['login'] === TRUE && !empty($_SESSION['user'])) $validSession = TRUE;

    # Check if session token is expired
    if($validSession && $_SESSION['expires'] < time()) {
      trigger_error('[SecDoc] ldapAuth.class.php -> checkSession() Fehler: Abgelaufene Session verwendet! Session entfernt. - Nutzer: ' . $_SESSION['user']);
      error_log('[SecDoc] ldapAuth.class.php -> checkSession() Fehler: Abgelaufene Session verwendet! Session entfernt. - Nutzer: ' . $_SESSION['user']);
      session_unset();
      session_destroy();
      $validSession = FALSE;
    }

    # Check if user's IP matches previous requests
    if($validSession && $auth_ldap_config['check_user_ip'] && $_SESSION['userIP'] !== $_SERVER['REMOTE_ADDR'] && (!isset($_SERVER['HTTP_X_FORWARDED_FOR']) || $_SESSION['userIP'] !== $_SERVER['HTTP_X_FORWARDED_FOR'])) {
      trigger_error('[SecDoc] ldapAuth.class.php -> checkSession() Fehler: Nutzer IP Adresse stimmt nicht mit Session überein! Session entfernt. - Nutzer: ' . $_SESSION['user']);
      error_log('[SecDoc] ldapAuth.class.php -> checkSession() Fehler: Nutzer IP Adresse stimmt nicht mit Session überein! Session entfernt. - Nutzer: ' . $_SESSION['user']);
      session_unset();
      session_destroy();
      $validSession = FALSE;
    }

    # Check if users's agent string matches previous requests
    if($validSession && $auth_ldap_config['check_user_agent'] && $_SESSION['userAgent'] !== $_SERVER['HTTP_USER_AGENT']) {
      trigger_error('[SecDoc] ldapAuth.class.php -> checkSession() Fehler: Nutzer Agent stimmt nicht mit Session überein! Session entfernt. - Nutzer: ' . $_SESSION['user']);
      error_log('[SecDoc] ldapAuth.class.php -> checkSession() Fehler: Nutzer Agent stimmt nicht mit Session überein! Session entfernt. - Nutzer: ' . $_SESSION['user']);
      session_unset();
      session_destroy();
      $validSession = FALSE;
    }

    # Extend session expiration and generate new token
    if($validSession === TRUE) {
      if($auth_ldap_config['refresh_token']) {
        $_SESSION['expires'] = time() + 60;
        session_regenerate_id(false);
      }

      $_SESSION['expires'] = time() + $auth_ldap_config['cookie_lifetime'];
    }

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

    if(is_null($_SESSION['groups'])) {
      require_once 'Utils.class.php';

      $_SESSION['groups'] = Utils::getUserGroups($_SESSION['user']);
    }

    if(is_array($_SESSION['groups'])) {
      return $_SESSION['groups'];
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
    global $useGroups;

    # Check if login exists
    if(!$this->checkSession()) return FALSE;

    if(empty($useGroups)) return TRUE;

    $userGroups = $this->getUserGroups();

    if(empty($userGroups)) return FALSE;

    require_once 'Utils.class.php';

    return Utils::checkUserGroups($userGroups, $useGroups);
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

    $userGroups = $this->getUserGroups();

    if(empty($userGroups)) return FALSE;

    require_once 'Utils.class.php';

    return Utils::checkUserGroups($userGroups, $adminGroups);
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

    $userGroups = $this->getUserGroups();

    if(empty($userGroups)) return FALSE;

    require_once 'Utils.class.php';

    return Utils::checkUserGroups($userGroups, $dpoGroups);
  }

  /**
   * Gibt die Nutzerkennung der eingeloggten Person zurück.
   *
   * @return string Nutzerkennung
   */
  public function getUserID() {
    return isset($_SESSION['user']) ? $_SESSION['user'] : '';
  }
}
?>