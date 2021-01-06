<?php
  /**
   * cpe.php - CVE-Feed von NIST holen
   * 
   * 
   * Holt die aktuellen CPE-Einträge vom NIST
   * https://nvd.nist.gov/products/cpe
   * wget -O- https://nvd.nist.gov/feeds/xml/cpe/dictionary/official-cpe-dictionary_v2.3.xml.gz | gunzip > cpe.xml
   *
   * ToDo
   *  * evtl. beim ersten Aufruf zur Performance-Verbesserung als JSON speichern (muss getestet werden)
   *
   * @author Thorsten Küfer <thorsten.kuefer@uni-muenster.de>
   * @copyright (c) 2018-2021 Westfälische Wilhelms-Universität Münster
   * @license AGPL-3.0-or-later <https://www.gnu.org/licenses/agpl.html>
   *
   *  2018-06-13 TK term darf mehrere durch Leerzeichen getrennte Suchbegriffe enthalten
   *  2018-06-12 TK automatisches Update der Datei => über cpe-update.php als cron-Job realisiert
   */

  header('Content-type: application/json');

  # Parameter auswerten und sichern
  $do = $_REQUEST['do'];
  $terms = explode(' ', $_REQUEST['term']);

  #error_reporting(E_ALL);
  #libxml_disable_entity_loader(TRUE);
  #print readfile("../xml/cpe.xml");

  # XML-Datei laden
  if ($xml = simplexml_load_file("../xml/cpe.xml"))
  {
    # Stand überprüfen
    $timestamp = date('Y-m-d', strtotime(strval($xml->generator->timestamp)));
    if ($GLOBALS['DEBUG'])
    {
      print "<p class=\"debug\"><strong>Notice</strong>: Lade Common Platform Enumeration (CPE) Dictionary (Stand: $timestamp).</p>";
    }

    # SimpleXML-Iterator in Array kopieren, damit er sortiert werden kann
    $items = array();
    foreach ($xml->{'cpe-item'} as $item)
    {
      $item_value = strval($item->attributes()->name);
      $item_label = strval($item->title);
      if ($do == 'os')
      {
        if (preg_match("/cpe:\/o:/", $item_value))
        {
          if (match($terms, $item_label))
          {
            $item = array();
            $item['value'] = $item_value;
            $item['label'] = $item_label;
            array_push($items, $item);
            #$items[$item_label] = $item_value;
          }
        }
      }
      elseif ($do == 'app')
      {
        if (preg_match("/cpe:\/a:/", $item_value))
        {
          if (match($terms, $item_label))
          {
            $item = array();
            $item['value'] = $item_value;
            $item['label'] = $item_label;
            array_push($items, $item);
            #$items[] = $item;
            #$items[$item_label] = $item_value;
          }
        }
      }
    }

    print(json_encode($items));

    # Array mit Benutzerfunktion "natürlich" sortieren
    #uasort($aw_messages, function($a, $b) { return strnatcmp($a->attributes()->ip, $b->attributes()->ip); });
  }

  /**
   * Prüft, ob alle $terms in $label vorkommen.
   * 
   * @param array  $terms Suchbegriffe
   * @param string $label Zu durchsuchendes Label
   * @return boolean True, falls alle Suchbegriffe gefunden, sonst false
   */
  function match($terms = array(), $label = '')
  {
    foreach ($terms as $term)
    {
      #print "Checking $term in $label";
      if (!preg_match("/\b$term/i", $label))
      {
        return false;
      }
    }
    return true;
  }

  #print_r(libxml_get_errors());
?>
