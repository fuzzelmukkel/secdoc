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

      require_once('../../../case/include/func.inc.php');

      global $oci_handle;

      # Verbindungen mit WBDB herstellen
      if (empty($oci_handle))
      {
        $oci_handle  = ocidb_connect();
      }

      $term = strtolower($term);
      $sql = "SELECT Concat(name, Concat('.', subdom)) as name, ip_addr FROM wb_cert.v_netznamen WHERE (ip_addr like '$term%' or Lower(Concat(name, Concat('.', subdom))) like '$term%') AND rownum <= 25 order by name,ip_addr";
      if ($GLOBALS['DEBUG'])
      { print '<p class="debug"><b>Notice</b>: oci_execute(): ' . htmlspecialchars($sql) . '</p>'; }
      $stmt = oci_parse($oci_handle, $sql);
      oci_execute($stmt);
      if ($e = oci_error($stmt))
      { err($e['code'] . ": " . htmlspecialchars($e['message'])); }
      $num = oci_fetch_all($stmt, $rows);
      if ($num>0)
      {
        $arr = array();
        foreach ($rows['NAME'] as $id => $dns)
        {
          $ip = $rows['IP_ADDR'][$id];
          array_push($arr, array('value' => $ip, 'label' => "$dns [$ip]"));
        }
        return $arr;
      }
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

      require_once('../../../case/include/func.inc.php');

      global $debug;

      # X.509 Konfiguration testen
      $x509_info = imap_check_x509();
      if ($x509_info && $debug)
      {
        trigger_error("X.509-Zertifikat ausgestellt für $x509_info");
      }

      return imap_send_mime_mail($to, $cc, $bcc, $subject, $body, $attachments);
    }

    /**
     * Holt den Aufstellungsort zu einer IP-Adresse.
     *
     * @global type $oci_handle Datenkbank-Handle für externe Datenbank
     * @param string $ip IP-Adresse
     * @return string Aufstellungsort oder ein Platzhalter, falls kein Ort bekannt
     */
    public static function getAufstellungsort($ip) {

      require_once('../../../case/include/func.inc.php');

      global $oci_handle;

      # Verbindungen mit WBDB herstellen
      if (empty($oci_handle))
      {
        $oci_handle  = ocidb_connect();
      }

      if ($ret = get_info_from_ip($ip))
      {
        $ret = "$ret[2], $ret[3], $ret[4]";
        return $ret;
      }
      else
      {
        return "Kein Aufstellungsort in Netzdatenbank eingetragen.";
      }
    }

    /**
     * Holt die Kennung des aktuell eingeloggten Nutzers.
     *
     * @return string Kennung des Nutzers oder einen leeren String, falls keine Kennung gefunden wurde
     */
    public static function getCurrentUserId(): string {
      $userId = '';

      if(is_string($_SERVER['HTTP_X_TRUSTED_REMOTE_USER'])) { $userId = $_SERVER['HTTP_X_TRUSTED_REMOTE_USER']; }
      elseif(is_string($_SERVER['REDIRECT_REMOTE_USER']))   { $userId = $_SERVER['REDIRECT_REMOTE_USER']; }
      elseif(is_string($_SERVER['REMOTE_USER']))            { $userId = $_SERVER['REMOTE_USER']; }

      return $userId;
    }

    /**
     * Holt alle gültigen Nutzergruppen zu einer Kennung.
     *
     * @param string $userId Nutzerkennung
     * @return array Liste der Nutzergruppen
     */
    public static function getUserGroups($userId) {

      require_once('/www/data/groups.php');

      $userGroups = array_filter($groups[$userId], function($group) { return (preg_match('/(^@|=)/i', $group) !== 1) ? TRUE : FALSE; });

      return $userGroups;
    }

    /**
     * Holt den Namen zu einer Nutzergruppe.
     *
     * @global type $oci_handle Datenkbank-Handle für externe Datenbank
     * @param string $groupId ID der Nutzergruppe
     * @return string Name der Nutzergruppe
     */
    public static function getGroupName($groupId) {

      require_once('../../../case/include/func.inc.php');

      global $oci_handle;

      # Verbindungen mit WBDB herstellen
      if (empty($oci_handle))
      {
        $oci_handle  = ocidb_connect();
      }

      return get_name_from_group($groupId);
    }

    /**
     * Holt die Anrede zu einer Nutzerkennung.
     *
     * @global type $oci_handle Datenkbank-Handle für externe Datenbank
     * @param string $userId Nutzerkennung
     * @return string Anrede
     */
    public static function getUserAnrede($userId) {

      require_once('../../../case/include/func.inc.php');

      global $oci_handle;

      # Verbindungen mit WBDB herstellen
      if (empty($oci_handle))
      {
        $oci_handle  = ocidb_connect();
      }

      return get_anrede_from_nid($userId);

    }

    /**
     * Holt die E-Mail-Adresse zu einer Nutzerkennung, falls vorhanden.
     *
     * @global type $oci_handle Datenkbank-Handle für externe Datenbank
     * @param string $userId Nutzerkennung
     * @return string E-Mail-Adresse oder false
     */
    public static function getUserEmail($userId) {

      require_once('../../../case/include/func.inc.php');

      global $oci_handle;

      # Verbindungen mit WBDB herstellen
      if (empty($oci_handle))
      {
        $oci_handle  = ocidb_connect();
      }

      return user_check_email($userId);

    }

    /**
     * Passwort aus Datei einlesen.
     *
     * @global string $key_filename Pfad zur Passwortdatei
     * @param string $userId Nutzerkennung
     * @return string|bool Passwort oder False bei Fehler
     */
    public static function readUserPassword($userId) {

      require_once('../../../case/include/func.inc.php');

      return user_get_password($userId);
    }
  }
?>
