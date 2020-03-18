<?php
  /**
   * DBCon.class.php - Enthält die DBCon-Klasse zur Verbindung mit der Datenbank
   *
   * @author Thorsten Küfer <thorsten.kuefer@uni-muenster.de>
   * @author Dustin Gawron <dustin.gawron@uni-muenster.de>
   * @copyright (c) 2018 Westfälische Wilhelms-Universität Münster
   * @license AGPL-3.0-or-later <https://www.gnu.org/licenses/agpl.html>
   *
   */

  /**
   * SQLite Datenbank Schnittstelle für die Verfahrensverwaltung und zur Abfrage von Ausfüllhinweisen
   *
   *
   * Tabelle: Verfahren
   * <pre>
   * +-----------+---+------------+------------+------------+-----------+-------------+------------+-----------+-----------+----------+----------------+------+------------+----+------------+
   * |ID         |Typ|Erstelldatum|Bezeichnung |Beschreibung|Risikolevel|Fachabteilung|IVV         |FachKontakt|TechKontakt|Ersteller |Bearbeitergruppe|Status|Sichtbarkeit|JSON|DSBKommentar|
   * +-----------+---+------------+------------+------------+-----------+-------------+------------+-----------+-----------+----------+----------------+------+------------+----+------------+
   * |INT        |INT|DATE        |VARCHAR(100)|TEXT        |INT        |VARCHAR(100) |VARCHAR(100)|VARCHAR(8) |VARCHAR(8) |VARCHAR(8)|VARCHAR(8)      |INT   |INT         |BLOB|TEXT        |
   * |PRIMARY KEY|   |            |            |            |           |             |            |           |           |          |                |      |            |    |            |
   * +-----------+---+------------+------------+------------+-----------+-------------+------------+-----------+-----------+----------+----------------+------+------------+----+------------+
   * </pre>
   * * Typ: 1 = Verarbeitungstätigkeit, 2 = IT-Verfahren, 3 = Fachapplikation
   * * Risikolevel: 1 = Niedrig, 2 = Mittel, 3 = Hoch
   * * Status: 0 = In Bearbeitung, 2 = Fertiggestellt, 3 = Gelöscht
   * * Sichtbarkeit: 0 = Nur für Bearbeiter (Ersteller, FachKontakt, TechKontakt und Bearbeitergruppe), 3 = Jeder eingeloggte Nutzer
   *
   * Tabelle: Verfahren_Historie
   * <pre>
   * +------------------------------------+-----------+-----------+
   * |Verfahrens_Id                       |Kennung    |Datum      |
   * +------------------------------------+-----------+-----------+
   * |INT                                 |VARCHAR(8) |DATE       |
   * |PRIMARY KEY                         |PRIMARY KEY|PRIMARY KEY|
   * |FOREIGN KEY REFERENCES verfahren(ID)|           |           |
   * +------------------------------------+-----------+-----------+
   * </pre>
   *
   * Tabelle: Dependency
   * <pre>
   * +--------------------------------------+--------------------------------------+
   * | Dependent                            | Dependency                           |
   * +--------------------------------------+--------------------------------------+
   * | INT                                  | INT                                  |
   * | PRIMARY KEY                          | PRIMARY KEY                          |
   * | FOREIGN KEY REFERENCES verfahren(ID) | FOREIGN KEY REFERENCES verfahren(ID) |
   * +--------------------------------------+--------------------------------------+
   * </pre>
   * * Dependent: Das abhängige Verfahren
   * *Dependency: Die Abhängigkeit
   *
   * Tabelle: Personen
   * <pre>
   * +-------------+------+-------------+-------------+
   * | Kennung     | Name | Anzeigename | Datenquelle |
   * +-------------+------+-------------+-------------+
   * | VARCHAR(8)  | TEXT | TEXT        | VARCHAR(50) |
   * | PRIMARY KEY |      |             |             |
   * +-------------+------+-------------+-------------+
   * </pre>
   *
   * Tabelle: Organisationseinheit
   * <pre>
   * +-------------+---------+
   * | Org_Id      | Name    |
   * +-------------+---------+
   * | TEXT        | TEXT    |
   * | PRIMARY KEY |         |
   * +-------------+---------+
   * </pre>
   *
   * Tabelle: IVVen
   * <pre>
   * +-------------+
   * | Name        |
   * +-------------+
   * | TEXT        |
   * | PRIMARY KEY |
   * +-------------+
   * </pre>
   *
   * Tabelle: CPE
   * <pre>
   * +-------------+------+------+
   * | CPE         | Name | Typ  |
   * +-------------+------+------+
   * | TEXT        | TEXT | TEXT |
   * | PRIMARY KEY |      |      |
   * +-------------+------+------+
   * </pre>
   * * Typ: h = Hardware, a = Applikationen, o = Betriebssysteme
   *
   * Tabelle: TOMs
   * <pre>
   * +-------------+-------------+----------+-------------+-------+-------------+-----------+------+------+
   * | Identifier  | Lang        | Category | Subcategory | Title | Description | Risklevel | Type | Mode |
   * +-------------+-------------+----------+-------------+-------+-------------+-----------+------+------+
   * | VARCHAR(10) | VARCHAR(2)  | TEXT     | TEXT        | TEXT  | TEXT        | INT       | INT  | INT  |
   * | PRIMARY KEY | PRIMARY KEY |          |             |       |             |           |      |      |
   * +-------------+-------------+----------+-------------+-------+-------------+-----------+------+------+
   * </pre>
   * * Risklevel: 1 = Low, 2 = Medium, 3 = High
   * * Type: 1 = Technical, 2 = Organizational
   * * Mode: 0 = processing activity (and fallback for IT process), 1 = IT process
   *
   * Tabelle: Permissions
   * <pre>
   * +-------------+-------------+---------+---------+
   * | Process_ID  | ID          | IsGroup | CanEdit |
   * +-------------+-------------+---------+---------+
   * | INT         | TEXT        | INT     | INT     |
   * | PRIMARY KEY | PRIMARY KEY |         |         |
   * +-------------+-------------+---------+---------+
   * </pre>
   *
   * Tabelle: Suggestions
   * <pre>
   * +-------------+-------------+-------------+----------------+
   * | Field       | Lang        | Entry       | AdditionalInfo |
   * +-------------+-------------+-------------+----------------+
   * | TEXT        | TEXT        | TEXT        | TEXT           |
   * | PRIMARY KEY | PRIMARY KEY | PRIMARY KEY |                |
   * +-------------+-------------+-------------+----------------+
   * </pre>
   *
   */
  class DBCon {

    /** @var PDO|null PDO-Objekt */
    protected $pdo = NULL;
    /** @var bool Zeigt an, ob eine Datenbank-Verbindung aktiv ist */
    protected $connected = FALSE;
    /** @var string Enthält den Dateinamen für die DB */
    protected $filename = 'demo.db';
    /** @var string Enthält einen Standardpfad zur DB-Datei, falls keiner übergeben wurde */
    protected $path = '/secdoc/';

    /** @var int Aktuelle DB-Version */
    const DBVERSION = 8; # Version für eine DB-Struktur; zur Überprüfung beim Laden genutzt

    /** @var int Maximale Anzahl an Historien-Einträgen */
    const MAXHISTORY = 15; # Nur diese Anzahl an Historien-Einträgen wird behalten

    # Aktuelle Tabellen-Definitionen
    /** @var string[] Tabellendefinitionen */
    const TABLES = [
        "CREATE TABLE verfahren (
            ID INTEGER PRIMARY KEY,                                               -- Eindeutige ID für ein Verfahren (kann automatisch inkrementiert werden oder manuell gesetzt werden)
            Typ INT NOT NULL DEFAULT 1,                                           -- Typ des Eintrags (1 = Verarbeitungstätigkeit, 2 = IT-Verfahren)
            Erstelldatum DATE DEFAULT '',                                         -- Einführungsdatum des Verfahrens
            Bezeichnung VARCHAR(100) NOT NULL DEFAULT  '',                        -- Bezeichnung des Verfahren
            Beschreibung TEXT NOT NULL DEFAULT  '',                               -- Ausführlichere Beschreibung des Verfahrens
            Risikolevel INT NOT NULL DEFAULT 2,                                   -- Ergebnis der Risikoanalyse (1 = Niedrig, 2 = Mittel, 3 = Hoch)
            Fachabteilung VARCHAR(100) NOT NULL DEFAULT  '',                      -- Name der betreuenden Fachabteilung
            IVV VARCHAR(100) NOT NULL DEFAULT  '',                                -- Name der betreuenden IVV
            FachKontakt VARCHAR(8) NOT NULL DEFAULT  '',                          -- Nutzerkennung des fachlichen Ansprechpartners
            TechKontakt VARCHAR(8) NOT NULL DEFAULT  '',                          -- Nutzerkennung des technischen Ansprechpartners
            Ersteller VARCHAR(8) NOT NULL,                                        -- Nutzerkennung des Erstellers
            Bearbeitergruppe VARCHAR(8) NOT NULL DEFAULT  '',                     -- Nutzergruppe, die das Verfahren bearbeiten darf
            Status INT NOT NULL DEFAULT 0,                                        -- Aktueller Status des Verfahren (0 = In Bearbeitung, 2 = In Betrieb, 3 = Gelöscht)
            Sichtbarkeit INT NOT NULL DEFAULT 0,                                  -- Sichtbarkeit des Verfahrens für andere Personen
            JSON BLOB NOT NULL DEFAULT '{}',                                      -- Verfahrensinhalt als JSON kodiert
            DSBKommentar TEXT DEFAULT ''                                          -- Kommentarfeld für DSBs
        );",
        "CREATE TABLE rechtsgrundlagen (
            ID INTEGER PRIMARY KEY,    -- Eindeutige ID für die Rechtsgrundlage
            Artikel TEXT NOT NULL,     -- Artikelnummer laut Art. 6 DSGVO
            Beschreibung TEXT NOT NULL -- Gesetzestext
          );",
        "CREATE TABLE verfahren_historie (
            Verfahrens_Id INTEGER,                                         -- Die eindeutige ID eines Verfahrens
            Kennung VARCHAR(8) NOT NULL,                                   -- Nutzerkennung des bearbeitenden Nutzers
            Datum DATE DEFAULT (datetime(CURRENT_TIMESTAMP, 'localtime')), -- Aktuelles Datum
            PRIMARY KEY (Verfahrens_Id, Kennung, Datum),
            FOREIGN KEY (Verfahrens_Id) REFERENCES verfahren(ID) ON UPDATE CASCADE ON DELETE CASCADE
          );",
        "CREATE TABLE personen (
            Kennung VARCHAR(8) PRIMARY KEY ON CONFLICT IGNORE, -- Eindeutige Nutzerkennung
            Name TEXT,                                         -- Name der Person
            Anzeigename TEXT,                                  -- Anzeigename mit Name, Anschrift, Telefon, E-Mail
            Datenquelle VARCHAR(50) DEFAULT ''                 -- Hinweis auf die genutzte Quelle für die Daten
        );",
        "CREATE TABLE organisationseinheiten (
            Org_Id TEXT PRIMARY KEY ON CONFLICT IGNORE, -- ID der Organisationseinheit
            Name TEXT                                   -- Name der Organisationseinheit
        );",
        "CREATE TABLE ivven (
            Name TEXT PRIMARY KEY ON CONFLICT IGNORE -- Name der IVV
        );",
        "CREATE TABLE cpe (
            CPE TEXT PRIMARY KEY ON CONFLICT REPLACE, -- CPE-Nummer
            Name TEXT,                                -- Name des CPE Eintrags
            Typ TEXT                                  -- Typ des Eintrags (a für Applikation, o für Betriebssystem, h für Hardware)
        );",
        "CREATE TABLE toms (
            Identifier VARCHAR(10),            -- Unique identifier across one language, e.g. K.1
            Lang VARCHAR(2) DEFAULT 'de',      -- Language of entry
            Category TEXT NOT NULL,            -- Grouping for multiple TOMs
            Subcategory TEXT DEFAULT '',       -- Secondary level grouping
            Title TEXT DEFAULT '',             -- Short title for TOM
            Description TEXT NOT NULL,         -- Longer description
            Risklevel  INT NOT NULL DEFAULT 1, -- Risklevel where this is needed (1 = Low, 2 = Medium, 3 = High)
            Type INT NOT NULL DEFAULT 0,       -- 1 = Technical measure, 2 = organizational measure
            Mode INT NOT NULL DEFAULT 0,       -- 0 = processing activity (and fallback for IT process), 1 = IT process
            PRIMARY KEY (Identifier, Lang)
        );",
        "CREATE TABLE permissions (
            Process_ID INT,                 -- Process identifier
            ID TEXT NOT NULL,               -- User or group ID
            IsGroup INT NOT NULL DEFAULT 0, -- Is given ID a group? (0 = user ID, 1 = group ID)
            CanEdit INT NOT NULL DEFAULT 0, -- Can user/group edit? (0 = read only, 1 = full access)
            PRIMARY KEY (Process_ID, ID),
            FOREIGN KEY (Process_ID) REFERENCES verfahren(ID) ON UPDATE CASCADE ON DELETE CASCADE
        );",
        "CREATE TABLE suggestions (
            Field TEXT NOT NULL,                       -- Input field using this suggestion
            Lang VARCHAR(2) DEFAULT 'de',              -- Language
            Entry TEXT NOT NULL,                       -- Suggestion
            AdditionalInfo TEXT NOT NULL DEFAULT '{}', -- Additional space for informations (e.g. JSON-String)
            PRIMARY KEY (Field, Lang, Entry)
        );",
        "CREATE TABLE dependency (
            Dependent INT,                             -- Process identifier of dependent process
            Dependency INT,                            -- Process identifier of process the dependent depends on
            PRIMARY KEY (Dependent, Dependency),
            FOREIGN KEY (Dependent) REFERENCES verfahren(ID) ON UPDATE CASCADE ON DELETE CASCADE,
            FOREIGN KEY (Dependency) REFERENCES verfahren(ID) ON UPDATE CASCADE ON DELETE CASCADE
        );",
        "CREATE TABLE tomassignment (
          TOMID VARCHAR(10),            -- TOM identifier
          Lang VARCHAR(2) DEFAULT 'de', -- Language, part of primary key of TOM
          Tier INT,                     -- Tier (1 = processing activity, 2 = app tier, 3 = IT process)
          PRIMARY KEY (TOMID, Lang, Tier),
          FOREIGN KEY (TOMID, Lang) REFERENCES toms(Identifier, Lang) ON UPDATE CASCADE ON DELETE CASCADE
        );"
    ];

    /** @var mixed[] Rechtsgrundlagen für die Rechtsgrundlagen-Tabelle */
    const LAWS = [
        [0, 'Art. 6 (1) a) - Einwilligung', 'Die betroffene Person hat ihre Einwilligung zu der Verarbeitung der sie betreffenden personenbezogenen Daten für einen oder mehrere bestimmte Zwecke gegeben.'],
        [1, 'Art. 6 (1) b) - Vertragserfüllung', 'Die Verarbeitung ist für die Erfüllung eines Vertrags, dessen Vertragspartei die betroffene Person ist, oder zur Durchführung vorvertraglicher Maßnahmen erforderlich, die auf Anfrage der betroffenen Person erfolgen.'],
        [2, 'Art. 6 (1) c) - Rechtliche Verpflichtung', 'Die Verarbeitung ist zur Erfüllung einer rechtlichen Verpflichtung erforderlich, der der Verantwortliche unterliegt.'],
        [3, 'Art. 6 (1) d) - Lebenswichtige Interessen', 'Die Verarbeitung ist erforderlich, um lebenswichtige Interessen der betroffenen Person oder einer anderen natürlichen Person zu schützen.'],
        [4, 'Art. 6 (1) e) - Öffentliches Interesse', 'Die Verarbeitung ist für die Wahrnehmung einer Aufgabe erforderlich, die im öffentlichen Interesse liegt oder in Ausübung öffentlicher Gewalt erfolgt, die dem Verantwortlichen übertragen wurde.'],
        [5, 'Art. 6 (1) f) - Berechtigte Interessen', 'Die Verarbeitung ist zur Wahrung der berechtigten Interessen des Verantwortlichen oder eines Dritten erforderlich, sofern nicht die Interessen oder Grundrechte und Grundfreiheiten der betroffenen Person, die den Schutz personenbezogener Daten erfordern, überwiegen, insbesondere dann, wenn es sich bei der betroffenen Person um ein Kind handelt.'],
    ];

    /**
     * DBCon-Konstruktor; Stellt eine Verbindung zur Datenbank her und überprüft die Datenbank-Version.
     * Erstellt eine neue leere Datenbank, falls die Datenbank nicht existiert.
     *
     * @param string $directory (optional) Speicherpfad für die Datenbank-Datei
     * @return DBCon Neue DBCon Instanz
     * @throws PDOException
     * @throws Exception
     */
    function __construct($directory = NULL, $dbname = NULL) {
      $opt = [
          PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
          PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
          PDO::ATTR_PERSISTENT => TRUE,
          PDO::ATTR_EMULATE_PREPARES => FALSE
      ];

      if($directory) $this->path = $directory;

      if($dbname) $this->filename = $dbname;

      if(!file_exists($this->path . DIRECTORY_SEPARATOR . $this->filename)) {
        trigger_error("[SecDoc] DBCon.class.php -> Datenbank-Datei existiert nicht! Leere Datenbank wird erstellt!");
        error_log("[SecDoc] DBCon.class.php -> Datenbank-Datei existiert nicht! Leere Datenbank wird erstellt!");
        $this->pdo = new PDO('sqlite:' . $this->path . DIRECTORY_SEPARATOR . $this->filename, '', '', $opt);
        $this->pdo->exec("BEGIN;");

        # Schlüsselreferenzen einschalten
        $this->pdo->exec("PRAGMA foreign_keys = ON;");

        # Tabellen erstellen
        foreach(self::TABLES as $table) {
          $this->pdo->exec($table);
        }

        $this->pdo->exec("DROP TABLE IF EXISTS rechtsgrundlagen;");

        # DB-Version setzen
        $this->pdo->exec("PRAGMA user_version = " . self::DBVERSION . ";");
        $this->pdo->exec("COMMIT;");
        $this->pdo = NULL;
      }

      $this->pdo = new PDO('sqlite:' . $this->path . DIRECTORY_SEPARATOR . $this->filename, '', '', $opt);

      # Schlüsselreferenzen einschalten
      $this->pdo->exec("PRAGMA foreign_keys = ON;");

      # Check table version
      $db_version = $this->pdo->query("PRAGMA user_version")->fetchColumn();
      trigger_error("[SecDoc] DBCon.class.php -> Datenbank Version $db_version geöffnet.");
      if(self::DBVERSION != $db_version) {
        if($db_version == 2) {
          trigger_error("[SecDoc] DBCon.class.php -> Aktualisiere Datenbank von Version $db_version zu " . self::DBVERSION . "!");
          error_log("[SecDoc] DBCon.class.php -> Aktualisiere Datenbank von Version $db_version zu " . self::DBVERSION . "!");
          $this->pdo->exec("BEGIN;");
          $this->pdo->exec("PRAGMA foreign_keys = ON;");
          $this->pdo->exec("ALTER TABLE verfahren RENAME TO verfahren2;");
          $this->pdo->exec("ALTER TABLE historie RENAME TO historie2;");
          $this->pdo->exec(self::TABLES[0]);
          $this->pdo->exec(self::TABLES[2]);
          $this->pdo->exec("INSERT INTO verfahren (ID, Bezeichnung, Beschreibung, Fachabteilung, IVV, FachKontakt, TechKontakt, Ersteller, Status, Sichtbarkeit, JSON) SELECT ID, Bezeichnung, Beschreibung, Fachabteilung, IVV, FachKontakt, TechKontakt, Bearbeiter, Status, Sichtbarkeit, JSON from verfahren2;");
          $this->pdo->exec("INSERT INTO historie (Verfahren, Kennung, Datum) SELECT Verfahren, Kennung, Datum from historie2;");
          $this->pdo->exec("DROP TABLE verfahren2;");
          $this->pdo->exec("DROP TABLE historie2;");
          $this->pdo->exec(self::TABLES[3]);
          $this->pdo->exec(self::TABLES[4]);
          $this->pdo->exec(self::TABLES[5]);
          $this->pdo->exec("PRAGMA user_version = 3;");
          $this->pdo->exec("COMMIT;");
        }
        else if($db_version == 3) {
          trigger_error("[SecDoc] DBCon.class.php -> Aktualisiere Datenbank von Version $db_version zu " . self::DBVERSION . "!");
          error_log("[SecDoc] DBCon.class.php -> Aktualisiere Datenbank von Version $db_version zu " . self::DBVERSION . "!");
          $this->pdo->exec("BEGIN;");
          $this->pdo->exec("PRAGMA foreign_keys = ON;");
          $this->pdo->exec(self::TABLES[2]);
          $this->pdo->exec("INSERT INTO verfahren_historie (Verfahrens_Id, Kennung, Datum) SELECT Verfahren, Kennung, Datum from historie;");
          $this->pdo->exec("DROP TABLE historie;");
          $this->pdo->exec("ALTER TABLE organisationseinheiten RENAME TO organisationseinheiten2;");
          $this->pdo->exec("ALTER TABLE ivven RENAME TO ivven2;");
          $this->pdo->exec(self::TABLES[4]);
          $this->pdo->exec(self::TABLES[5]);
          $this->pdo->exec("INSERT INTO organisationseinheiten (Org_Id, Name) SELECT Organisationseinheit, Organisationseinheit from organisationseinheiten2;");
          $this->pdo->exec("INSERT INTO ivven (Name) SELECT IVV from ivven2;");
          $this->pdo->exec("DROP TABLE organisationseinheiten2;");
          $this->pdo->exec("DROP TABLE ivven2;");
          $this->pdo->exec(self::TABLES[6]);
          $this->pdo->exec("PRAGMA user_version = 4;");
          $this->pdo->exec("COMMIT;");
        }
        else if($db_version == 4) {
          trigger_error("[SecDoc] DBCon.class.php -> Aktualisiere Datenbank von Version $db_version zu " . self::DBVERSION . "!");
          error_log("[SecDoc] DBCon.class.php -> Aktualisiere Datenbank von Version $db_version zu " . self::DBVERSION . "!");
          $this->pdo->exec("BEGIN;");
          $this->pdo->exec("ALTER TABLE verfahren ADD COLUMN DSBKommentar TEXT DEFAULT '';");
          $this->pdo->exec("PRAGMA user_version = 5;");
          $this->pdo->exec("COMMIT;");
        }
        else if($db_version == 5) {
          trigger_error("[SecDoc] DBCon.class.php -> Aktualisiere Datenbank von Version $db_version zu " . self::DBVERSION . "!");
          error_log("[SecDoc] DBCon.class.php -> Aktualisiere Datenbank von Version $db_version zu " . self::DBVERSION . "!");
          $this->pdo->beginTransaction();
          $this->pdo->exec("ALTER TABLE verfahren ADD COLUMN Risikolevel INT NOT NULL DEFAULT 2;");
          $this->pdo->exec("ALTER TABLE verfahren ADD COLUMN Typ INT NOT NULL DEFAULT 1;");
          $this->pdo->exec(self::TABLES[7]);
          $this->pdo->exec(self::TABLES[8]);
          $this->pdo->exec(self::TABLES[9]);

          $sth = $this->pdo->prepare('SELECT ID, Bearbeitergruppe, JSON FROM verfahren WHERE NOT Status = 3;');
          $sth2 = $this->pdo->prepare('INSERT INTO permissions (Process_ID, ID, IsGroup, CanEdit) VALUES (?, ?, 1, 1);');
          $sth3 = $this->pdo->prepare('UPDATE verfahren SET JSON = ? WHERE ID = ?;');
          $sth->execute();
          foreach($sth->fetchAll() as $entry) {
            $parsedJSON = json_decode($entry['JSON'], true);

            # Bearbeitergruppe in neue Tabelle eintragen
            if(!empty($entry['Bearbeitergruppe'])) {
              $sth2->execute([$entry['ID'], $entry['Bearbeitergruppe']]);
              $parsedJSON['meta_gruppen_kennung'] = [$entry['Bearbeitergruppe']];
              $parsedJSON['meta_gruppen_name'] = [$entry['Bearbeitergruppe']];
              $parsedJSON['meta_gruppen_schreiben'] = ["1"];
            }

            # Rechtsgrundlagen ersetzen durch Kürzel
            if(is_array($parsedJSON['daten_grundlagen_bezeichnung']) && count($parsedJSON['daten_grundlagen_bezeichnung']) > 0) {
              for($c = 0; $c < count($parsedJSON['daten_grundlagen_bezeichnung']); $c++) {
                $parsedJSON['daten_grundlagen_bezeichnung'][$c] = self::LAWS[$parsedJSON['daten_grundlagen_bezeichnung'][$c]][1];
              }
            }

            $sth3->execute([json_encode($parsedJSON), $entry['ID']]);
          }

          $this->pdo->exec("DROP TABLE IF EXISTS rechtsgrundlagen;");
          $this->pdo->exec("PRAGMA user_version = 6;");
          $this->pdo->commit();
        }
        else if($db_version == 6) {
          trigger_error("[SecDoc] DBCon.class.php -> Aktualisiere Datenbank von Version $db_version zu " . self::DBVERSION . "!");
          error_log("[SecDoc] DBCon.class.php -> Aktualisiere Datenbank von Version $db_version zu " . self::DBVERSION . "!");

          $this->pdo->beginTransaction();
          $this->pdo->exec(self::TABLES[10]);
          $this->pdo->exec("ALTER TABLE toms ADD COLUMN Mode INT NOT NULL DEFAULT 0;");
          $this->pdo->exec("UPDATE verfahren SET Typ = 1 WHERE Typ = 0;");
          $this->pdo->exec("PRAGMA user_version = 7;");
          $this->pdo->commit();
        }
        else if($db_version == 7) {
          trigger_error("[SecDoc] DBCon.class.php -> Aktualisiere Datenbank von Version $db_version zu " . self::DBVERSION . "!");
          error_log("[SecDoc] DBCon.class.php -> Aktualisiere Datenbank von Version $db_version zu " . self::DBVERSION . "!");

          $this->pdo->beginTransaction();
          $this->pdo->exec(self::TABLES[11]);          
          $this->pdo->exec("PRAGMA user_version = 8;");
          $this->pdo->commit();
        }
        else {
          throw new Exception("Datenbank kann nicht genutzt werden, da die Version nicht übereinstimmt und nicht aktualisiert werden kann! (Ist: $db_version - Soll: " . self::DBVERSION . ")");
        }
      }

      $this->connected = TRUE;
    }

    /**
     * Prüft, ob eine Datenbank-Verbindung besteht.
     *
     * @return bool True bei bestehender Verbindung, sonst FALSE
     */
    public function isConnected(): bool {
      return $this->connected;
    }

    /**
     * Fügt ein neues Verfahren der DB hinzu.
     *
     * @param string $userId        Aktuell eingeloggter Nutzer/Bearbeiter
     * @param int    $verfahrensId  ID des neuen Verfahrens
     * @param int    $typ           Typ des Eintrags (Verarbeitungstätigkeit oder IT-Verfahren)
     * @param string $bezeichnung   Bezeichnung des Verfahrens
     * @param string $datum         Einführungsdatum
     * @param string $beschreibung  Ausführliche Beschreibung
     * @param int    $risikolevel   Ergebnis der Risikoanalyse
     * @param string $fachabteilung Zuständige Fachabteilung
     * @param string $ivv           Zuständige IVV
     * @param string $fachkontakt   Fachlicher Ansprechpartner
     * @param string $techkontakt   Technischer Ansprechpartner
     * @param string $json          JSON-kodierte Informationen zum Verfahren
     * @return int Gibt die ID des neuen Verfahrens zurück
     * @throws PDOException
     * @throws Exception
     */
    public function addVerfahren($userId, $verfahrensId, $typ, $bezeichnung, $datum, $beschreibung, $risikolevel, $fachabteilung, $ivv, $fachkontakt, $techkontakt, $json): int {
      if($this->isConnected()) {
        # Neues Verfahren hinzufügen
        $sth = $this->pdo->prepare('INSERT INTO verfahren (ID, Typ, Bezeichnung, Erstelldatum, Beschreibung, Risikolevel, Fachabteilung, IVV, FachKontakt, TechKontakt, Ersteller, JSON) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);');
        $sth->execute(array(
            $verfahrensId,
            $typ,
            $bezeichnung,
            $datum,
            $beschreibung,
            $risikolevel,
            $fachabteilung,
            $ivv,
            $fachkontakt,
            $techkontakt,
            $userId,
            $json
        ));

        ob_start();
        $sth->debugDumpParams();
        $sqlDump = ob_get_clean();
        print "DBCon.class.php -> addVerfahren() Execute: $sqlDump";

        # Überprüfen, ob das Verfahren wirklich hinzugefügt wurde
        $changedRows = $sth->rowCount();
        if($changedRows !== 1) {
          throw new Exception("DBCon.class.php -> Fehler beim Hinzufügen eines Verfahrens! (Fehler: Unbekannter Fehler - Anzahl geänderter Reihen: $changedRows)");
        }

        # ID des neuen Verfahrens auslesen
        $sth = $this->pdo->prepare('SELECT last_insert_rowid();');
        $sth->execute();

        ob_start();
        $sth->debugDumpParams();
        $sqlDump = ob_get_clean();
        print "DBCon.class.php -> addVerfahren() Execute: $sqlDump";

        $verfahrensId = $sth->fetch()['last_insert_rowid()'];

        if($verfahrensId === FALSE || !is_numeric($verfahrensId)) {
          throw new Exception("DBCon.class.php -> Fehler beim Hinzufügen eines Verfahrens! (Fehler: ID des neuen Verfahrens konnte nicht abgefragt werden (Wert: $verfahrensId))");
        }

        $this->addHistorie($verfahrensId, $userId);

        return $verfahrensId;
      }
      else {
        throw new Exception("DBCon.class.php -> Keine aktive Datenbank-Verbindung!");
      }
    }

    /**
     * Holt die Nutzerkennung des TechKontakts aus einem Verfahren.
     *
     * @param  int $verfahrensId ID eines Verfahrens
     * @return string Nutzerkennung
     */
    public function getTechKontakt($verfahrensId) {
      if($this->isConnected()) {
        $sth = $this->pdo->prepare("SELECT TechKontakt FROM verfahren WHERE ID = ? LIMIT 1;");
        $sth->execute([$verfahrensId]);

        ob_start();
        $sth->debugDumpParams();
        $sqlDump = ob_get_clean();
        print "DBCon.class.php -> getTechKontakt() Execute: $sqlDump";

        $result = $sth->fetch(PDO::FETCH_BOTH);
        return !empty($result) ? $result[0] : '';
      }
      else {
        throw new Exception("DBCon.class.php -> Keine aktive Datenbank-Verbindung!");
      }
    }


   /**
    * Holt die Nutzerkennung des FachKontakts aus einem Verfahren.
    *
    * @param  int $verfahrensId ID eines Verfahrens
    * @return string Nutzerkennung
    */
    public function getFachKontakt($verfahrensId) {
      if($this->isConnected()) {
        $sth = $this->pdo->prepare("SELECT FachKontakt FROM verfahren WHERE ID = ? LIMIT 1;");
        $sth->execute([$verfahrensId]);

        ob_start();
        $sth->debugDumpParams();
        $sqlDump = ob_get_clean();
        print "DBCon.class.php -> getTechKontakt() Execute: $sqlDump";

        $result = $sth->fetch(PDO::FETCH_BOTH);
        return !empty($result) ? $result[0] : '';
      }
      else {
        throw new Exception("DBCon.class.php -> Keine aktive Datenbank-Verbindung!");
      }
    }

    /**
     * Holt die Nutzerkennung des FachKontakts aus einem Verfahren.
     *
     * @param  int $verfahrensId ID eines Verfahrens
     * @return array Generelle Infos über eine Dokumentation ['ID' => 123, 'Typ' => 1, 'Bezeichnung' => 'Test Verfahren', 'Beschreibung' => 'Das ist ein Verfahren zum Testen']
     */
     public function getVerfahrenInfo($verfahrensId) {
       if($this->isConnected()) {
         $sth = $this->pdo->prepare("SELECT ID, Typ, Bezeichnung, Beschreibung, MAX(Datum) AS Aktualisierung FROM verfahren LEFT JOIN verfahren_historie ON verfahren.ID = verfahren_historie.Verfahrens_Id  WHERE ID = ? GROUP BY ID LIMIT 1;");
         $sth->execute([$verfahrensId]);

         ob_start();
         $sth->debugDumpParams();
         $sqlDump = ob_get_clean();
         print "DBCon.class.php -> getVerfahrenInfo() Execute: $sqlDump";

         $result = $sth->fetch(PDO::FETCH_BOTH);
         return !empty($result) ? $result : [];
       }
       else {
         throw new Exception("DBCon.class.php -> Keine aktive Datenbank-Verbindung!");
       }
     }

    /**
     * Listet alle Verfahren auf, die der Nutzer mit Kennung $userId bearbeiten kann.
     *
     * @param string $userId     Nutzerkennung des ausführenden Nutzers
     * @param array  $userGroups Gruppen des ausführenden Nutzers
     * @param string $search     (optional) Filter zur Suche nach bestimmten Verfahren (nutzt Bezeichnung)
     * @return array Gibt die Liste der Verfahren zurück
     * @throws PDOException
     * @throws Exception
     */
    public function listVerfahrenOwn($userId, $userGroups, $search = '') {
      if($this->isConnected()) {
        $sth = $this->pdo->prepare('SELECT ID, Typ, Erstelldatum, Bezeichnung, Beschreibung, Fachabteilung, Status, Ersteller, FachKontakt, TechKontakt, Bearbeitergruppe, Sichtbarkeit, IFNULL(Name, verfahren_historie.Kennung) AS LetzterBearbeiter, IFNULL(Anzeigename, "") AS BearbeiterDetails, MAX(Datum) AS Aktualisierung '
         . 'FROM verfahren LEFT JOIN verfahren_historie ON verfahren.ID = verfahren_historie.Verfahrens_Id LEFT JOIN personen ON verfahren_historie.Kennung = personen.Kennung '
         . 'WHERE NOT Status = 3 AND (Ersteller = ? OR TechKontakt = ? OR FachKontakt = ? '
         . 'OR ID in (SELECT Process_ID FROM permissions WHERE CanEdit = 1 AND ((IsGroup = 0 AND ID = ?) OR (IsGroup = 1 AND ID in (' . implode(', ', array_fill(0, count($userGroups), '?')) . ')))))' . (!empty($search) ? ' AND Bezeichnung LIKE ?' : '') . ' GROUP BY ID ORDER BY Bezeichnung COLLATE NOCASE;');

        $sth->execute(!empty($search) ? array_merge(array_fill(0, 4, $userId), $userGroups, ['%' . $search . '%']) : array_merge(array_fill(0, 4, $userId), $userGroups));


        ob_start();
        $sth->debugDumpParams();
        $sqlDump = ob_get_clean();
        print "DBCon.class.php -> listVerfahrenOwn() Execute: $sqlDump";

        $result = array();
        foreach($sth->fetchAll() as $entry) {
          $entry['Editierbar'] = TRUE;
          $entry['Löschbar'] = TRUE;
          array_push($result, $entry);
        }
        return $result;
      }
      else {
        throw new Exception("DBCon.class.php -> Keine aktive Datenbank-Verbindung!");
      }
    }

    /**
     * Listet alle Verfahren auf, die in Betrieb sind und für den Nutzer freigegeben sind
     *
     * @param string $userId     Nutzerkennung des ausführenden Nutzers
     * @param array  $userGroups Gruppen des ausführenden Nutzers
     * @param string $search     (optional) Filter zur Suche nach bestimmten Verfahren (nutzt Bezeichnung)
     * @return array Gibt die Liste der Verfahren zurück
     * @throws PDOException
     * @throws Exception
     */
    public function listVerfahrenShared($userId, $userGroups, $search = '') {
      if($this->isConnected()) {
        $result = array();

        $sth = $this->pdo->prepare('SELECT ID, Typ, Erstelldatum, Bezeichnung, Beschreibung, Fachabteilung, Status, Sichtbarkeit, MAX(Datum) AS Aktualisierung '
         . 'FROM verfahren LEFT JOIN verfahren_historie ON verfahren.ID = verfahren_historie.Verfahrens_Id '
         . 'WHERE NOT Status = 3 AND NOT Ersteller = ? AND NOT TechKontakt = ? AND NOT FachKontakt = ? '
         . 'AND ID in (SELECT Process_ID FROM permissions WHERE CanEdit = 0 AND ((IsGroup = 0 AND ID = ?) OR (IsGroup = 1 AND ID in (' . implode(', ', array_fill(0, count($userGroups), '?')) . '))))' . (!empty($search) ? ' AND Bezeichnung LIKE ?' : '') . ' GROUP BY ID ORDER BY Bezeichnung COLLATE NOCASE;');

        $sth->execute(!empty($search) ? array_merge(array_fill(0, 4, $userId), $userGroups, ['%' . $search . '%']) : array_merge(array_fill(0, 4, $userId), $userGroups));

        ob_start();
        $sth->debugDumpParams();
        $sqlDump = ob_get_clean();
        print "DBCon.class.php -> listVerfahrenShared() Execute: $sqlDump";

        foreach($sth->fetchAll() as $entry) {
          $entry['Editierbar'] = FALSE;
          array_push($result, $entry);
        }

        return $result;
      }
      else {
        throw new Exception("DBCon.class.php -> Keine aktive Datenbank-Verbindung!");
      }
    }

    /**
     * Listet alle Verfahren auf für die Datenschutzbeauftragten zur Einsicht.
     *
     * @param string $search (optional) Filter zur Suche nach bestimmten Verfahren (nutzt Bezeichnung)
     * @return array Gibt die Liste der Verfahren zurück
     * @throws PDOException
     * @throws Exception
     */
    public function listVerfahrenDSB($search = '') {
      if($this->isConnected()) {
        $result = array();
        $sth = $this->pdo->prepare('SELECT ID, Typ, Bezeichnung, Beschreibung, Erstelldatum, Fachabteilung, IFNULL(person1.Anzeigename, verfahren.FachKontakt) AS FachKontakt, IFNULL(person2.Anzeigename, verfahren.TechKontakt) AS TechKontakt, Status, Sichtbarkeit, DSBKommentar, MAX(Datum) AS Aktualisierung '
                . 'FROM verfahren LEFT JOIN verfahren_historie ON verfahren.ID = verfahren_historie.Verfahrens_Id LEFT JOIN personen AS person1 ON verfahren.FachKontakt = person1.Kennung LEFT JOIN personen AS person2 ON verfahren.TechKontakt = person2.Kennung '
                . 'WHERE NOT Status = 3' . (!empty($search) ? ' AND Bezeichnung LIKE ?' : '') . ' GROUP BY ID ORDER BY Bezeichnung COLLATE NOCASE;');
        $sth->execute(!empty($search) ? ['%' . $search . '%'] : []);

        ob_start();
        $sth->debugDumpParams();
        $sqlDump = ob_get_clean();
        print "DBCon.class.php -> listVerfahrenDSB() Execute: $sqlDump";

        $result = $sth->fetchAll();

        return $result;
      }
      else {
        throw new Exception("DBCon.class.php -> Keine aktive Datenbank-Verbindung!");
      }
    }

    /**
     * Liest ein Verfahren mit der übergebenen ID aus.
     *
     * @param int    $verfahrensId ID des Verfahrens
     * @param string $userId       Nutzerkennung des ausführenden Nutzers
     * @param array  $userGroups   Gruppen des ausführenden Nutzers
     * @param bool   $userIsDSB    (optional) Gibt an, ob der ausführende Nutzer ein DSB ist (Zugriff auf alle Verfahren)
     * @return array Gibt den Inhalt des Verfahrens zurück
     * @throws PDOException
     * @throws Exception
     */
    public function getVerfahren($verfahrensId, $userId, $userGroups, $userIsDSB = FALSE) {
      if($this->isConnected()) {
        if($userIsDSB) {
          $permLevel = 2;
          $sth = $this->pdo->prepare('SELECT ID, Typ, Erstelldatum, Bezeichnung, Beschreibung, Fachabteilung, IVV, FachKontakt, TechKontakt, Ersteller, Bearbeitergruppe, Status, Sichtbarkeit, Kennung AS BearbeitetVon, MAX(Datum) AS Aktualisierung, JSON FROM verfahren LEFT JOIN verfahren_historie ON verfahren.ID = verfahren_historie.Verfahrens_Id  WHERE ID = ? AND NOT Status = 3 GROUP BY ID;');
          $sth->execute([$verfahrensId]);
        }
        else {
          $permLevel = $this->getPermissionLevel($verfahrensId, $userId, $userGroups);
          $sql = 'SELECT ID, Typ, Erstelldatum, Bezeichnung, Beschreibung, Fachabteilung, IVV, FachKontakt, TechKontakt, Ersteller, Bearbeitergruppe, Status, Sichtbarkeit, Kennung AS BearbeitetVon, MAX(Datum) AS Aktualisierung, JSON '
          . 'FROM verfahren LEFT JOIN verfahren_historie ON verfahren.ID = verfahren_historie.Verfahrens_Id  '
          . 'WHERE ID = ? AND NOT Status = 3 AND (Ersteller = ? OR TechKontakt = ? OR FachKontakt = ? '
          . 'OR ID in (SELECT Process_ID FROM permissions WHERE (IsGroup = 0 AND ID = ?) OR (IsGroup = 1 AND ID in (' . implode(', ', array_fill(0, count($userGroups), '?')) . ')))) GROUP BY ID;';
          $sth = $this->pdo->prepare($sql);
          $sth->execute(array_merge([$verfahrensId], array_fill(0, 4, $userId), $userGroups));
        }

        ob_start();
        $sth->debugDumpParams();
        $sqlDump = ob_get_clean();
        print "DBCon.class.php -> getVerfahren() Execute: $sqlDump";

        $result = array();
        foreach($sth->fetchAll() as $entry) {
          if($permLevel === 2) {
            $entry['Editierbar'] = TRUE;
          }
          else {
            $entry['Editierbar'] = FALSE;
          }
          array_push($result, $entry);
        }
        return $result;
      }
      else {
        throw new Exception("DBCon.class.php -> Keine aktive Datenbank-Verbindung!");
      }
    }

    /**
     * Aktualisiert ein Verfahren mit der übergebenen ID.
     *
     * @param int    $verfahrensId  ID des Verfahrens
     * @param string $userId        Nutzerkennung des ausführenden Nutzers
     * @param array  $userGroups    Gruppen des ausführenden Nutzers
     * @param int    $typ           Typ des Eintrags (Verarbeitungstätigkeit oder IT-Verfahren)
     * @param string $bezeichnung   Bezeichnung des Verfahrens
     * @param string $datum         Einführungsdatum
     * @param string $beschreibung  Ausführliche Beschreibung
     * @param int    $risikolevel   Ergebnis der Risikoanalyse
     * @param string $fachabteilung Zuständige Fachabteilung
     * @param string $ivv           Zuständige IVV
     * @param string $fachkontakt   Fachlicher Ansprechpartner
     * @param string $techkontakt   Technischer Ansprechpartner
     * @param int    $sichtbarkeit  Sichtbarkeit des Verfahrens (0=Nur Ersteller/Fach. Ansprechpartner/Tech. Ansprechpartner, 3=Gesamte WWU)
     * @param string $json          JSON-kodierte Informationen zum Verfahren
     * @param bool   $userIsDSB     (optional) Gibt an, ob der ausführende Nutzer ein DSB ist (Zugriff auf alle Verfahren)
     * @return bool Wenn das Verfahren aktualisiert wurde TRUE; Falls kein Verfahren aktualisiert wurde FALSE
     * @throws PDOException
     * @throws Exception
     */
    public function updateVerfahren($verfahrensId, $userId, $userGroups, $typ, $bezeichnung, $datum, $beschreibung, $risikolevel, $fachabteilung, $ivv, $fachkontakt, $techkontakt, $sichtbarkeit, $json, $userIsDSB = FALSE): bool {
      if($this->isConnected()) {
        if($userIsDSB) {
          $sth = $this->pdo->prepare('UPDATE verfahren SET
            Typ = ?,
            Bezeichnung = ?,
            Erstelldatum = ?,
            Beschreibung = ?,
            Risikolevel = ?,
            Fachabteilung = ?,
            IVV = ?,
            FachKontakt = ?,
            TechKontakt = ?,
            Sichtbarkeit = ?,
            JSON = ?
            WHERE ID = ?
          ;');

          $sth->execute(array(
              $typ,
              $bezeichnung,
              $datum,
              $beschreibung,
              $risikolevel,
              $fachabteilung,
              $ivv,
              $fachkontakt,
              $techkontakt,
              $sichtbarkeit,
              $json,
              $verfahrensId
          ));
        }
        else {
          $sth = $this->pdo->prepare('UPDATE verfahren SET
            Typ = ?,
            Bezeichnung = ?,
            Erstelldatum = ?,
            Beschreibung = ?,
            Risikolevel = ?,
            Fachabteilung = ?,
            IVV = ?,
            FachKontakt = ?,
            TechKontakt = ?,
            Sichtbarkeit = ?,
            JSON = ?
            WHERE ID = ? AND (Ersteller = ? OR FachKontakt = ? OR TechKontakt = ? OR ID in (SELECT Process_ID FROM permissions WHERE CanEdit = 1 AND ((IsGroup = 0 AND ID = ?) OR (IsGroup = 1 AND ID in (' . implode(', ', array_fill(0, count($userGroups), '?')) . ')))))
          ;');

          $sth->execute(array_merge(array(
              $typ,
              $bezeichnung,
              $datum,
              $beschreibung,
              $risikolevel,
              $fachabteilung,
              $ivv,
              $fachkontakt,
              $techkontakt,
              $sichtbarkeit,
              $json,
              $verfahrensId,
              $userId,
              $userId,
              $userId,
              $userId
          ), $userGroups));
        }


        ob_start();
        $sth->debugDumpParams();
        $sqlDump = ob_get_clean();
        print "DBCon.class.php -> updateVerfahren() Execute: $sqlDump";

        $changedRows = $sth->rowCount();

        if($changedRows === 1) {
          $this->addHistorie($verfahrensId, $userId);
          return TRUE; // Falls genau ein Verfahren geändert wurde
        }

        if($changedRows === 0) return FALSE; // Falls nichts geändert werden konnte

        throw new Exception("DBCon.class.php -> Fehler beim Aktualisieren eines Verfahrens! (Fehler: Unbekannter Fehler - Anzahl geänderter Reihen: $changedRows)");
      }
      else {
        throw new Exception("DBCon.class.php -> Keine aktive Datenbank-Verbindung!");
      }
    }

    /**
     * Fragt den aktuellen Status eines Verfahrens ab.
     *
     * @param int    $verfahrensId ID des Verfahrens
     * @param string $userId       Nutzerkennung des ausführenden Nutzers
     * @param array  $userGroups   Gruppen des ausführenden Nutzers
     * @param bool   $userIsDSB    (optional) Gibt an, ob der ausführende Nutzer ein DSB ist (Zugriff auf alle Verfahren)
     * @return int Gibt im Erfolgsfall den Status als numerischen Wert zurück; sonst -1
     * @throws PDOException
     * @throws Exception
     */
    public function getStatus($verfahrensId, $userId, $userGroups, $userIsDSB = FALSE): int {
      if($this->isConnected()) {
        if($userIsDSB) {
          $sth = $this->pdo->prepare('SELECT Status FROM verfahren WHERE ID = ? LIMIT 1;');
          $sth->execute([$verfahrensId]);
        }
        else {
          $sth = $this->pdo->prepare('SELECT Status FROM verfahren WHERE ID = ? AND (Ersteller = ? OR FachKontakt = ? OR TechKontakt = ? OR ID in (SELECT Process_ID FROM permissions WHERE ((IsGroup = 0 AND ID = ?) OR (IsGroup = 1 AND ID in (' . implode(', ', array_fill(0, count($userGroups), '?')) . '))))) LIMIT 1;');
          $sth->execute(array_merge(array($verfahrensId, $userId, $userId, $userId, $userId), $userGroups));
        }

        $result = $sth->fetch();

        ob_start();
        $sth->debugDumpParams();
        $sqlDump = ob_get_clean();
        print "DBCon.class.php -> getStatus() Execute: $sqlDump";

        if(empty($result)) return -1;

        return intval($result['Status']);
      }
      else {
        throw new Exception("DBCon.class.php -> Keine aktive Datenbank-Verbindung!");
      }
    }

    /**
     * Aktualisiert den Status des Verfahrens.
     *
     * @param int    $verfahrensId ID des Verfahrens
     * @param string $userId       Nutzerkennung des ausführenden Nutzers
     * @param array  $userGroups   Gruppen des ausführenden Nutzers
     * @param int    $status       Bearbeitungsstatus des Verfahrens (0=In Bearbeitung, 1=Zur Freigabe, 2=In Betrieb)
     * @param bool   $userIsDSB    (optional) Gibt an, ob der ausführende Nutzer ein DSB ist (Zugriff auf alle Verfahren)
     * @return bool Wenn das Verfahren aktualisiert wurde TRUE; Falls kein Verfahren aktualisiert wurde FALSE
     * @throws PDOException
     * @throws Exception
     */
    public function updateStatus($verfahrensId, $userId, $userGroups, $status, $userIsDSB = FALSE): bool {
      if($this->isConnected()) {
        if($userIsDSB) {
          $sth = $this->pdo->prepare('UPDATE verfahren SET Status = ? WHERE id = ?;');

          $success = $sth->execute([$status, $verfahrensId]);
        }
        else {
          $sth = $this->pdo->prepare('UPDATE verfahren SET Status = ? WHERE id = ? AND (Ersteller = ? OR FachKontakt = ? OR TechKontakt = ? OR ID in (SELECT Process_ID FROM permissions WHERE CanEdit = 1 AND ((IsGroup = 0 AND ID = ?) OR (IsGroup = 1 AND ID in (' . implode(', ', array_fill(0, count($userGroups), '?')) . ')))));');

          $success = $sth->execute(array_merge(array(
              $status,
              $verfahrensId,
              $userId,
              $userId,
              $userId,
              $userId
          ), $userGroups));
        }


        $changedRows = $sth->rowCount();

        ob_start();
        $sth->debugDumpParams();
        $sqlDump = ob_get_clean();
        print "DBCon.class.php -> updateStatus() Execute: $sqlDump";

        if($changedRows === 1) return TRUE; // Falls genau ein Verfahren geändert wurde

        if($changedRows === 0) return FALSE; // Falls nichts geändert werden konnte

        throw new Exception("DBCon.class.php -> Fehler beim Aktualisieren des Status eines Verfahrens! (Fehler: Unbekannter Fehler - Anzahl geänderter Reihen: $changedRows)");
      }
      else {
        throw new Exception("DBCon.class.php -> Keine aktive Datenbank-Verbindung!");
      }
    }

    /**
     * Aktualisiert den DSB-Kommentar zu einem Verfahren.
     *
     * @param int    $verfahrensId ID des Verfahrens
     * @param string $kommentar    Neuer Kommentar
     * @return bool Wenn der Kommentar aktualisiert wurde TRUE, sonst FALSE
     * @throws PDOException
     * @throws Exception
     */
    public function updateDSBKommentar($verfahrensId, $kommentar): bool {
      if($this->isConnected()) {
        $sth = $this->pdo->prepare('UPDATE verfahren SET DSBKommentar = ? WHERE id = ?;');
        $sth->execute([$kommentar, $verfahrensId]);

        $changedRows = $sth->rowCount();

        ob_start();
        $sth->debugDumpParams();
        $sqlDump = ob_get_clean();
        print "DBCon.class.php -> updateDSBKommentar() Execute: $sqlDump";

        if($changedRows === 1) return TRUE; // Falls genau ein Verfahren geändert wurde

        if($changedRows === 0) return FALSE; // Falls nichts geändert werden konnte

        throw new Exception("DBCon.class.php -> Fehler beim Aktualisieren des DSB-Kommentars! (Fehler: Unbekannter Fehler - Anzahl geänderter Reihen: $changedRows)");
      }
      else {
        throw new Exception("DBCon.class.php -> Keine aktive Datenbank-Verbindung!");
      }
    }

    /**
     * Überprüft, ob ein Verfahren mit der übergebenen ID existiert.
     *
     * @param int $verfahrensId   ID eines Verfahrens
     * @return bool TRUE falls das Verfahren existiert, sonst FALSE
     * @throws PDOException
     * @throws Exception
     */
    public function checkVerfahren($verfahrensId): bool {
      if($this->isConnected()) {
        $sth = $this->pdo->prepare('SELECT ID FROM verfahren WHERE ID = ? LIMIT 1;');
        $sth->execute(array($verfahrensId));
        $result = $sth->fetch();

        ob_start();
        $sth->debugDumpParams();
        $sqlDump = ob_get_clean();
        print "DBCon.class.php -> checkVerfahren() Execute: $sqlDump";

        if(!empty($result)) return TRUE;
        return FALSE;
      }
      else {
        throw new Exception("DBCon.class.php -> Keine aktive Datenbank-Verbindung!");
      }
    }

    /**
     * Löscht das Verfahren mit der übergebenen ID.
     *
     * @param int    $verfahrensId ID des zu löschenden Verfahrens
     * @param string $userId       Nutzerkennung des ausführenden Nutzers
     * @param array  $userGroups   Gruppen des ausführenden Nutzers
     * @param  bool  $userIsDSB    (optional) Gibt an, ob der ausführende Nutzer ein DSB ist (Zugriff auf alle Verfahren)
     * @return bool Gibt im Erfolgsfall TRUE zurück; FALSE falls das Verfahren nicht gefunden wurde oder keine Berechtigung vorhanden ist
     * @throws PDOException
     * @throws Exception
     */
    public function delVerfahren($verfahrensId, $userId, $userGroups, $userIsDSB = FALSE): bool {
      if($this->isConnected()) {

        if(!$userIsDSB && $this->getPermissionLevel($verfahrensId, $userId, $userGroups) < 2) {
          return FALSE;
        }

        # Abhängigkeiten entfernen
        if(!$this->updateDependency($verfahrensId, [], $userId, $userGroups, $userIsDSB)) return FALSE;

        # Das Verfahren wird erstmal nur als gelöscht markiert
        $sth = $this->pdo->prepare('UPDATE verfahren SET Status = 3 WHERE id = ?;');

        $sth->execute(array($verfahrensId));

        ob_start();
        $sth->debugDumpParams();
        $sqlDump = ob_get_clean();
        print "DBCon.class.php -> delVerfahren() Execute: $sqlDump";

        $deletedRows = $sth->rowCount();

        if($deletedRows === 1) {
          $this->addHistorie($verfahrensId, $userId);
          return TRUE; // Falls genau ein Verfahren gelöscht wurde
        }

        if($deletedRows === 0) return FALSE; // Falls nichts gelöscht werden konnte

        throw new Exception("DBCon.class.php -> Fehler beim Löschen eines Verfahrens! (Fehler: Unbekannter Fehler - Gelöschte Reihen: $deletedRows)");
      }
      else {
        throw new Exception("DBCon.class.php -> Keine aktive Datenbank-Verbindung!");
      }
    }

    /**
     * Liest die letzten Historie-Einträge zu einem bestimmten Verfahren aus.
     *
     * @param int $verfahrensId ID eines Verfahrens
     * @return array Liste der letzten Bearbeitungen eines Verfahrens
     * @throws PDOException
     * @throws Exception
     */
    public function getHistorie($verfahrensId) {
      if($this->isConnected()) {
        $sth = $this->pdo->prepare('SELECT Verfahrens_Id, Datum, personen.Kennung, personen.Name, personen.Anzeigename FROM verfahren_historie LEFT JOIN personen ON verfahren_historie.Kennung = personen.Kennung WHERE Verfahrens_Id = ? ORDER BY Datum DESC;');
        $sth->execute([$verfahrensId]);

        ob_start();
        $sth->debugDumpParams();
        $sqlDump = ob_get_clean();
        print "DBCon.class.php -> getHistorie() Execute: $sqlDump";

        $result = $sth->fetchAll();
        return $result;
      }
      else {
        throw new Exception("DBCon.class.php -> Keine aktive Datenbank-Verbindung!");
      }
    }

    /**
     * Durchsucht die Personendatenbank nach $term als Teil der Kennung oder des Namens.
     * Sollte der Suchbegriff Leerzeichen enthalten, wird der String aufgeteilt in einzelne Suchbegriffe.
     *
     * @param string $term         Suchbegriff
     * @param bool   $onlyEmployee (optional) Wenn TRUE, dann werden nur Mitarbeiter angezeigt
     * @param bool   $isID         (optional) Wenn TRUE, dann wird $term als exakte Nutzerkennung gesucht
     * @return array Array der Suchergebnisse
     * @throws PDOException
     * @throws Exception
     */
    public function searchPerson($term, $onlyEmployee = FALSE, $isID = FALSE) {
      if(!$this->isConnected()) {
        throw new Exception("DBCon.class.php -> Keine aktive Datenbank-Verbindung!");
      }

      $terms = explode(' ', trim($term));
      foreach($terms as $key => $value) {
        $terms[$key] = '%' . $value . '%';
      }

      $sql = 'SELECT * FROM personen WHERE';
      if($onlyEmployee) {
        $sql .= ' Anzeigename IS NOT NULL AND';
      }

      if(count($terms) === 1) {
        if($isID) {
          $sth = $this->pdo->prepare($sql . ' (Kennung = ?);');
          $sth->execute([$term]);
        }
        else {
          $sth = $this->pdo->prepare($sql . ' (Kennung LIKE ? OR Name LIKE ?);');
          $sth->execute([$terms[0], $terms[0]]);
        }

        ob_start();
        $sth->debugDumpParams();
        $sqlDump = ob_get_clean();
        print "DBCon.class.php -> searchPerson() Execute: $sqlDump";
        return $sth->fetchAll();
      }
      else {
        foreach($terms as $key => $value) {
          if($key > 0) $sql .= ' AND';
          $sql .= ' Name LIKE ?';
        }
        $sql .= ';';
        $sth = $this->pdo->prepare($sql);
        $sth->execute($terms);
        ob_start();
        $sth->debugDumpParams();
        $sqlDump = ob_get_clean();
        print "DBCon.class.php -> searchPerson() Execute: $sqlDump";
        return $sth->fetchAll();
      }
    }

    /**
     * Durchsucht die Organisationsabteilungen nach $term als Teil des Namens.
     * Sollte der Suchbegriff Leerzeichen enthalten, wird der String aufgeteilt in einzelne Suchbegriffe.
     *
     * @param string $term (optional) Suchbegriff
     * @return array Array der Suchergebnisse
     * @throws PDOException
     * @throws Exception
     */
    public function searchFachabteilung($term = NULL) {
      if(!$this->isConnected()) {
        throw new Exception("DBCon.class.php -> Keine aktive Datenbank-Verbindung!");
      }

      # Gibt alle Organisationseinheiten zurück
      if($term === NULL || empty($term)) {
        $sth = $this->pdo->prepare('SELECT * FROM organisationseinheiten;');
        $sth->execute();
        return $sth->fetchAll();
      }

      $terms = explode(' ', trim($term));
      foreach($terms as $key => $value) {
        $terms[$key] = '%' . $value . '%';
      }

      $sql = 'SELECT * FROM organisationseinheiten WHERE';
      foreach($terms as $key => $value) {
        if($key > 0) $sql .= ' AND';
        $sql .= ' Name LIKE ?';
      }
      $sql .= ';';
      $sth = $this->pdo->prepare($sql);
      $sth->execute($terms);
      ob_start();
      $sth->debugDumpParams();
      $sqlDump = ob_get_clean();
      print "DBCon.class.php -> searchFachabteilung() Execute: $sqlDump";
      return $sth->fetchAll();
    }

    /**
     * Durchsucht die IVVen nach $term als Teil des Namens.
     * Sollte der Suchbegriff Leerzeichen enthalten, wird der String aufgeteilt in einzelne Suchbegriffe.
     *
     * @param string $term (optional) Suchbegriff
     * @return array Array der Suchergebnisse
     * @throws PDOException
     * @throws Exception
     */
    public function searchIVV($term = NULL) {
      if(!$this->isConnected()) {
        throw new Exception("DBCon.class.php -> Keine aktive Datenbank-Verbindung!");
      }

      # Gibt alle IVVen zurück
      if($term === NULL || empty($term)) {
        $sth = $this->pdo->prepare('SELECT * FROM ivven;');
        $sth->execute();
        return $sth->fetchAll();
      }

      $terms = explode(' ', trim($term));
      foreach($terms as $key => $value) {
        $terms[$key] = '%' . $value . '%';
      }

      $sql = 'SELECT * FROM ivven WHERE';
      foreach($terms as $key => $value) {
        if($key > 0) $sql .= ' AND';
        $sql .= ' Name LIKE ?';
      }
      $sql .= ';';
      $sth = $this->pdo->prepare($sql);
      $sth->execute($terms);
      ob_start();
      $sth->debugDumpParams();
      $sqlDump = ob_get_clean();
      print "DBCon.class.php -> searchIVV() Execute: $sqlDump";
      return $sth->fetchAll();
    }

    /**
     * Durchsucht die CPE-Einträge nach $term als Teil des Namens.
     * Sollte der Suchbegriff Leerzeichen enthalten, wird der String aufgeteilt in einzelne Suchbegriffe.
     *
     * @param string $term (optional) Suchbegriff
     * @param string $type (optional) Typ der zu durchsuchenden CPE-Einträge ('a' für Applikationen, 'o' für Betriebssysteme und 'h' für Hardware)
     * @return array Array der Suchergebnisse
     * @throws PDOException
     * @throws Exception
     */
    public function searchCPE($term = NULL, $type = NULL) {
      if(!$this->isConnected()) {
        throw new Exception("DBCon.class.php -> Keine aktive Datenbank-Verbindung!");
      }

      $sql = 'SELECT CPE, Name from cpe';
      $filterSql = '';
      $filterVars = [];

      if(!empty($term)) {
        $terms = explode(' ', trim($term));
        foreach($terms as $key => $value) {
          if($key > 0) $filterSql .= ' AND';
          $filterSql .= ' Name LIKE ?';
          array_push($filterVars, '%' . $value . '%');
        }
      }

      if(!empty($type)) {
        if(!empty($filterSql)) $filterSql .= ' AND';
        $filterSql .= ' Typ = ?';
        array_push($filterVars, $type);
      }

      if(!empty($filterSql)) $sql .= ' WHERE ' . $filterSql;
      $sql .= ';';
      $sth = $this->pdo->prepare($sql);
      $sth->execute($filterVars);
      ob_start();
      $sth->debugDumpParams();
      $sqlDump = ob_get_clean();
      print "DBCon.class.php -> searchCPE() Execute: $sqlDump";
      return $sth->fetchAll();
    }

    /**
     * Gibt eine Statisitk über die aktuell gemeldeten Verfahren aus.
     *
     * @return array Assoziatives Array mit Werten für 'gesamt', 'inbearbeitung', 'abgeschlossen' und 'gelöscht'
     * @throws Exception
     * @throws PDOException
     */
    public function getStats() {
      if(!$this->isConnected()) {
        throw new Exception("DBCon.class.php -> Keine aktive Datenbank-Verbindung!");
      }

      $sth = $this->pdo->prepare("
        SELECT
        (SELECT COUNT(ID) FROM verfahren) AS gesamt,
        (SELECT COUNT(ID)  FROM verfahren WHERE Status = 0) AS inbearbeitung,
        (SELECT COUNT(ID)  FROM verfahren WHERE Status = 2) AS abgeschlossen,
        (SELECT COUNT(Verfahrens_Id) FROM (SELECT Verfahrens_Id FROM verfahren_historie WHERE Datum > datetime('now', '-7 days', 'localtime') GROUP BY Verfahrens_Id)) AS zuletztbearbeitet;");

      $sth->execute();

      ob_start();
      $sth->debugDumpParams();
      $sqlDump = ob_get_clean();
      print "DBCon.class.php -> getStats() Execute: $sqlDump";

      $tmp = $sth->fetch();
      $result = [
          'gesamt' => (int) $tmp['gesamt'],
          'inbearbeitung' => (int) $tmp['inbearbeitung'],
          'abgeschlossen' => (int) $tmp['abgeschlossen'],
          'gelöscht' => $tmp['gesamt'] - $tmp['inbearbeitung'] - $tmp['abgeschlossen'],
          'zuletztbearbeitet' => (int) $tmp['zuletztbearbeitet']
      ];

      return $result;
    }

    /**
     * Gibt die Liste der hinterlegten TOMs aus.
     *
     * @param int      $tier TOMs für eine bestimmte Ebene zurückgeben (0 = Alle, 1 = Verarbeitungstätigkeit, 2 = IT-Verfahren, 3 = Fachapplikation)
     * @return mixed[] Array mit den TOMs
     * @throws PDOException
     * @throws Exception
     */
    public function getTOMs($tier = 0) {
      if(!$this->isConnected()) {
        throw new Exception("DBCon.class.php -> Keine aktive Datenbank-Verbindung!");
      }

      if($tier !== 0) {
        $sth = $this->pdo->prepare("SELECT * FROM tomassignment LEFT JOIN toms ON tomassignment.TOMID = toms.Identifier WHERE Tier = ? ORDER BY Identifier ASC;");
        $sth->execute([$tier]);
      }
      else {
        $sth = $this->pdo->prepare("SELECT * FROM toms ORDER BY Identifier ASC;");
        $sth->execute();
      }

      ob_start();
      $sth->debugDumpParams();
      $sqlDump = ob_get_clean();
      print "DBCon.class.php -> getTOMs() Execute: $sqlDump";

      return $sth->fetchAll();
    }

    /**
     * Aktualisiert die Berechtigungen für en Verfahren.
     *
     * @param  int      $verfahrensId ID des Verfahrens
     * @param  string   $userId       Nutzerkennung
     * @param  string[] $userGroups   Gruppen des ausführenden Nutzers
     * @param  mixed[]  $permissions  Array mit Berechtigungen ([['id' => 'u0ivsb', 'isgroup' => true, 'canedit' => true],...])
     * @param bool   $userIsDSB    (optional) Gibt an, ob der ausführende Nutzer ein DSB ist (Zugriff auf alle Verfahren)
     * @return bool TRUE bei Erfolg
     * @throws PDOException
     * @throws Exception
     */
    public function updatePermissions($verfahrensId, $userId, $userGroups, $permissions, $userIsDSB) {
      if(!$this->isConnected()) {
        throw new Exception("DBCon.class.php -> Keine aktive Datenbank-Verbindung!");
      }

      if(!$userIsDSB && $this->getPermissionLevel($verfahrensId, $userId, $userGroups) < 2) {
        return FALSE;
      }

      $this->pdo->beginTransaction();

      $sql = 'DELETE FROM permissions WHERE Process_ID = ?;';
      $sth = $this->pdo->prepare($sql);

      $sth->execute(array($verfahrensId));

      ob_start();
      $sth->debugDumpParams();
      $sqlDump = ob_get_clean();
      print "DBCon.class.php -> updatePermissions() Execute: $sqlDump";

      $sql = 'INSERT OR IGNORE INTO permissions (Process_ID, ID, IsGroup, CanEdit) VALUES (?, ?, ?, ?);';
      $sth = $this->pdo->prepare($sql);

      foreach($permissions as $perm) {
        $sth->execute(array($verfahrensId, $perm['id'], $perm['isgroup'] ? 1 : 0, $perm['canedit'] ? 1 : 0));

        ob_start();
        $sth->debugDumpParams();
        $sqlDump = ob_get_clean();
        print "DBCon.class.php -> updatePermissions() Execute: $sqlDump";
      }

      return $this->pdo->commit();
    }

    /**
     * Aktualisiert die Abhängigkeiten für ein Verfahren.
     *
     * @param  int      $verfahrensId ID des Verfahrens
     * @param  int[]    $dependencies Array an IDs von Verfahren, von denenen das Verfahren abhängt
     * @param  string   $userId       Nutzerkennung
     * @param  string[] $userGroups   Gruppen des ausführenden Nutzers
     * @param  bool     $userIsDSB    (optional) Gibt an, ob der ausführende Nutzer ein DSB ist (Zugriff auf alle Verfahren)
     * @return bool TRUE bei Erfolg
     * @throws PDOException
     * @throws Exception
     */
    public function updateDependency($verfahrensId, $dependencies, $userId, $userGroups, $userIsDSB = FALSE) {
      if(!$this->isConnected()) {
        throw new Exception("DBCon.class.php -> Keine aktive Datenbank-Verbindung!");
      }

      if(!$userIsDSB && $this->getPermissionLevel($verfahrensId, $userId, $userGroups) < 2) {
        return FALSE;
      }

      $this->pdo->beginTransaction();

      $sql = 'DELETE FROM dependency WHERE Dependent = ?;';
      $sth = $this->pdo->prepare($sql);

      $sth->execute(array($verfahrensId));

      ob_start();
      $sth->debugDumpParams();
      $sqlDump = ob_get_clean();
      print "DBCon.class.php -> updateDependency() Execute: $sqlDump";

      $sql = 'INSERT OR IGNORE INTO dependency (Dependent, Dependency) VALUES (?, ?);';
      $sth = $this->pdo->prepare($sql);

      foreach($dependencies as $dependency) {
        $sth->execute(array($verfahrensId, $dependency));

        ob_start();
        $sth->debugDumpParams();
        $sqlDump = ob_get_clean();
        print "DBCon.class.php -> updateDependency() Execute: $sqlDump";
      }

      return $this->pdo->commit();
    }

    /**
     * Fragt ab, welche Verfahren von $verfahrensId abhängen.
     *
     * @param  int      $verfahrensId ID des Verfahrens
     * @param  string   $userId       Nutzerkennung
     * @param  string[] $userGroups   Gruppen des ausführenden Nutzers
     * @param  bool     $userIsDSB    (optional) Gibt an, ob der ausführende Nutzer ein DSB ist (Zugriff auf alle Verfahren)
     * @return int[] Gibt eine Liste mit den IDs von abhängigen Verfahren an
     * @throws PDOException
     * @throws Exception
     */
    public function getDependencies($verfahrensId, $userId, $userGroups, $userIsDSB = FALSE) {
      if(!$this->isConnected()) {
        throw new Exception("DBCon.class.php -> Keine aktive Datenbank-Verbindung!");
      }

      if(!$userIsDSB && $this->getPermissionLevel($verfahrensId, $userId, $userGroups) < 2) {
        return FALSE;
      }

      $dependencies = [];

      $sql = 'SELECT Dependent, Bezeichnung, Typ FROM dependency LEFT JOIN verfahren ON dependency.Dependent = verfahren.ID WHERE Dependency = ? ORDER BY Bezeichnung ASC;';

      $sth = $this->pdo->prepare($sql);

      $sth->execute(array($verfahrensId));

      ob_start();
      $sth->debugDumpParams();
      $sqlDump = ob_get_clean();
      print "DBCon.class.php -> getDependencies() Execute: $sqlDump";

      foreach($sth->fetchAll() as $entry) {
        array_push($dependencies, ['id' => intval($entry['Dependent']), 'name' => $entry['Bezeichnung'], 'type' => intval($entry['Typ'])]);
      }

      return $dependencies;
    }

    /**
     * Gibt die Berechtigungsstufe für einen Nutzer und ein Verfahren zurück
     * @param  int      $verfahrensId ID des Verfahrens
     * @param  string   $userId       Nutzerkennung
     * @param  string[] $userGroups   Gruppen des Nutzers
     * @return int Berechtigungsstufe (0 = kein Zugriff, 1 = Lesezugriff, 2 = Schreibzugriff)
     * @throws PDOException
     * @throws Exception
     */
    public function getPermissionLevel($verfahrensId, $userId, $userGroups) {
      if(!$this->isConnected()) {
        throw new Exception("DBCon.class.php -> Keine aktive Datenbank-Verbindung!");
      }

      $permLevel = 0;

      # Prüfe Leseberechtigung
      $sql = 'SELECT Perm FROM (
        SELECT 1 as Perm FROM verfahren WHERE ID = ? AND (Ersteller = ? OR FachKontakt = ? OR Techkontakt = ?)
        UNION SELECT CanEdit AS Perm FROM permissions WHERE Process_ID = ? AND ((IsGroup = 0 AND ID = ?) OR (IsGroup = 1 AND ID in (' . implode(', ', array_fill(0, count($userGroups), '?')) . '))))
        ORDER BY Perm DESC LIMIT 1;';

      $sth = $this->pdo->prepare($sql);

      $sth->execute(array_merge(array(
          $verfahrensId,
          $userId,
          $userId,
          $userId,
          $verfahrensId,
          $userId,
      ), $userGroups));

      ob_start();
      $sth->debugDumpParams();
      $sqlDump = ob_get_clean();
      print "DBCon.class.php -> getPermissionLevel() Execute: $sqlDump";

      $result = $sth->fetch();

      if(!empty($result)) {
        $permLevel = ((int) $result['Perm']) === 1 ? 2 : 1;
      }

      return $permLevel;
    }

    /**
     * Holt die Vorschläge für Eingabefelder.
     *
     * @param  string $lang  (optional) Sprachschlüssel
     * @param  string $field (optional) Vorschläge für ein Feld filtern
     * @return mixed[] Assoziatives Array der Form ['daten_kategorien_beschreibung' => [ 'de' => [ ['entry' => 'Studenten', 'additionalinfo' => '{}'], ...]]]
     * @throws PDOException
     * @throws Exception
     */
    public function getSuggestions($lang = '', $field = '') {
      if(!$this->isConnected()) {
        throw new Exception("DBCon.class.php -> Keine aktive Datenbank-Verbindung!");
      }

      $filter = [];
      if(!empty($lang)) array_push($filter, ' Lang = ?');
      if(!empty($field)) array_push($filter, ' Field = ?');
      $sql = 'SELECT * FROM suggestions' . ((count($filter) > 0) ? ' WHERE' . implode(' AND', $filter) : '') . ' ORDER BY Entry ASC;';

      $sth = $this->pdo->prepare($sql);

      $filterValues = [];
      if(!empty($lang)) array_push($filterValues, $lang);
      if(!empty($field)) array_push($filterValues, $field);
      $sth->execute($filterValues);

      ob_start();
      $sth->debugDumpParams();
      $sqlDump = ob_get_clean();
      print "DBCon.class.php -> getSuggestions() Execute: $sqlDump";

      $result = [];
      foreach($sth->fetchAll() as $entry) {
        if(!array_key_exists($entry['Field'], $result)) $result[$entry['Field']] = [];
        if(!array_key_exists($entry['Lang'], $result[$entry['Field']])) $result[$entry['Field']][$entry['Lang']] = [];
        array_push($result[$entry['Field']][$entry['Lang']], ['entry' => $entry['Entry'], 'additionalinfo' => $entry['AdditionalInfo']]);
      }

      return $result;
    }

    /**
     * Schreibt einen Eintrag in die Bearbeitungs-Historie.
     * Sollte immer nur in Verbindung mit einer Aktion genutzt werden.
     *
     * @param int $verfahrensId   ID des Verfahrens
     * @param string $userId Nutzerkennung
     * @return void
     * @throws PDOException
     */
    private function addHistorie($verfahrensId, $userId) {
      $sth = $this->pdo->prepare('INSERT INTO verfahren_historie (Verfahrens_Id, Kennung) VALUES (?, ?);');
      $sth->execute([$verfahrensId, $userId]);

      ob_start();
      $sth->debugDumpParams();
      $sqlDump = ob_get_clean();
      print "DBCon.class.php -> addHistorie() Execute: $sqlDump";

      $this->removeHistorie($verfahrensId);
    }

    /**
     * Entfernt die ältesten Einträge der Historie, sodass nur const MAXHISTORY Einträge übrig bleiben.
     *
     * @param int $verfahrensId ID des Verfahrens
     * @return void
     * @throws PDOException
     */
    private function removeHistorie($verfahrensId) {
      $sth = $this->pdo->prepare('DELETE FROM verfahren_historie WHERE (Verfahrens_Id, Kennung, Datum) IN (SELECT * FROM verfahren_historie WHERE Verfahrens_Id = ? ORDER BY Datum DESC LIMIT -1 OFFSET ?);');
      $sth->execute([$verfahrensId, self::MAXHISTORY]);

      ob_start();
      $sth->debugDumpParams();
      $sqlDump = ob_get_clean();
      print "DBCon.class.php -> removeHistorie() Execute: $sqlDump";
    }

    /**
     * toString-Funktion
     * @return string
     */
    public function __toString(): string {
      return '[SecDoc] DBCon - Pfad: ' . $this->path . DIRECTORY_SEPARATOR . $this->filename . ' - Connected: ' . $this->isConnected();
    }
  }
?>
