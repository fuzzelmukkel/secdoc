<?php
  /**
   * Utils.clas.php - Enthält die Utils-Klasse für ausgelagerte Hilfsfunktionen
   *
   * @author Thorsten Küfer <thorsten.kuefer@uni-muenster.de>
   * @author Dustin Gawron <dustin.gawron@uni-muenster.de>
   * @copyright (c) 2018 Westfälische Wilhelms-Universität Münster
   * @license AGPL-3.0-or-later <https://www.gnu.org/licenses/agpl.html>
   *
   */

  /**
   * Bündelt Hilfsfunktionen, die teilweise externe Ressourcen nutzen müssen.
   *
   */
  class Utils {
    /**
     * Durchsucht die Netzdatenbank nach einem DNS-Namen oder einer IP.
     *
     * @param string $term Suchbegriff
     * @global type $oci_handle Datenkbank-Handle für externe Datenbank
     * @return array Liste der zutreffenden Systeme
     */
    public static function searchipdns($term): array {
      $arr = array();
      array_push($arr, array('value' => '127.0.0.1', 'label' => "localhost (127.0.0.1)"));
      array_push($arr, array('value' => '::1', 'label' => "localhost (ipv6)"));
      return $arr;
    }

   /**
    * Überprüft, ob der Nutzer eine der berechtigten Nutzergruppen hat.
    *
    * @param array $ownedGroups  Nutzergruppen eines eingeloggten Nutzers
    * @param array $searchGroups Liste von Gruppen, die berechtigt sind
    * @return bool Gibt TRUE zurück, falls der Nutzer eine der notwendigen Berechtigungen hat, sonst FALSE
    */
    public static function checkUserGroups($ownedGroups, $searchGroups): bool {
     $access = TRUE;
     return $access;
   }

   /**
    * Maskiert alle HTML-Symbole im Eingabearray (mehrdimensional möglich).
    *
    * @param array $arr Array
    * @return array Rückgabearray
    */
    public static function encodeHTMLArray(array $arr) {
      foreach($arr as $key => $value) {
        if(is_array($value)) {
          $arr[$key] = self::encodeHTMLArray($value);
        }
        else if(is_string($value)) {
          $arr[$key] = htmlspecialchars($value, ENT_QUOTES, 'UTF-8', FALSE);
        }
      }
      return $arr;
    }

   /**
    * Gibt den angegebenen Wert oder einen Standardtext aus.
    *
    * @param string $value
    * @return string
    */
    public static function valueOrDefault($value): string
    {
       if ((isset($value)) &&
           (is_string($value)) &&
           (!empty(trim($value)))) {
           return $value;
       }
       return sprintf(
         '<em><i>%s</i></em>',
         gettext("Nicht angegeben")
       );
    }

    /**
     * Versendet eine S/MIME signierte E-Mail.
     *
     * @global bool $debug Debug-Einstellung
     * @param string $to          Empfänger
     * @param string $cc          CC Empfänger
     * @param string $bcc         BCC Empfänger
     * @param string $subject     Subjekt der E-Mail
     * @param string $body        Inhalt der E-Mail
     * @param array  $attachments Array von Anhänge-Pfaden
     * @return type
     */
    public static function imapSendMimeMail($to, $cc, $bcc, $subject, $body, $attachments) {
      return TRUE;
    }

    /**
     * Holt den Aufstellungsort zu einer IP-Adresse.
     *
     * @global type $oci_handle Datenkbank-Handle für externe Datenbank
     * @param string $ip IP-Adresse
     * @return string Aufstellungsort oder ein Platzhalter, falls kein Ort bekannt
     */
    public static function getAufstellungsort($ip) {
      $netzDb = array('127.0.0.1' => "Mein Büro",
                       '::1' => "ZIV, Raum 111, Einsteinstr. 60"
                     );
      if ($ort = $netzDb['$ip']) {
        return $ort;
      } else {
        return "Kein Aufstellungsort in Netzdatenbank eingetragen.";
      }
    }

    /**
     * Holt die Kennung des aktuell eingeloggten Nutzers.
     *
     * @return string Kennung des Nutzers oder einen leeren String, falls keine Kennung gefunden wurde
     */
    public static function getCurrentUserId(): string {
      $userId = 'demouser';
      return $userId;
    }

    /**
     * Holt alle gültigen Nutzergruppen zu einer Kennung.
     *
     * @param string $userId Nutzerkennung
     * @return array Liste der Nutzergruppen
     */
    public static function getUserGroups($userId) {
      //Gruppen über das LDAP holen
      $ldap = Utils::getfromLDAP ("(uid=$userId)", array('memberOf'));
      $ldap = $ldap[0]['memberof'];
      unset($ldap['count']);
      foreach($ldap as $key => $value) {
        $ldap[$key] = substr($value, strpos($value, '=')+1, strpos($value, ',')-3);
      }
      return $ldap;
    }

    /**
     * Holt den Namen zu einer Nutzergruppe.
     *
     * @global type $oci_handle Datenkbank-Handle für externe Datenbank
     * @param string $groupId ID der Nutzergruppe
     * @return string Name der Nutzergruppe
     */
    public static function getGroupName($groupId) {
      #return get_name_from_group($groupId);
      $groupNames = array('demogroup' => 'Gruppe für SecDoc Demosystem',
                          'demogroup2' => 'Zweite Gruppe für SecDoc Demosystem',
                          'demogroup3' => 'Dritte Gruppe für SecDoc Demosystem'
                          );
      return $groupNames[$groupId];
    }

    /**
     * Holt die Anrede zu einer Nutzerkennung.
     *
     * @global type $oci_handle Datenkbank-Handle für externe Datenbank
     * @param string $userId Nutzerkennung
     * @return string Anrede
     */
    public static function getUserAnrede($userId) {
      #return get_anrede_from_nid($userId);
      return 'Sehr geehrte Damen und Herren';
    }

    /**
     * Holt die E-Mail-Adresse zu einer Nutzerkennung, falls vorhanden.
     *
     * @global type $oci_handle Datenkbank-Handle für externe Datenbank
     * @param string $userId Nutzerkennung
     * @return string E-Mail-Adresse oder false
     */
    public static function getUserAlias($userId) {
      $result = self::getLDAPentry($userId, "mail");
      return $result;
    }

    /**
     * Passwort aus Datei einlesen.
     *
     * @global string $key_filename Pfad zur Passwortdatei
     * @param string $userId Nutzerkennung
     * @return string|bool Passwort oder False bei Fehler
     */
    public static function readUserPassword($userId) {
      #return user_read_pass($userId);
      return 'demopass';
    }

    /**
     * Liest das Ldap aus und gibt nur einen Gesuchten Wert zurück
     * @parm string uid des gesuchten kontaktes
     * @parm welcher Eintrag gesucht wird
     * @return string mit dem gesuchten Eintrag
     */
    public static function getLDAPentry ($uid, $eintrag) {
      $result = self::getfromLDAP("uid=$uid", array($eintrag));
      return $result[0][$eintrag][0];
    }


    /**
    * Holt Daten von einem LDAP Server. Je nach Set Up muss noch Benutzername und Passwort ergänzt werden.
    * @parm string $kriterium für die Suche nach Einträgen
    * @parm array $gesucht für die Werte die aus den Einträgen ausgelesen werden sollen
    * @return array gibt alle gefundenen Werte als Array zurück
    */
    public static function getfromLDAP ($kriterium, $gesucht) {
      $ldaprdn = " ";
      $ldappass = " ";

      $ldap_uri = " ";
	    $ldap_base = " ";
	    # Verbindung zu Ldap herstellen
	    $ldapcon = ldap_connect($ldap_uri)
		    or die("Es konnte keine Verbindung zum Ldap Server hergestellt werden");
	    ldap_set_option($ldapcon, LDAP_OPT_PROTOCOL_VERSION, 3);
	    ldap_start_tls($ldapcon);
	    ldap_bind($ldapcon);
	    # Einträge suchen
	    $search = ldap_search($ldapcon, $ldap_base, $kriterium, $gesucht);
	    $result = ldap_get_entries($ldapcon, $search);
	    return $result;
    }

  }
?>
