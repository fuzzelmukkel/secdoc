#!/usr/local/bin/php
<?php
  /**
   * tom-update.php - Beispielskript zur Umwandlung einer TOM Liste in SQL.
   *
   * @author Dustin Gawron <dustin.gawron@uni-muenster.de>
   * @copyright (c) 2019 Westfälische Wilhelms-Universität Münster
   * @license AGPL-3.0-or-later <https://www.gnu.org/licenses/agpl.html>
   *
   */
  if(php_sapi_name() !== 'cli') die('cli execution only!');
  $file = new SplFileObject("ENISA_TOM_List.txt");

  print "BEGIN TRANSACTION;\n";
  print "DELETE FROM toms;\n";

  while (!$file->eof()) {
    $line = $file->fgets();
    if(empty($line)) continue;
    $arr = explode('|', $line);

    $identifier = trim($arr[1]);
    $category = trim($arr[2]);
    $subcategory = trim($arr[3]);
    $title = '';
    $description = trim($arr[4]);
    $risklevel = intval(trim($arr[5]));
    $type = intval(trim($arr[6]));

    print "INSERT INTO toms (Identifier, Category, Subcategory, Title, Description, Risklevel, Type) VALUES ('$identifier', '$category', '$subcategory', '$title', '$description', $risklevel, $type);\n";
  }

  print "END TRANSACTION;\n";

  $file = null;
?>
