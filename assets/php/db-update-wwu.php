#!/usr/local/bin/php
<?php
  /**
   * db-update-wwu.php - Zur Befüllung der SQLite-DB (secdoc.db) mit Personen- und Organisationseinheitdaten aus WWU Datenbanken.
   *
   * TK, 18.07.2018 - Erste Version
   *
   * @author Thorsten Küfer <thorsten.kuefer@uni-muenster.de>
   * @copyright (c) 2018 Westfälische Wilhelms-Universität Münster
   * @license AGPL-3.0-or-later <https://www.gnu.org/licenses/agpl.html>
   */

  if(php_sapi_name() !== 'cli') die('cli execution only!');

  # Allgemeine Einstellungen
  require_once('../ajax/config.inc.php');

  # Skript-Einstellungen
  set_time_limit(0);

  header('Content-type: text/plain; charset=utf-8');
  ob_end_flush();

  # Verbindungen mit WBDB herstellen
  $oci_handle  = ocidb_connect();

  # SQL-Statements für SQLite-DB erzeugen
  print "DELETE FROM PERSONEN;\n";
  print "DELETE FROM ORGANISATIONSEINHEITEN;\n";
  print "DELETE FROM IVVEN;\n";
  print "BEGIN TRANSACTION;\n";
  sql_personen_table();
  sql_organisationseinheiten_table();
  sql_ivven_table();
  print "END TRANSACTION;\n";

  /**
   * Personen-Tabelle mit Mitarbeitern und Stud. Hilfskräften füllen.
   *
   */
  function sql_personen_table()
  {
    sql_mitarbeiter_table();
    sql_studhilfskraefte_table();
  }

  /**
   * Liste der Mitarbeiter sowie Adresse, Tel. und E-Mail holen.
   *
   */
  function sql_mitarbeiter_table()
  {
    $nids = array_unique(array_merge(get_nids_from_group('u0mitarb'), get_nids_from_group('e0mitwwu')));

    # Anzeigename für Einträge in Kennungs-Liste holen
    if (count($nids)>0)
    {
      foreach ($nids as $nid)
      {
        $info = get_info_from_nid($nid);
        $label = "$info[0], $info[1]";
        # Werte 2-4 sind optional
        if ($info[2])
        {
          $label .= ", $info[2]";
        }
        if ($info[3])
        {
          $label .= ", $info[3]";
        }
        if ($info[4])
        {
          $label .= ", Tel.: $info[4]";
        }
        if ($info[7])
        {
          $label .= ", E-Mail: $info[7]";
        }
        print "INSERT INTO PERSONEN VALUES('$nid', '$info[0]', '$label', '$info[8]');\n";
      }
    }
  }

  /**
   * Liste der Stud. Mitarbeiter mit Name holen.
   *
   */
  function sql_studhilfskraefte_table()
  {
    $nids = array_unique(get_nids_from_group('u0shk'));

    # Anzeigename für Einträge in Kennungs-Liste holen
    if (count($nids)>0)
    {
      foreach ($nids as $nid)
      {
        $name = get_name_from_nid($nid);
        print "INSERT INTO PERSONEN VALUES('$nid', '$name', NULL, NULL);\n";
      }
    }
  }

  /**
   * Liste der IVVen holen (Tabelle V_NETZ).
   *
   * @global type $oci_handle Globaler Datenbank-Handle
   */
  function sql_ivven_table()
  {
    global $oci_handle;

    # Suche über Feld IVV
    $sql = "SELECT DISTINCT Trim(ivv) as ivv FROM wb_cert.v_netz ORDER BY ivv";
    if ($GLOBALS['DEBUG'])
    { print '<p class="debug"><b>Notice</b>: oci_execute(): ' . htmlspecialchars($sql) . '</p>'; }
    $stmt = oci_parse($oci_handle, $sql);
    oci_execute($stmt);
    if ($e = oci_error($stmt))
    { err($e['code'] . ": " . htmlspecialchars($e['message'])); }
    $num = oci_fetch_all($stmt, $rows);
    if($num > 0)
    {
      foreach ($rows['IVV'] as $ivv)
      {
        if ($ivv !== '-- LEER --')
        {
          print "INSERT INTO IVVEN VALUES('$ivv');\n";
        }
      }
    }
  }

  /**
   * Liste der Organisationseinheiten mit Adresse holen (Tabelle WWUBEN.INSTITUTS_ADRESSEN).
   *
   * @global type $oci_handle Gloabler Datenbank-Handle
   */
  function sql_organisationseinheiten_table()
  {
    global $oci_handle;

    $sql = "SELECT Trim(Institut) as Id, Name || ', ' || Str || ', ' || Ort as Name FROM wwuben.instituts_adressen WHERE Status='A' ORDER BY institut";
    if ($GLOBALS['DEBUG'])
    { print '<p class="debug"><b>Notice</b>: oci_execute(): ' . htmlspecialchars($sql) . '</p>'; }
    $stmt = oci_parse($oci_handle, $sql);
    oci_execute($stmt);
    if ($e = oci_error($stmt))
    { err($e['code'] . ": " . htmlspecialchars($e['message'])); }
    $num = oci_fetch_all($stmt, $rows, 0, -1, OCI_FETCHSTATEMENT_BY_ROW);
    if($num > 0)
    {
      foreach ($rows as $row)
      {
        if (preg_match('/^\w/', $row['ID']) && preg_match('/^\w/', $row['NAME']))
        {
          print "INSERT INTO ORGANISATIONSEINHEITEN VALUES('$row[ID]', '$row[NAME]');\n";
        }
      }
    }
  }

  /**
   * Liste der Organisationseinheiten mit Adresse holen (Tabelle ALT_INSTITUTE/PROJEKTE).
   *
   * @global type $oci_handle Globaler Datenbank-Handle
   */
  function sql_organisationseinheiten_table2()
  {
    global $oci_handle;

    # Suche über Feld INSTITUT
    $sql = "SELECT Name || ', ' || Str || ', ' || Ort as Institut FROM wb_cert.alt_institute WHERE Institut in (SELECT Institut from wb_cert.projekte where Status='A') ORDER BY institut";
    if ($GLOBALS['DEBUG'])
    { print '<p class="debug"><b>Notice</b>: oci_execute(): ' . htmlspecialchars($sql) . '</p>'; }
    $stmt = oci_parse($oci_handle, $sql);
    oci_execute($stmt);
    if ($e = oci_error($stmt))
    { err($e['code'] . ": " . htmlspecialchars($e['message'])); }
    $num = oci_fetch_all($stmt, $rows);
    if($num > 0)
    {
      foreach ($rows['INSTITUT'] as $org)
      {
        print "INSERT INTO ORGANISATIONSEINHEITEN VALUES('$org');\n";
      }
    }
  }

  /**
   * Liste der Organisationseinheiten holen (Tabelle V_NETZ).
   *
   * @global type $oci_handle Globaler Datenbank-Handle
   */
  function sql_organisationseinheiten_table3()
  {
    global $oci_handle;

    # Suche über Feld INSTITUT
    $sql = "SELECT DISTINCT Trim(institut) as institut FROM wb_cert.v_netz ORDER BY institut";
    if ($GLOBALS['DEBUG'])
    { print '<p class="debug"><b>Notice</b>: oci_execute(): ' . htmlspecialchars($sql) . '</p>'; }
    $stmt = oci_parse($oci_handle, $sql);
    oci_execute($stmt);
    if ($e = oci_error($stmt))
    { err($e['code'] . ": " . htmlspecialchars($e['message'])); }
    $num = oci_fetch_all($stmt, $rows);
    if($num > 0)
    {
      foreach ($rows['INSTITUT'] as $org)
      {
        if ($org !== '-- LEER --')
        {
          print "INSERT INTO ORGANISATIONSEINHEITEN VALUES('$org');\n";
        }
      }
    }
  }

  /**
   * Liste der Organisationseinheiten holen (Tabelle PUBLIC_ETB).
   *
   * @global type $oci_handle Globaler Datenbank-Handle
   */
  function sql_organisationseinheiten_table4()
  {
    global $oci_handle;

    $sql = "SELECT DISTINCT trim(dienststelle) as dienststelle FROM wb_cert.public_etb ORDER BY dienststelle";
    if ($GLOBALS['DEBUG'])
    { print '<p class="debug"><b>Notice</b>: oci_execute(): ' . htmlspecialchars($sql) . '</p>'; }
    $stmt = oci_parse($oci_handle, $sql);
    oci_execute($stmt);
    if ($e = oci_error($stmt))
    { err($e['code'] . ": " . htmlspecialchars($e['message'])); }
    $num = oci_fetch_all($stmt, $rows);
    if($num > 0)
    {
      foreach ($rows['DIENSTSTELLE'] as $org)
      {
        print "INSERT INTO ORGANISATIONSEINHEITEN VALUES('$org');\n";
      }
    }
  }
?>
