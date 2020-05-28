<?php
  /**
   * secdoc.conf.php - Beispiel für lokale Konfigurationsdatei
   *
   * Ermöglicht das Auslagern von Konfigurationen aus dem WWW-Verzeichnis.
   * Pfade müssen weiterhin zwangsläufig in assets/ajax/config.inc.php angepasst werden!
   *
   * @author Dustin Gawron <d.gawron@uni-muenster.de>
   * @copyright (c) 2019-2020 Westfälische Wilhelms-Universität Münster
   * @license AGPL-3.0-or-later <https://www.gnu.org/licenses/agpl.html>
   *
   */

   # ----------------------------------------
   # Globale Konfiguration setzen
   # ----------------------------------------
   $prog_name    = "SecDoc Demosystem";
   $prog_version = "1.5 (2020.05.28)";
   $prog_url     = 'http://localhost/';

   # ----------------------------------------
   # E-Mail-Konfiguration
   # ----------------------------------------
   $eMail_config = array (
     "fromEmail" => '',                        # E-Mail-Adresse, die als Sender angezeigt werden soll
     "fromName" => '',                         # Name, der als Absender angezeigt werden soll
     "replyEmail" => '',                       # E-Mail-Addresse, die als Reply to angezeigt werden soll
     "replyName" => '',                        # Name, der als Reply to angezeigt werden soll
     # Text der E-Mail - $verfahrensId wird durch die Verfahrensnummer ersetzt. $role wird durch die Rolle der Person ersetzt (Ersteller, Techkontakt, Fachkontakt). \n wird zu linebreak
     "text" => "Das SecDoc Verfahren \"\$title\" mit der Nummer \$verfahrensId wurde abgeschlossen.\nBei diesem Verfahren wurden Sie als \$role eingetragen.\n\nIm Anhang dieser E-Mail finden Sie eine PDF mit allen Details über das erstellte Verfahren.\n\nDarüber hinaus ist das Verfahren online unter $prog_url?id=\$verfahrensId einsehbar.\n\nMit freundlichen Grüßen\nIhr SecDoc-Team\n",
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
     'cookie_secure' => FALSE
   ];

   # Besondere Nutzergruppen für Zugriffskonfiguration
   $useGroups        = [];             # Gruppe(n) für SecDoc-Nutzer (leer für alle)
   $adminGroups      = ['demogroup'];  # Gruppe(n) für Administratoren
   $debugGroups      = ['demogroup'];  # Gruppe(n) für Zugriff auf die Debug-Ausgaben haben
   $dpoGroups        = ['demogroup'];  # Gruppe(n) für Datenschutzbeauftragte
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
     'usergroups' => ['ldap_base' => 'OU=Projekt-Gruppen,DC=wwu,DC=de', 'ldap_filter' => '(&(objectClass=group)(member=CN=$,OU=Projekt-Benutzer,DC=wwu,DC=de))', 'ldap_attributes' => ['cn']], # Gruppen zu einem Nutzer
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
?>
