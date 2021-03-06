#!/usr/local/bin/php
<?php
  /**
   * cpe-update.php - CPE-Feed von NIST holen
   *
   * https://nvd.nist.gov/products/cpe
   * wget -O- https://nvd.nist.gov/feeds/xml/cpe/dictionary/official-cpe-dictionary_v2.3.xml.gz | gunzip > cpe.xml
   * cd /www/data/ZIVtest/htdocs/ZIVtest/secdoc/assets/ajax && ./cpe-update.php > /dev/null
   *
   * @author Thorsten Küfer <thorsten.kuefer@uni-muenster.de>
   * @copyright (c) 2018 Westfälische Wilhelms-Universität Münster
   * @license AGPL-3.0-or-later <https://www.gnu.org/licenses/agpl.html>
   *
   * TK, 13.06.2018 - Erste Version
   */

  if(php_sapi_name() !== 'cli') die('cli execution only!');

  $debug = 0;

  # Vorhandenes Verzeichnis laden
  $xml = simplexml_load_file("../xml/cpe.xml");
  $timestamp = strval($xml->generator->timestamp);

  # CPE Dictionary aktualisieren, wenn älter als ein Tag
  if (time()-strtotime($timestamp) > 24*60*60)
  {
    if ($debug) { print "Notice: Aktualisiere CPE Dictionary...\n"; }
    exec('/usr/bin/wget -O- https://nvd.nist.gov/feeds/xml/cpe/dictionary/official-cpe-dictionary_v2.3.xml.gz 2>/dev/null | /usr/bin/gunzip > ../xml/cpe.xml', $output, $ret);
    if ($ret)
    {
      print "Warning: Problem beim Aktualisieren des CPE Dictionarys\n";
      print_r($output);
    }
    else
    {
      # Aktualisiertes Verzeichnis laden
      $xml = simplexml_load_file("../xml/cpe.xml");
    }
  }

  # Stand überprüfen und ausgeben
  $timestamp = date('Y-m-d H:i:s', strtotime(strval($xml->generator->timestamp)));
  if ($debug) { print "Notice: Common Platform Enumeration (CPE) Dictionary (Stand: $timestamp).\n"; }

  print "DELETE FROM CPE;\n";
  print "BEGIN TRANSACTION;\n";
  # Alle Einträge durchgehen und in SQL umwandeln
  foreach ($xml->{'cpe-item'} as $item)
  {
    $item_value = strval($item->attributes()->name);
    $item_label = strval($item->title);
    $item_label = str_replace("'", "''", $item_label);
    if (preg_match("/cpe:\/([ao]):/", $item_value, $matches))    # Typ h (Hardware) ignorieren!
    {
      $item_typ = $matches[1];
      print "INSERT INTO CPE VALUES ('$item_value', '$item_label', '$item_typ');\n";
    }
  }
  print "END TRANSACTION;\n";
?>
