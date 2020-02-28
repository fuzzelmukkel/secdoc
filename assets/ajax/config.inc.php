<?php
  /**
   * config.inc.php - Zentrale Konfigurations-Einstellungen für SecDoc
   *
   * @author Thorsten Küfer <thorsten.kuefer@uni-muenster.de>
   * @copyright (c) 2019 Westfälische Wilhelms-Universität Münster
   * @license AGPL-3.0-or-later <https://www.gnu.org/licenses/agpl.html>
   *
   */

  # Globale Variablen
  $prog_name = "SecDoc Demosystem";
  $prog_version = "1.3.2 (2020.03.05)";
  $debug = isset($_REQUEST['debug']) ? filter_var($_REQUEST['debug'], FILTER_VALIDATE_BOOLEAN) : FALSE; # Für Live-System ausschalten, im Testsystem ist Debug-Modus standardmäßig an
  $debugGroups = ['demogroup']; # Nutzergruppen, die Zugriff auf die Debug-Ausgaben haben
  $GLOBALS['DEBUG'] = $debug;
  $dsbIDs = ['demouser'];

  # Zeitmessung starten
  $timer = array(array('Skript-Start', microtime(TRUE)));

  ini_set('date.timezone', 'Europe/Berlin');
  set_error_handler('php_error_handler');
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

  ini_set('PHP_OUTPUT_HANDLER_CLEANABLE', 1);
  ob_start();

  # Benötigte Funktionen einbinden
  require_once('DBCon.class.php');
  require_once('Utils.class.php');
  require_once('auth/Auth.class.php');

  # Mail-Konfiguration
  #ini_set('SMTP', 'mail.uni-muenster.de');
  #ini_set('smtp_port', 25);
  #ini_set('sendmail_from', 'SecDoc <secdoc@uni-muenster.de>');
  #set_time_limit(60);                    # Skript Timeout in Sekunden ein/ausschalten
  $eMailconfig = array (
    "fromEmail" => ' ',                        # Die Email Adresse die als Sender angezeigt werden soll
    "fromName" => ' ',                         # Der Name der Als Absender Angezeigt werden soll
    "replyEmail" => ' ',                       # eMail addresse die als reply angezeigt werden soll
    "replyName" => ' ',                        # Name der als reply to angezeigt werden soll
    "text" => '$verfahrensId $role \n',        # Text der Email $verfahrensId wird durch die Verfahrensnummer ersetzt $role wird durch die rolle der Person ersetzt (Ersteller, Techkontakt, Fachkontakt) \n wird zu linebreak
  );

  # Basispfad
  $base_dir = dirname($_SERVER['DOCUMENT_ROOT']);     # => "/www/data/ZIV.CERT"
  $base_dir = $base_dir ? $base_dir : "/var/www";

  $temp_dir     = "$base_dir/secdoc/temp";  # Hier landen temporäre Dateien
  $db_dir       = "$base_dir/secdoc";       # Hier liegt die SecDoc SQlite Datenbank
  $includes_dir = "$base_dir/secdoc/inc";   # Hier liegen die HTML Include-Bausteine
  $pdf_dir      = "$base_dir/secdoc/PDF";   # Hier liegen die PDF-Dateien (temporär für E-Mail-Versand)
  $vendor_dir   = '../vendor/autoload.php'; # Pfad zur Composer autoload.php für MPDF
  $sessions_dir = "$base_dir/secdoc/sessions";

  $db_name      = 'demo.db';


  # ----------------------------------------
  # IMAP.UNI-MUENSTER.DE
  # ----------------------------------------
  #$imap_user   = "secdoc";  # Benötigt für Signierung
  #$imap_pass   = user_read_pass($imap_user);
  #$imap_inbox  = "{imap.uni-muenster.de/ssl}INBOX";
  #$imap_inbox  = "{eximap.uni-muenster.de/tls}INBOX";
  #$imap_handle = imap_connect($imap_inbox);

  # ----------------------------------------
  # ORACLE Verbindung
  # ----------------------------------------
  # Verbindungen mit WBDB herstellen
  # Servername steht in tnsnames.ora
  #$oci_user    = "wb_cert";
  #$oci_pass    = Utils::readUserPassword($oci_user);
  #$oci_dbname  = "wbdb";
  #$oci_handle  = ocidb_connect();     # nur noch bei Bedarf => Utils.class.php

  #$x509_info = imap_check_x509();

  # ----------------------------------------
  # Security Konfiguration
  # ----------------------------------------
  $auth_method      = 'demo'; # Aktuell werden die Werte 'ldap', 'sso' und 'demo' unterstützt
  $auth_class       = $auth_method . 'Auth';
  $auth_ldap_config = [
    'host' => '',
    'port' => 389,
    'domain' => '@wwu.de',
    'startTLS' => FALSE, # Im Betrieb auf TRUE setzen
    'check_user_ip' => TRUE,
    'check_user_agent' => TRUE,
    'refresh_token' => FALSE,
    'cookie_lifetime' => 1800,
    'cookie_secure' => FALSE
  ];
  $useGroups        = [];
  $adminGroups      = ['demogroup'];
  $dpoGroups        = ['demogroup'];

  if(!@require_once("auth/{$auth_method}Auth.class.php")) throw new Exception("[SecDoc] config.inc.php Fehler: Authentifizierungsklasse '{$auth_method}Auth.class.php' wurde nicht gefunden oder konnte nicht eingebunden werden!");

  $authClass = new $auth_class;

  # ----------------------------------------
  # LDAP Verbindung
  # ----------------------------------------
  $ldap_use      = FALSE; # Für Demo-Modus auf FALSE setzen
  $ldap_host     = '';
  $ldap_port     = 389;
  $ldap_user     = '';
  $ldap_pass     = '';
  $ldap_startTLS = FALSE; # Im Betrieb auf TRUE setzen

  # Suchparameter für die verschiedenen LDAP-Abrufe ($ als Placeholder für Suchstrings in ldap_filter)
  $ldap_configs = [
    'groups' => ['ldap_base' => 'OU=Projekt-Gruppen,DC=wwu,DC=de', 'ldap_filter' => '(&(objectClass=group)(|(cn=*$*)(description=*$*)))', 'ldap_attributes' => ['cn', 'description']], # Suche nach Gruppen
    'usergroups' => ['ldap_base' => 'OU=Projekt-Gruppen,DC=wwu,DC=de', 'ldap_filter' => '(&(objectClass=group)(member=CN=$,OU=Projekt-Benutzer,DC=wwu,DC=de))', 'ldap_attributes' => ['cn']], # Gruppen zu einem Nutzer
    'groupname' => ['ldap_base' => 'OU=Projekt-Gruppen,DC=wwu,DC=de', 'ldap_filter' => '(&(objectClass=group)(cn=$))', 'ldap_attributes' => ['description']], # Beschreibung zu einer Gruppe
    'users_id' => ['ldap_base' => 'OU=Projekt-Benutzer,DC=wwu,DC=de', 'ldap_filter' => '(&(objectClass=user)(cn=$))', 'ldap_attributes' => ['cn', 'givenname', 'sn', 'gecos', 'telephonenumber', 'mail']], # Nutzersuche nach ID
    'users_one' => ['ldap_base' => 'OU=Projekt-Benutzer,DC=wwu,DC=de', 'ldap_filter' => '(&(objectClass=user)(|(cn=$*)(sn=$*)(givenname=$*)))', 'ldap_attributes' => ['cn', 'givenname', 'sn', 'gecos', 'telephonenumber', 'mail']], # Nutzersuche nach Namen (ein Wert)
    'users_two' => ['ldap_base' => 'OU=Projekt-Benutzer,DC=wwu,DC=de', 'ldap_filter' => '(&(objectClass=user)(|(&(sn=$*)(givenname=$*))(&(sn=$*)(givenname=$*))))', 'ldap_attributes' => ['cn', 'givenname', 'sn', 'gecos', 'telephonenumber', 'mail']], # Nutzersuche nach Name (zwei Werte)
    'usermail' => ['ldap_base' => 'OU=Projekt-Benutzer,DC=wwu,DC=de', 'ldap_filter' => '(&(objectClass=user)(cn=$))', 'ldap_attributes' => ['mail']], # E-Mail Adresse holen
  ];

  $ldap_user_filter = [
    'active' => '(|(memberof=CN=u0shk,OU=Projekt-Gruppen,DC=wwu,DC=de)(memberof=CN=u0mitarb,OU=Projekt-Gruppen,DC=wwu,DC=de)(memberof=CN=e0mitwwu,OU=Projekt-Gruppen,DC=wwu,DC=de))(!(memberof=CN=y0msexma,OU=Projekt-Gruppen,DC=wwu,DC=de))',
    'employee' => '(|(memberof=CN=u0mitarb,OU=Projekt-Gruppen,DC=wwu,DC=de)(memberof=CN=e0mitwwu,OU=Projekt-Gruppen,DC=wwu,DC=de))'
  ];
?>
