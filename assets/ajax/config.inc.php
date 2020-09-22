<?php
  /**
   * config.inc.php - Zentrale Konfigurations-Einstellungen für SecDoc
   *
   * @author Thorsten Küfer <thorsten.kuefer@uni-muenster.de>
   * @copyright (c) 2019-2020 Westfälische Wilhelms-Universität Münster
   * @license AGPL-3.0-or-later <https://www.gnu.org/licenses/agpl.html>
   *
   */

  # ----------------------------------------
  # PHP Einstellungen
  # ----------------------------------------
  ini_set('PHP_OUTPUT_HANDLER_CLEANABLE', 1);
  ini_set('date.timezone', 'Europe/Berlin');
  ob_start();

  # ----------------------------------------
  # Benötigte Funktionen einbinden
  # ----------------------------------------
  require_once('DBCon.class.php');
  require_once('Utils.class.php');
  require_once('auth/Auth.class.php');
  require_once('docmgmt/DocMGMT.class.php');

  # ----------------------------------------
  # Globale Konfiguration setzen
  # ----------------------------------------
  $prog_name    = "SecDoc Demosystem";
  $prog_version = "1.6.1 (2020.08.14)";
  $prog_url     = 'http://localhost/';

  # Debugging
  set_error_handler('php_error_handler');
  /**
   * Eigene Fehlerbehandlung
   *
   * @param  number $errno   Fehlernummer
   * @param  string $errstr  Fehlerbeschreibung
   * @param  string $errfile Skript in dem der Fehler auftrat
   * @param  number $errline Zeile in welcher der Fehler auftrat
   * @return bool
   */
  function php_error_handler($errno, $errstr, $errfile, $errline)
  {
    $errfile = basename($errfile);
    if ($errno == E_USER_ERROR)
    {
      print "PHP Fehler: $errstr (in $errfile, Zeile $errline).\n";
      exit($errno);
    }
    else
    {
      print "PHP Warnung: $errstr (in $errfile, Zeile $errline).\n";
      return TRUE;
    }
    return FALSE;
  }
  $debug = isset($_REQUEST['debug']) ? filter_var($_REQUEST['debug'], FILTER_VALIDATE_BOOLEAN) : FALSE; # Für Live-System ausschalten, im Testsystem ist Debug-Modus standardmäßig an
  $GLOBALS['DEBUG'] = $debug;

  # Basispfade
  $base_dir = dirname($_SERVER['DOCUMENT_ROOT']);
  $base_dir = $base_dir ? $base_dir : "/var/www";

  $secret_dir   = "$base_dir/secdoc";           # Hier liegen Passwörter und Zertifikate
  $temp_dir     = "$base_dir/temp";             # Hier landen temporäre Dateien
  $db_dir       = "$base_dir/secdoc";           # Hier liegt die SecDoc SQlite Datenbank
  $includes_dir = "$base_dir/secdoc/inc";       # Hier liegen die HTML Include-Bausteine
  $pdf_dir      = "$base_dir/secdoc/PDF";       # Hier liegen die PDF-Dateien (temporär für E-Mail-Versand)
  $vendor_dir   = '../vendor/autoload.php';     # Pfad zur Composer autoload.php für MPDF
  $sessions_dir = "$base_dir/secdoc/sessions";  # Pfad für PHP Session Dateien

  # Datenbankname
  $db_name = 'demo.db';

  # Zeitmessung starten
  $timer = array(array('Skript-Start', microtime(TRUE)));

  # Wartungsmodus
  $maintenanceMode    = FALSE;
  $maintenanceMessage = 'Aktuell wird eine Wartung durchgeführt. Bitte probieren Sie es später nochmal.';

  # ----------------------------------------
  # E-Mail-Konfiguration
  # ----------------------------------------
  $eMail_config = array (
    "fromEmail" => '',                        # E-Mail-Adresse, die als Sender angezeigt werden soll
    "fromName" => '',                         # Name, der als Absender angezeigt werden soll
    "replyEmail" => '',                       # E-Mail-Addresse, die als Reply to angezeigt werden soll
    "replyName" => '',                        # Name, der als Reply to angezeigt werden soll
    # Text der E-Mail - $verfahrensId wird durch die Verfahrensnummer ersetzt. $role wird durch die Rolle der Person ersetzt (Ersteller, Techkontakt, Fachkontakt). \n wird zu linebreak
    "text" => "Die Dokumentation \$verfahrensTyp \"\$title\" mit der Nummer \$verfahrensId wurde in SecDoc abgeschlossen.\nBei diesem Verfahren sind Sie als \$role eingetragen.\n\nIm Anhang dieser E-Mail finden Sie eine PDF-Datei mit allen Details zur erstellten Dokumentation.\n\nDarüber hinaus ist die Dokumentation online unter der URL $prog_url?id=\$verfahrensId einsehbar.\n\nMit freundlichen Grüßen\nIhr SecDoc-Team\n",
    "smtp" => false,                          # Ob SMTP verwendet werden soll
    "host" => '',                             # SMTP Server Adresse
    "SMTPAuth" => true,                       # Ob eine Authentifizierung verwendet werden soll
    "SMTPSecure"=> 'ssl',                     # Verschlüsselungsmethode
    "Username" => '',                         # Benutzername
    "Password" => '',                         # Passwort
    "Port"     => 465,                        # Port
    "signed" => false,                        # Ob ein S/MIME Zertifikat genutzt werden soll
    "CRT" => '',                              # Pfad zur Zertifikatsdatei mit der Endung crt
    "KEY" => '',                              # Pfad zur Schlüsseldatei mit der Endung key
    "PKP" => '',                              # Passwort, mit dem der private Schlüssel gesichert wurde (nicht das Import Passwort!), kann auch leer sein. Parameter muss aber angegeben werden.
    "PEM" => '',                              # Pfad zur PEM Datei
  );

  # ----------------------------------------
  # Authentifizierungs-Konfiguration
  # ----------------------------------------
  $auth_method      = 'demo';         # Aktuell werden die Werte 'ldap', 'sso', 'openid' und 'demo' unterstützt
  $auth_class       = $auth_method . 'Auth';
  $auth_ldap_config = [
    'host' => '',                     # Utils::getDomainController('xyz.de') oder Servername/-adresse direkt angeben
    'port' => 389,
    'domain' => '',                   # z.B. '@xyz.de'
    'startTLS' => FALSE,              # Im Betrieb auf TRUE setzen
    'check_user_ip' => TRUE,
    'check_user_agent' => TRUE,
    'refresh_token' => FALSE,
    'cookie_lifetime' => 1800,
    'cookie_secure' => FALSE,         # Im Betrieb auf TRUE setzen
    'cookie_domain' => '',            # (optional) Domain Beschränkung für Cookies; leer nutzt die aktuelle Domain
    'cookie_path' => ''               # (optional) Domain Beschränkung auf Pfad
  ];

  # Besondere Nutzergruppen für Zugriffskonfiguration
  $userGroups       = [];             # Gruppe(n) für SecDoc-Nutzer (leer für alle)
  $adminGroups      = ['demogroup'];  # Gruppe(n) für Administratoren
  $debugGroups      = ['demogroup'];  # Gruppe(n) für Zugriff auf die Debug-Ausgaben haben
  $dpoGroups        = ['demogroup'];  # Gruppe(n) für Datenschutzbeauftragte
  $managerGroups    = ['demogroup'];  # Gruppe(n) für Bereichsleiter
  $dsbIDs           = ['demouser'];   # NutzerIDs für DSB-Zugriff

  # ----------------------------------------
  # ORACLE Datenquelle Konfiguration (anstelle von lokaler SQLite DB)
  # ----------------------------------------
  # Verbindungen mit WBDB herstellen
  # Servername steht in tnsnames.ora
  #$oci_user    = "wb_cert";
  #$oci_pass    = Utils::readUserPassword($oci_user);
  #$oci_dbname  = "wbdb";
  #$oci_handle  = ocidb_connect();

  # ----------------------------------------
  # LDAP Datenquelle Konfiguration (anstelle von lokaler SQLite DB)
  # ----------------------------------------
  $ldap_use      = FALSE;       # Für Demo-Modus auf FALSE setzen
  $ldap_host     = '';          # Utils::getDomainController('xyz.de') oder Servername/-adresse direkt angeben
  $ldap_port     = 389;
  $ldap_user     = '';
  $ldap_pass     = '';
  $ldap_startTLS = FALSE;       # Im Betrieb auf TRUE setzen

  # Suchparameter für die verschiedenen LDAP-Abrufe ($ als Placeholder für Suchstrings in ldap_filter)
  # Beispiele aus WWU. Muss lokal angepasst werden!
  $ldap_configs = [
    'groups' => ['ldap_base' => 'OU=Projekt-Gruppen,DC=wwu,DC=de', 'ldap_filter' => '(&(objectClass=group)(|(cn=*$*)(description=*$*)))', 'ldap_attributes' => ['cn', 'description']], # Suche nach Gruppen
    'usergroups' => ['ldap_base' => 'OU=Projekt-Benutzer,DC=wwu,DC=de', 'ldap_filter' => '(&(objectClass=user)(cn=$))', 'ldap_attributes' => ['memberof']], # Gruppen zu einem Nutzer
    'groupname' => ['ldap_base' => 'OU=Projekt-Gruppen,DC=wwu,DC=de', 'ldap_filter' => '(&(objectClass=group)(cn=$))', 'ldap_attributes' => ['description']], # Beschreibung zu einer Gruppe
    'users_id' => ['ldap_base' => 'OU=Projekt-Benutzer,DC=wwu,DC=de', 'ldap_filter' => '(&(objectClass=user)(cn=$))', 'ldap_attributes' => ['cn', 'givenname', 'sn', 'gecos', 'telephonenumber', 'mail']], # Nutzersuche nach ID
    'users_one' => ['ldap_base' => 'OU=Projekt-Benutzer,DC=wwu,DC=de', 'ldap_filter' => '(&(objectClass=user)(|(cn=$*)(sn=$*)(givenname=$*)))', 'ldap_attributes' => ['cn', 'givenname', 'sn', 'gecos', 'telephonenumber', 'mail']], # Nutzersuche nach Namen (ein Wert)
    'users_two' => ['ldap_base' => 'OU=Projekt-Benutzer,DC=wwu,DC=de', 'ldap_filter' => '(&(objectClass=user)(|(&(sn=$*)(givenname=$*))(&(sn=$*)(givenname=$*))))', 'ldap_attributes' => ['cn', 'givenname', 'sn', 'gecos', 'telephonenumber', 'mail']], # Nutzersuche nach Name (zwei Werte)
    'usermail' => ['ldap_base' => 'OU=Projekt-Benutzer,DC=wwu,DC=de', 'ldap_filter' => '(&(objectClass=user)(cn=$))', 'ldap_attributes' => ['mail']], # E-Mail Adresse holen
  ];

  # Beispiele aus WWU. Muss lokal angepasst werden!
  $ldap_user_filter = [
    'active' => '(|(memberof=CN=u0shk,OU=Projekt-Gruppen,DC=wwu,DC=de)(memberof=CN=u0mitarb,OU=Projekt-Gruppen,DC=wwu,DC=de)(memberof=CN=e0mitwwu,OU=Projekt-Gruppen,DC=wwu,DC=de))(!(memberof=CN=y0msexma,OU=Projekt-Gruppen,DC=wwu,DC=de))',
    'employee' => '(|(memberof=CN=u0mitarb,OU=Projekt-Gruppen,DC=wwu,DC=de)(memberof=CN=e0mitwwu,OU=Projekt-Gruppen,DC=wwu,DC=de))'
  ];

  # ----------------------------------------
  # Konfiguration der Dokumentenverwaltung
  # ----------------------------------------
  $docmgmt_method        = 'local';  # Aktuell demo und local unterstützt
  $docmgmt_maxAttachSize = 12 * 1024 * 1024; # Anhangsgröße in Bytes, ab wann eine Warnung angezeigt wird (Default: 12MB)
  $docmgmt_class         = $docmgmt_method . 'DocMGMT';

  # ----------------------------------------
  # Lokale Konfiguration laden
  # ----------------------------------------
  include_once("$secret_dir/secdoc.conf.php");

  # ----------------------------------------
  # Dokumentenverwaltungsklasse laden
  # ----------------------------------------
  if(!@require_once("docmgmt/{$docmgmt_class}.class.php")) throw new Exception("config.inc.php Fehler: Dokumentenverwaltungsklasse '{$docmgmt_class}.class.php' wurde nicht gefunden oder konnte nicht eingebunden werden!");
  $docmgmtClass = new $docmgmt_class;

  # ----------------------------------------
  # Authentifizierungsklasse laden
  # ----------------------------------------
  if(!@require_once("auth/{$auth_method}Auth.class.php")) throw new Exception("[SecDoc] config.inc.php Fehler: Authentifizierungsklasse '{$auth_method}Auth.class.php' wurde nicht gefunden oder konnte nicht eingebunden werden!");
  $authClass = new $auth_class;
?>
