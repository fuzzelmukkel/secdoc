<?php
  /**
   * Utils.clas.php - Enthält die Utils-Klasse für ausgelagerte Hilfsfunktionen
   *
   * @author Thorsten Küfer <thorsten.kuefer@uni-muenster.de>
   * @author Dustin Gawron <dustin.gawron@uni-muenster.de>
   * @copyright (c) 2018-2021 Westfälische Wilhelms-Universität Münster
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
     $access = FALSE;
     foreach($searchGroups as $group) {
       $access = in_array($group, $ownedGroups);
       if($access) break;
     }
     return $access;
   }

   /**
    *
    * Überprüfen, ob Dienst auf $host und $port erreichbar ist
    *
    * @param string $host  IP oder DNS des Hosts
    * @param number $port  Portnummer des Dienstes
    * @return bool TRUE falls Dienst erreichbar, sonst FALSE
    */

    public static function checkHostPort($host, $port)
    {
      $check = @fsockopen($host, $port, $errno, $errstr, 1); # 1 Sekunde Timeout!
      if (!$check)
      {
        return FALSE;
      }
      fclose($check);
      return TRUE;
    }

   /**
    * Ersten aktiven Domänencontroller aus DNS zurück liefern
    *
    * @param string $domain  Domänenname
    * @return mixed Hostname des Domänencontrollers, FALSE falls keiner erreichbar
    */
    public static function getDomainController($domain)
    {
      $arr = dns_get_record($domain);

      # DNS-Abfrage filtern
      if (is_array($arr))
      {
        foreach($arr as $val)
        {
          if(@$val['class'] == 'IN')
          {
            switch(@$val['type'])
            {
              case 'A': # IPv4
                if (@$val['ip'] != '')
                {
                  $result[$val['ip']] = $val['ip'];
                }
                break;
              case 'AAAA': # IPv6
                if(@$val['ipv6'] != '')
                {
                  $result[$val['ipv6']] = $val['ipv6'];
                }
                break;
            }
          }
        }
      }

      # Ersten erreichbaren Domänencontroller zurück geben
      foreach ($result as $res)
      {
        if (self::checkHostPort($res, 389))
        {
          return gethostbyaddr($res);
        }
      }
      return FALSE;
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
         "Nicht angegeben"
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
     * Durchsucht alle Nutzer.
     *
     * @global LDAPHandle $ldap_handle  LDAP Verbindung
     * @global array      $ldap_configs LDAP Konfigurationen
     * @param  string $query    Suchbegriff
     * @param  bool   $id       Soll exakt nach einer Kennung gesucht werden?
     * @param  bool   $employee Soll nur nach Mitarbeitern gesucht werden?
     * @return array Liste der Nutzer ([['value' => 'u0mitarb', 'name' => 'Anzeigename', 'label' => 'Anzeigename, Abteilung, Telefon, Mail'], ...])
     */
    public static function searchUsers($query, $id = FALSE, $employee = FALSE) {
      global $ldap_handle, $ldap_configs, $ldap_use, $ldap_user_filter, $dbcon, $dataSources;

      $query = trim($query);
      if(empty($query)) return [];

      $foundUsers = [];

      if($ldap_use && ($dataSources['users'] === 'ldap' || $dataSources['users'] === 'ldap+db')) {
        # LDAP Abfrage durchführen
        if($id) {
          $ldap_filter = str_replace('$', ldap_escape($query), $ldap_configs['users_id']['ldap_filter']);
          $result = self::getfromLDAP($ldap_configs['users_id']['ldap_base'], $ldap_filter, $ldap_configs['users_id']['ldap_attributes']);
        }
        else {
          $terms = explode(' ', trim($query));

          if(count($terms) === 1) {
            $replacements = [ldap_escape($terms[0]), ldap_escape($terms[0]), ldap_escape($terms[0])];
            $ldap_filter = str_replace(['$', '$', '$'], $replacements, $ldap_configs['users_one']['ldap_filter']);
          }
          elseif(count($terms) === 2) {
            $parts = explode('$', $ldap_configs['users_two']['ldap_filter']);
            $ldap_filter = $parts[0] . ldap_escape($terms[0]) . $parts[1] . ldap_escape($terms[1]) . $parts[2] . ldap_escape($terms[1]) . $parts[3] . ldap_escape($terms[0]) . $parts[4];
          }
          elseif(count($terms) >= 2) {
            $terms[1] = implode(' ', array_slice($terms, 1));
            $parts = explode('$', $ldap_configs['users_two']['ldap_filter']);
            $ldap_filter = $parts[0] . ldap_escape($terms[0]) . $parts[1] . ldap_escape($terms[1]) . $parts[2] . ldap_escape($terms[1]) . $parts[3] . ldap_escape($terms[0]) . $parts[4];
          }

          if($employee) {
            $ldap_filter = substr($ldap_filter, 0, -1) . $ldap_user_filter['employee'] . ')';
          }
          else {
            $ldap_filter = substr($ldap_filter, 0, -1) . $ldap_user_filter['active'] . ')';
          }

          $result = self::getfromLDAP($ldap_configs['users_one']['ldap_base'], $ldap_filter, $ldap_configs['users_one']['ldap_attributes']);
        }

        if(is_array($result) && array_key_exists('count', $result) && $result['count'] > 0) {
          foreach($result as $user) {
            if(is_array($user) && array_key_exists($ldap_configs['users_one']['ldap_attributes'][0], $user)) {
              $label = '';
              if(array_key_exists($ldap_configs['users_one']['ldap_attributes'][1], $user))  $label .= $user[$ldap_configs['users_one']['ldap_attributes'][1]][0];
              if(array_key_exists($ldap_configs['users_one']['ldap_attributes'][2], $user))  $label .= ' ' . $user[$ldap_configs['users_one']['ldap_attributes'][2]][0];
              $name = $label;
              if(array_key_exists($ldap_configs['users_one']['ldap_attributes'][3], $user))  $label .= ', ' . $user[$ldap_configs['users_one']['ldap_attributes'][3]][0];
              if(array_key_exists($ldap_configs['users_one']['ldap_attributes'][4], $user))  $label .= ', Tel.: ' . $user[$ldap_configs['users_one']['ldap_attributes'][4]][0];
              if(array_key_exists($ldap_configs['users_one']['ldap_attributes'][5], $user))  $label .= ', E-Mail: ' . str_replace('exchange.wwu.de', 'uni-muenster.de', $user[$ldap_configs['users_one']['ldap_attributes'][5]][0]);

              array_push($foundUsers, ['value' => $user[$ldap_configs['users_one']['ldap_attributes'][0]][0], 'label' => $label, 'name' => $name]);
            }
          }
        }
      }

      if($dataSources['users'] === 'db' || (empty($foundUsers) && $dataSources['users'] === 'ldap+db')) {
        # DB Abfrage durchführen
        if($id) {
          $result = $dbcon->searchPerson($query, $employee, TRUE);
        }
        else {
          $result = $dbcon->searchPerson($query, $employee);
        }

        foreach($result as $val) {
          array_push($foundUsers, ['value' => $val['Kennung'], 'label' => empty($val['Anzeigename']) ? $val['Name'] : $val['Anzeigename'], 'name' => $val['Name']]);
        }
      }

      return $foundUsers;
    }

    /**
     * Holt alle gültigen Nutzergruppen zu einer Kennung.
     *
     * @global LDAPHandle $ldap_handle  LDAP Verbindung
     * @global array      $ldap_configs LDAP Konfigurationen
     * @global bool       $ldap_use     Gibt an, ob LDAP genutzt werden soll
     * @param string $userId Nutzerkennung
     * @return array Liste der Nutzergruppen
     */
    public static function getUserGroups($userId) {
      global $ldap_handle, $ldap_configs, $ldap_use, $dataSources, $dbcon;

      $userId = trim($userId);
      if(empty($userId)) return [];

      $foundGroups = [];

      if($ldap_use && ($dataSources['usergroups'] === 'ldap' || $dataSources['usergroups'] === 'ldap+db')) {
        # LDAP Abfrage durchführen
        $result = self::getfromLDAP($ldap_configs['usergroups']['ldap_base'], str_replace('$', ldap_escape($userId), $ldap_configs['usergroups']['ldap_filter']), $ldap_configs['usergroups']['ldap_attributes']);

        if(is_array($result) && array_key_exists('count', $result) && $result['count'] > 0) {
          foreach($result[0]['memberof'] as $group) {
            if(is_string($group)) array_push($foundGroups, explode('=', explode(',', $group)[0])[1]);
          }
        }
      }

      if($dataSources['usergroups'] === 'db' || (empty($foundGroups) && $dataSources['usergroups'] === 'ldap+db')) {
        # DB Abfrage durchführen
        $groups = $dbcon->searchUsergroups($userId);

        foreach($groups as $group) {
          array_push($foundGroups, $group['ID']);
        }
      }

      return $foundGroups;
    }

    /**
     * Durchsucht alle Nutzergruppen.
     *
     * @global LDAPHandle $ldap_handle  LDAP Verbindung
     * @global array      $ldap_configs LDAP Konfigurationen
     * @global bool       $ldap_use     Gibt an, ob LDAP genutzt werden soll
     * @param  string $query Suchbegriff
     * @return array Liste der Nutzergruppen ([['value' => 'u0mitarb', 'label' => 'Beschreibung'], ...])
     */
    public static function searchGroups($query) {
      global $ldap_handle, $ldap_configs, $ldap_use, $dataSources, $dbcon;

      $query = trim($query);
      if(empty($query)) return [];

      $foundGroups = [];

      if($ldap_use && ($dataSources['groups'] === 'ldap' || $dataSources['groups'] === 'ldap+db')) {
        # LDAP Abfrage durchführen
        $result = self::getfromLDAP($ldap_configs['groups']['ldap_base'], str_replace('$', ldap_escape($query), $ldap_configs['groups']['ldap_filter']), $ldap_configs['groups']['ldap_attributes']);

        if(is_array($result) && array_key_exists('count', $result) && $result['count'] > 0) {
          foreach($result as $group) {
            if(is_array($group) && array_key_exists($ldap_configs['groups']['ldap_attributes'][0], $group) && array_key_exists($ldap_configs['groups']['ldap_attributes'][1], $group)) {
              array_push($foundGroups, ['value' => $group[$ldap_configs['groups']['ldap_attributes'][0]][0], 'label' => $group[$ldap_configs['groups']['ldap_attributes'][0]][0] . ': ' . $group[$ldap_configs['groups']['ldap_attributes'][1]][0]]);
            }
          }
        }
      }

      if($dataSources['groups'] === 'db' || (empty($foundGroups) && $dataSources['groups'] === 'ldap+db')) {
        # DB Abfrage durchführen
        $groups = $dbcon->searchGroups($query);

        foreach($groups as $group) {
          array_push($foundGroups, ['value' => $group['ID'], 'label' => $group['Description']]);
        }
      }

      return $foundGroups;
    }

    /**
     * Holt den Namen zu einer Nutzergruppe.
     *
     * @global LDAPHandle $ldap_handle  LDAP Verbindung
     * @global array      $ldap_configs LDAP Konfigurationen
     * @global bool       $ldap_use     Gibt an, ob LDAP genutzt werden soll
     * @param string $groupId ID der Nutzergruppe
     * @return string Name der Nutzergruppe
     */
    public static function getGroupName($groupId) {
      global $ldap_handle, $ldap_configs, $ldap_use, $dataSources, $dbcon;

      $groupId = trim($groupId);
      if(empty($groupId)) return '';

      if($ldap_use && ($dataSources['groups'] === 'ldap' || $dataSources['groups'] === 'ldap+db')) {
        # LDAP Abfrage durchführen#
        $result = self::getfromLDAP($ldap_configs['groupname']['ldap_base'], str_replace('$', ldap_escape($groupId), $ldap_configs['groupname']['ldap_filter']), $ldap_configs['groupname']['ldap_attributes']);

        if(is_array($result) && array_key_exists('count', $result) && $result['count'] > 0) {
          return $result[0][$ldap_configs['groupname']['ldap_attributes'][0]][0];
        }
        else
        {
          if($dataSources['groups'] === 'ldap') return '';
        }
      }

      if($dataSources['groups'] === 'db' || $dataSources['groups'] === 'ldap+db') {
        # DB Abfrage durchführen
        $groups = $dbcon->searchGroups($groupId, TRUE);

        if(count($groups) > 0) return $groups[0]['Description'];
      }

      return '';
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
     * @global LDAPHandle $ldap_handle  LDAP Verbindung
     * @global array      $ldap_configs LDAP Konfigurationen
     * @global bool       $ldap_use     Gibt an, ob LDAP genutzt werden soll
     * @param string $userId Nutzerkennung
     * @return string E-Mail-Adresse oder false
     */
    public static function getUserAlias($userId) {
      global $ldap_handle, $ldap_configs, $ldap_use;

      if(!$ldap_use) {
        return 'demo.user@demo.domain';
      }

      if(empty($userId)) return FALSE;

      $result = self::getfromLDAP($ldap_configs['usermail']['ldap_base'], str_replace('$', ldap_escape($userId), $ldap_configs['usermail']['ldap_filter']), $ldap_configs['usermail']['ldap_attributes']);

      if(is_array($result) && array_key_exists('count', $result) && $result['count'] > 0) {
        return $result[0][$ldap_configs['usermail']['ldap_attributes'][0]][0];
      }
      else
      {
        return FALSE;
      }
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
     * Holt Daten von einem LDAP Server.
     *
     * @param  string $base      LDAP Base
     * @param  string $filter    Filter für die Suche nach Einträgen
     * @param  array $attributes Auszulesende Werte
     * @return array Liste der gefundenen Einträge
     */
    private static function getfromLDAP($base, $filter, $attributes) {
      global $ldap_handle, $ldap_host, $ldap_port, $ldap_user, $ldap_pass, $ldap_startTLS;

      if(empty($base) || empty($filter) || empty($attributes)) return [];

      # Verbindung zu LDAP herstellen falls noch nicht verfügbar
      if(empty($ldap_handle)) {
        $ldap_handle = @ldap_connect($ldap_host, $ldap_port);

        if(!$ldap_handle) {
          trigger_error('[SecDoc] Utils.class.php -> ldap_connect() Fehler: ' . ldap_error());
          error_log('[SecDoc] Utils.class.php ->ldap_connect() Fehler: ' . ldap_error());
          $ldap_handle = NULL;
          return [];
        }

        $ldapOptSuccess = @ldap_set_option($ldap_handle, LDAP_OPT_PROTOCOL_VERSION, 3)
          && @ldap_set_option($ldap_handle, LDAP_OPT_X_TLS_PROTOCOL_MIN, LDAP_OPT_X_TLS_PROTOCOL_TLS1_2)
          && @ldap_set_option($ldap_handle, LDAP_OPT_NETWORK_TIMEOUT, 3);

        if($ldap_startTLS) {
          $ldapOptSuccess = $ldapOptSuccess && @ldap_start_tls($ldap_handle);
        }

        if(!$ldapOptSuccess) {
          trigger_error('[SecDoc] Utils.class.php -> Fehler beim Setzen der LDAP Optionen: ' . ldap_error($ldap_handle));
          error_log('[SecDoc] Utils.class.php -> Fehler beim Setzen der LDAP Optionen: ' . ldap_error($ldap_handle));
          return [];
        }

        if(!empty($ldap_user) && !empty($ldap_user)) {
          $ldap_success = @ldap_bind($ldap_handle, $ldap_user, $ldap_pass);
        }
        else {
          $ldap_success = @ldap_bind($ldap_handle);
        }

        if(!$ldap_success) {
          trigger_error('[SecDoc] Utils.class.php -> ldap_bind() Fehler: ' . ldap_error($ldap_handle));
          error_log('[SecDoc] Utils.class.php ->ldap_bind() Fehler: ' . ldap_error($ldap_handle));
          $ldap_handle = NULL;
          return [];
        }
      }

	    # Einträge suchen
	    $ldap_search = @ldap_search($ldap_handle, $base, $filter, $attributes);

      if($ldap_search === FALSE) {
        trigger_error('[SecDoc] Utils.class.php -> ldap_search() Fehler: ' . ldap_error($ldap_handle));
        error_log('[SecDoc] Utils.class.php -> ldap_search() Fehler: ' . ldap_error($ldap_handle));
        return [];
      }

	    $result = @ldap_get_entries($ldap_handle, $ldap_search);
      if($result === FALSE) {
        trigger_error('[SecDoc] Utils.class.php -> ldap_get_entries() Fehler: ' . ldap_error($ldap_handle));
        error_log('[SecDoc] Utils.class.php -> ldap_get_entries() Fehler: ' . ldap_error($ldap_handle));
        return [];
      }

	    return $result;
    }

  }
?>
