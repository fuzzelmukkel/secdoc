<?php
  /**
   * DBCon.class.php - Enthält die DBCon-Klasse zur Verbindung mit einer Datenbank via PDO (Standardmäßig SQLite)
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
   * Tabelle: Verfahren
   * <pre>
   * +-----------+---+------------+------------+------------+-----------+-------------+------------+-----------+-----------+----------+----------------+------+------------+----+------------+
   * |ID         |Typ|Erstelldatum|Bezeichnung |Beschreibung|Risikolevel|Fachabteilung|IVV         |FachKontakt|TechKontakt|Ersteller |Bearbeitergruppe|Status|Sichtbarkeit|JSON|DSBKommentar|
   * +-----------+---+------------+------------+------------+-----------+-------------+------------+-----------+-----------+----------+----------------+------+------------+----+------------+
   * |INT        |INT|DATE        |VARCHAR(100)|TEXT        |INT        |VARCHAR(100) |VARCHAR(100)|VARCHAR(8) |VARCHAR(8) |VARCHAR(8)|VARCHAR(8)      |INT   |INT         |BLOB|TEXT        |
   * |PRIMARY KEY|   |            |            |            |           |             |            |           |           |          |                |      |            |    |            |
   * +-----------+---+------------+------------+------------+-----------+-------------+------------+-----------+-----------+----------+----------------+------+------------+----+------------+
   * </pre>
   * * Typ: 1 = Verarbeitungstätigkeit, 2 = IT-Verfahren, 3 = Fachapplikation, 4 = übergreifende Massnahmen
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
   * * Dependency: Die Abhängigkeit
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
    const DBVERSION = 11; # Version für eine DB-Struktur; zur Überprüfung beim Laden genutzt

    /** @var int Maximale Anzahl an Historien-Einträgen */
    const MAXHISTORY = 15; # Nur diese Anzahl an Historien-Einträgen wird behalten

    # Aktuelle Tabellen-Definitionen
    /** @var string[] Tabellendefinitionen */
    const CURRENT_TABLES = [
        "CREATE TABLE verfahren (
            ID INTEGER PRIMARY KEY,                               -- Eindeutige ID für ein Verfahren (kann automatisch inkrementiert werden oder manuell gesetzt werden)
            Typ INT NOT NULL DEFAULT 1,                           -- Typ des Eintrags (1 = Verarbeitungstätigkeit, 2 = IT-Verfahren, 3 = Fachapplikation, 4 = übergreifende Maßnahme)
            Erstelldatum DATE DEFAULT '',                         -- Einführungsdatum des Verfahrens
            Bezeichnung VARCHAR(100) NOT NULL DEFAULT  '',        -- Bezeichnung des Verfahren
            Beschreibung TEXT NOT NULL DEFAULT  '',               -- Ausführlichere Beschreibung des Verfahrens
            Risikolevel INT NOT NULL DEFAULT 2,                   -- Ergebnis der Risikoanalyse (1 = Niedrig, 2 = Mittel, 3 = Hoch)
            Fachabteilung VARCHAR(100) NOT NULL DEFAULT  '',      -- Name der betreuenden Fachabteilung
            IVV VARCHAR(100) NOT NULL DEFAULT  '',                -- Name der betreuenden IVV
            FachKontakt VARCHAR(8) NOT NULL DEFAULT  '',          -- Nutzerkennung des fachlichen Ansprechpartners
            TechKontakt VARCHAR(8) NOT NULL DEFAULT  '',          -- Nutzerkennung des technischen Ansprechpartners
            Ersteller VARCHAR(8) NOT NULL,                        -- Nutzerkennung des Erstellers
            Bearbeitergruppe VARCHAR(8) NOT NULL DEFAULT  '',     -- Nutzergruppe, die das Verfahren bearbeiten darf
            Status INT NOT NULL DEFAULT 0,                        -- Aktueller Status des Verfahren (0 = In Bearbeitung, 2 = In Betrieb, 3 = Gelöscht)
            Sichtbarkeit INT NOT NULL DEFAULT 0,                  -- Sichtbarkeit des Verfahrens für andere Personen
            JSON BLOB NOT NULL DEFAULT '{}',                      -- Verfahrensinhalt als JSON kodiert
            DSBKommentar TEXT DEFAULT ''                          -- Kommentarfeld für DSBs
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
            Name TEXT PRIMARY KEY ON CONFLICT IGNORE  -- Name der IVV
        );",
        "CREATE TABLE cpe (
            CPE TEXT PRIMARY KEY ON CONFLICT REPLACE, -- CPE-Nummer
            Name TEXT,                                -- Name des CPE Eintrags
            Typ TEXT                                  -- Typ des Eintrags (a für Applikation, o für Betriebssystem, h für Hardware)
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
        "CREATE TABLE toms (
            Identifier VARCHAR(10),            -- Unique identifier across one language, e.g. APP.1.1.A1
            Category TEXT NOT NULL,            -- Grouping for multiple TOMs, e.g. APP - Anwendungen
            Subcategory TEXT DEFAULT '',       -- Secondary level grouping, e.g. APP.1.1 Office-Produkte
            Title TEXT DEFAULT '',             -- Short title for TOM, e.g. Sicherstellen der Integrität von Office-Produkten
            Description TEXT NOT NULL,         -- Full description
            URL TEXT DEFAULT '',               -- URL, e.g. for BSI web site
            Risklevel  INT NOT NULL DEFAULT 1, -- Risklevel where this is needed (1 = Low, 2 = Medium, 3 = High)
            PRIMARY KEY (Identifier)
        );",
        "CREATE TABLE rollen (                 -- Rollen aus dem BSI IT-Grundschutz-Kompendium
            RoleID INT NOT NULL DEFAULT 0,     -- ID der Rolle
            Rolle VARCHAR(128),                -- Name der Rolle
            PRIMARY KEY (RoleID)
        );",
        "CREATE TABLE ebene_rollen (           -- Zuweisung von Rollen zu Ebenen
            EbeneID INT NOT NULL DEFAULT 0,    -- ID der Ebene (1 - Verarbeitungstätigkeit, 2 - Fachapplikation, 3 - IT-Verfahren)
            RoleID INT NOT NULL DEFAULT 0,     -- ID der Rolle (siehe Tabelle rollen)
            PRIMARY KEY (EbeneID, RoleID),
            FOREIGN KEY (RoleID) REFERENCES rollen(RoleID) ON UPDATE CASCADE ON DELETE CASCADE
        );",
        "CREATE TABLE tom_rollen (             -- Zuweisung von TOMs zu Rollen
            TOMID VARCHAR(10),                 -- ID der TOM (siehe Tabelle toms)
            RoleID INT NOT NULL DEFAULT 0,     -- ID der Rolle (siehe Tabelle rollen)
            PRIMARY KEY (TOMID, RoleID),
            FOREIGN KEY (TOMID) REFERENCES toms(Identifier) ON UPDATE CASCADE ON DELETE CASCADE,
            FOREIGN KEY (RoleID) REFERENCES rollen(RoleID) ON UPDATE CASCADE ON DELETE CASCADE
        );",
        "CREATE TABLE toms_desc ( -- Beschreibungen zu Bausteinen
            Identifier TEXT,      -- ID des Bausteins
            Description TEXT,     -- Beschreibung
            Objective TEXT,       -- Zielsetzung
            Delimit TEXT,         -- Abgrenzung
            URL TEXT DEFAULT '',  -- URL
            PRIMARY KEY (Identifier)
        );",
        "CREATE TABLE documents (                                                  -- Zuweisung von Dokumenten zu Dokumentationen
            DocID INTEGER PRIMARY KEY AUTOINCREMENT,                               -- ID des Dokuments
            ProcessID INT NOT NULL,                                                -- ID der Dokumentation
            Description TEXT NOT NULL DEFAULT '',                                  -- Beschreibung
            FileRef TEXT NOT NULL,                                                 -- Verweis auf Datei
            FileSize INT NOT NULL DEFAULT 0,                                       -- Dateigröße
            Attach INT NOT NULL DEFAULT 0,                                         -- Dokument an Abschluss-PDF anhängen?
            Date DATE NOT NULL DEFAULT (datetime(CURRENT_TIMESTAMP, 'localtime')), -- Letztes Änderungsdatum
            FOREIGN KEY (ProcessID) REFERENCES verfahren(ID) ON UPDATE CASCADE ON DELETE CASCADE
        );",
        "CREATE TABLE revisions (                                                  -- Speichert die Revisionen einer Dokumentation
            ProcessID INT NOT NULL,                                                -- ID der Dokumentation
            Revision INT NOT NULL,                                                 -- Nummer der Revision
            Comment TEXT NOT NULL DEFAULT '',                                      -- Kommentar
            Editor TEXT NOT NULL,                                                  -- Name des Bearbeiters
            Date DATE NOT NULL DEFAULT (datetime(CURRENT_TIMESTAMP, 'localtime')), -- Änderungsdatum
            FOREIGN KEY (ProcessID) REFERENCES verfahren(ID) ON UPDATE CASCADE ON DELETE CASCADE
        );"
    ];

    /** @var string[] Tabellendefinitionen */
    const TABLES = [
        "CREATE TABLE verfahren (
            ID INTEGER PRIMARY KEY,                               -- Eindeutige ID für ein Verfahren (kann automatisch inkrementiert werden oder manuell gesetzt werden)
            Typ INT NOT NULL DEFAULT 1,                           -- Typ des Eintrags (1 = Verarbeitungstätigkeit, 2 = IT-Verfahren, 3 = Fachapplikation, 4 = übergreifende Maßnahme)
            Erstelldatum DATE DEFAULT '',                         -- Einführungsdatum des Verfahrens
            Bezeichnung VARCHAR(100) NOT NULL DEFAULT  '',        -- Bezeichnung des Verfahren
            Beschreibung TEXT NOT NULL DEFAULT  '',               -- Ausführlichere Beschreibung des Verfahrens
            Risikolevel INT NOT NULL DEFAULT 2,                   -- Ergebnis der Risikoanalyse (1 = Niedrig, 2 = Mittel, 3 = Hoch)
            Fachabteilung VARCHAR(100) NOT NULL DEFAULT  '',      -- Name der betreuenden Fachabteilung
            IVV VARCHAR(100) NOT NULL DEFAULT  '',                -- Name der betreuenden IVV
            FachKontakt VARCHAR(8) NOT NULL DEFAULT  '',          -- Nutzerkennung des fachlichen Ansprechpartners
            TechKontakt VARCHAR(8) NOT NULL DEFAULT  '',          -- Nutzerkennung des technischen Ansprechpartners
            Ersteller VARCHAR(8) NOT NULL,                        -- Nutzerkennung des Erstellers
            Bearbeitergruppe VARCHAR(8) NOT NULL DEFAULT  '',     -- Nutzergruppe, die das Verfahren bearbeiten darf
            Status INT NOT NULL DEFAULT 0,                        -- Aktueller Status des Verfahren (0 = In Bearbeitung, 2 = In Betrieb, 3 = Gelöscht)
            Sichtbarkeit INT NOT NULL DEFAULT 0,                  -- Sichtbarkeit des Verfahrens für andere Personen
            JSON BLOB NOT NULL DEFAULT '{}',                      -- Verfahrensinhalt als JSON kodiert
            DSBKommentar TEXT DEFAULT ''                          -- Kommentarfeld für DSBs
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
            Name TEXT PRIMARY KEY ON CONFLICT IGNORE  -- Name der IVV
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
        );",
        # 12
        "CREATE TABLE toms (
            Identifier VARCHAR(10),            -- Unique identifier across one language, e.g. APP.1.1.A1
            Category TEXT NOT NULL,            -- Grouping for multiple TOMs, e.g. APP - Anwendungen
            Subcategory TEXT DEFAULT '',       -- Secondary level grouping, e.g. APP.1.1 Office-Produkte
            Title TEXT DEFAULT '',             -- Short title for TOM, e.g. Sicherstellen der Integrität von Office-Produkten
            Description TEXT NOT NULL,         -- Full description
            URL TEXT DEFAULT '',               -- URL, e.g. for BSI web site
            Risklevel  INT NOT NULL DEFAULT 1, -- Risklevel where this is needed (1 = Low, 2 = Medium, 3 = High)
            PRIMARY KEY (Identifier)
        );",
        # 13
        "CREATE TABLE rollen (                 -- Rollen aus dem BSI IT-Grundschutz-Kompendium
            RoleID INT NOT NULL DEFAULT 0,     -- ID der Rolle
            Rolle VARCHAR(128),                -- Name der Rolle
            PRIMARY KEY (RoleID)
        );",
        # 14
        "CREATE TABLE ebene_rollen (           -- Zuweisung von Rollen zu Ebenen
            EbeneID INT NOT NULL DEFAULT 0,    -- ID der Ebene (1 - Verarbeitungstätigkeit, 2 - Fachapplikation, 3 - IT-Verfahren, 4 - übergreifende Maßnahmen)
            RoleID INT NOT NULL DEFAULT 0,     -- ID der Rolle (siehe Tabelle rollen)
            PRIMARY KEY (EbeneID, RoleID),
            FOREIGN KEY (RoleID) REFERENCES rollen(RoleID) ON UPDATE CASCADE ON DELETE CASCADE
        );",
        # 15
        "CREATE TABLE tom_rollen (             -- Zuweisung von TOMs zu Rollen
            TOMID VARCHAR(10),                 -- ID der TOM (siehe Tabelle toms)
            RoleID INT NOT NULL DEFAULT 0,     -- ID der Rolle (siehe Tabelle rollen)
            PRIMARY KEY (TOMID, RoleID),
            FOREIGN KEY (TOMID) REFERENCES toms(Identifier) ON UPDATE CASCADE ON DELETE CASCADE,
            FOREIGN KEY (RoleID) REFERENCES rollen(RoleID) ON UPDATE CASCADE ON DELETE CASCADE
        );",
        # 16
        "CREATE TABLE toms_desc ( -- Beschreibungen zu Bausteinen
            Identifier TEXT,      -- ID des Bausteins
            Description TEXT,     -- Beschreibung
            Objective TEXT,       -- Zielsetzung
            Delimit TEXT,         -- Abgrenzung
            URL TEXT DEFAULT '',  -- URL
            PRIMARY KEY (Identifier)
        );",
        # 17
        "CREATE TABLE documents (                                                  -- Zuweisung von Dokumenten zu Dokumentationen
            DocID INTEGER PRIMARY KEY AUTOINCREMENT,                               -- ID des Dokuments
            ProcessID INT NOT NULL,                                                -- ID der Dokumentation
            Description TEXT NOT NULL DEFAULT '',                                  -- Beschreibung
            FileRef TEXT NOT NULL,                                                 -- Verweis auf Datei
            FileSize INT NOT NULL DEFAULT 0,                                       -- Dateigröße
            Attach INT NOT NULL DEFAULT 0,                                         -- Dokument an Abschluss-PDF anhängen?
            Date DATE NOT NULL DEFAULT (datetime(CURRENT_TIMESTAMP, 'localtime')), -- Letztes Änderungsdatum
            FOREIGN KEY (ProcessID) REFERENCES verfahren(ID) ON UPDATE CASCADE ON DELETE CASCADE
        );",
        # 18
        "CREATE TABLE revisions (                                                  -- Speichert die Revisionen einer Dokumentation
            ProcessID INT NOT NULL,                                                -- ID der Dokumentation
            Revision INT NOT NULL,                                                 -- Nummer der Revision
            Comment TEXT NOT NULL DEFAULT '',                                      -- Kommentar
            Editor TEXT NOT NULL,                                                  -- Name des Bearbeiters
            Date DATE NOT NULL DEFAULT (datetime(CURRENT_TIMESTAMP, 'localtime')), -- Änderungsdatum
            FOREIGN KEY (ProcessID) REFERENCES verfahren(ID) ON UPDATE CASCADE ON DELETE CASCADE
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
     * DBCon-Konstruktor: Stellt eine Verbindung zur Datenbank her und überprüft die Datenbank-Version.
     * Erstellt eine neue leere Datenbank, falls die Datenbank nicht existiert.
     *
     * @param string $directory (optional) Speicherpfad für die Datenbank-Datei
     * @param string $dbname    (optional) Name der Datenbank-Datei
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

      # Tabelle erzeugen, falls noch nicht vorhanden
      if(!file_exists($this->path . DIRECTORY_SEPARATOR . $this->filename)) {
        trigger_error("[SecDoc] DBCon.class.php -> Datenbank-Datei existiert nicht! Leere Datenbank wird erstellt!");
        error_log("[SecDoc] DBCon.class.php -> Datenbank-Datei existiert nicht! Leere Datenbank wird erstellt!");
        $this->pdo = new PDO('sqlite:' . $this->path . DIRECTORY_SEPARATOR . $this->filename, '', '', $opt);

        # Schlüsselreferenzen einschalten
        $this->pdo->exec("PRAGMA foreign_keys = ON;");
        usleep(10000);
        $this->pdo->exec("BEGIN;");

        # Tabellen erstellen
        foreach(self::CURRENT_TABLES as $table) {
          $this->pdo->exec($table);
          usleep(10000);
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
        else if($db_version == 8) {
          trigger_error("[SecDoc] DBCon.class.php -> Aktualisiere Datenbank von Version $db_version zu " . self::DBVERSION . "!");
          error_log("[SecDoc] DBCon.class.php -> Aktualisiere Datenbank von Version $db_version zu " . self::DBVERSION . "!");

          $this->pdo->beginTransaction();
          $this->pdo->exec("DROP TABLE tomassignment;");
          $this->pdo->exec("ALTER TABLE toms RENAME TO toms_old;");
          $this->pdo->exec(self::TABLES[12]);
          $this->pdo->exec(self::TABLES[13]);
          $this->pdo->exec(self::TABLES[14]);
          $this->pdo->exec(self::TABLES[15]);
          $this->pdo->exec("INSERT INTO toms (Identifier, Category, Subcategory, Title, Description, Risklevel) SELECT Identifier, Category, Subcategory, Title, Description, Risklevel FROM toms_old;");
          $this->pdo->exec("DROP TABLE toms_old;");
          $this->pdo->exec("PRAGMA user_version = 9;");
          $this->pdo->commit();
        }
        else if($db_version == 9) {
          trigger_error("[SecDoc] DBCon.class.php -> Aktualisiere Datenbank von Version $db_version zu " . self::DBVERSION . "!");
          error_log("[SecDoc] DBCon.class.php -> Aktualisiere Datenbank von Version $db_version zu " . self::DBVERSION . "!");

          $this->pdo->beginTransaction();
          $this->pdo->exec(self::TABLES[16]);
          $this->pdo->exec("PRAGMA user_version = 10;");
          $this->pdo->commit();
        }
        else if($db_version == 10) {
          trigger_error("[SecDoc] DBCon.class.php -> Aktualisiere Datenbank von Version $db_version zu " . self::DBVERSION . "!");
          error_log("[SecDoc] DBCon.class.php -> Aktualisiere Datenbank von Version $db_version zu " . self::DBVERSION . "!");

          $this->pdo->beginTransaction();
          # Neue Tabelle für angehängte Dokumente
          $this->pdo->exec(self::TABLES[17]);
          $this->pdo->exec(self::TABLES[18]);

          # Alte TOMs auf 'unbearbeitet' setzen, wenn nicht umgesetzt und kein Kommentar hinterlegt
          $sth1 = $this->pdo->prepare('SELECT ID, JSON FROM verfahren WHERE NOT Status = 3;');
          $sth2 = $this->pdo->prepare('UPDATE verfahren SET JSON = ? WHERE ID = ?;');
          $sth1->execute();
          foreach($sth1->fetchAll() as $entry) {
            $parsedJSON = json_decode($entry['JSON'], true);

            $tomKeys = array_filter(array_keys($parsedJSON), function($key) { return strpos($key, 'massnahmen_') === 0; });

            foreach($tomKeys as $key) {
              if(strpos($key, '_kommentar') !== FALSE || in_array($key, ['massnahmen_risiko', 'massnahmen_abhaengigkeit_id', 'massnahmen_abhaengigkeit_name', 'massnahmen_vertraulichkeit', 'massnahmen_integritaet', 'massnahmen_verfuegbarkeit'])) continue;

              if($parsedJSON[$key] !== '0') continue;

              if($parsedJSON[$key] === '0' && (!array_key_exists($key . '_kommentar', $parsedJSON) || empty($parsedJSON[$key . '_kommentar']))) {
                $parsedJSON[$key] = '-1';
              }
            }

            $sth2->execute([json_encode($parsedJSON), $entry['ID']]);
          }

          $this->pdo->exec("PRAGMA user_version = 11;");
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
     * Holt die Nutzerkennung des Techkontaktes zu einem Verfahren.
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
    * Holt die Nutzerkennung des Fachkontaktes zu einem Verfahren.
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
     * Holt Meta-Informationen zu einem Verfahren.
     *
     * @param  int $verfahrensId ID eines Verfahrens
     * @return array Generelle Infos über eine Dokumentation ['ID' => 123, 'Typ' => 1, 'Status' => 0, 'Bezeichnung' => 'Test Verfahren', 'Beschreibung' => 'Das ist ein Verfahren zum Testen']
     */
     public function getVerfahrenInfo($verfahrensId) {
       if($this->isConnected()) {
         $sth = $this->pdo->prepare("SELECT ID, Typ, Status, Bezeichnung, Beschreibung, MAX(Datum) AS Aktualisierung FROM verfahren LEFT JOIN verfahren_historie ON verfahren.ID = verfahren_historie.Verfahrens_Id  WHERE ID = ? GROUP BY ID LIMIT 1;");
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
     * Listet alle Verfahren auf, die in Betrieb sind und für den Nutzer freigegeben sind.
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
     * @param int    $type   (optional) Filtert nach Dokumentationstyp (1 = Verarbeitungstätigkeit, 2 = IT-Verfahren, 3 = Fachapplikation, 4 = übergreifende Maßnahme)
     * @return array Gibt die Liste der Verfahren zurück
     * @throws PDOException
     * @throws Exception
     */
    public function listVerfahrenDSB($search = '', $type = NULL) {
      if($this->isConnected()) {
        $result = array();
        $sth = $this->pdo->prepare('SELECT ID, Typ, Bezeichnung, Beschreibung, Erstelldatum, Fachabteilung, IFNULL(person1.Anzeigename, verfahren.FachKontakt) AS FachKontakt, IFNULL(person2.Anzeigename, verfahren.TechKontakt) AS TechKontakt, Status, Sichtbarkeit, DSBKommentar, IFNULL(person3.Name, verfahren_historie.Kennung) AS LetzterBearbeiter, IFNULL(person3.Anzeigename, "") AS BearbeiterDetails, MAX(Datum) AS Aktualisierung '
                . 'FROM verfahren LEFT JOIN verfahren_historie ON verfahren.ID = verfahren_historie.Verfahrens_Id LEFT JOIN personen AS person1 ON verfahren.FachKontakt = person1.Kennung LEFT JOIN personen AS person2 ON verfahren.TechKontakt = person2.Kennung  LEFT JOIN personen AS person3 ON verfahren_historie.Kennung = person3.Kennung '
                . 'WHERE NOT Status = 3' . (!empty($search) ? ' AND Bezeichnung LIKE ?' : '') . (!empty($type) ? ' AND Typ = ?' : '') . ' GROUP BY ID ORDER BY Bezeichnung COLLATE NOCASE;');
        $params = array();
        if (!empty($search)) array_push($params, "%$search%");
        if (!empty($type)) array_push($params, $type);
        $sth->execute($params);

        ob_start();
        $sth->debugDumpParams();
        $sqlDump = ob_get_clean();
        print "DBCon.class.php -> listVerfahrenDSB() Execute: $sqlDump";

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
     * Listet alle IDs der als 'gelöscht' markierten Dokumentationen auf.
     *
     * @return mixed[] Liste der IDs
     * @throws PDOException
     * @throws Exception
     */
    public function listVerfahrenDeleted() {
      if($this->isConnected()) {

        $sth = $this->pdo->prepare('SELECT ID FROM verfahren WHERE Status = 3;');

        $sth->execute();

        ob_start();
        $sth->debugDumpParams();
        $sqlDump = ob_get_clean();
        print "DBCon.class.php -> listVerfahrenDeleted() Execute: $sqlDump";

        return $sth->fetchAll();
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
     * Löscht das Verfahren mit der übergebenen ID (markiert es als gelöscht).
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

        if(!$userIsDSB && $this->getVerfahrenInfo($verfahrensId)['Typ'] === 4) {
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
     * Löscht eine Dokumentation final. Wird nur ausgeführt, wenn die Dokumentation vorher bereits im Zustand gelöscht war.
     * @param  int $verfahrensId ID der Dokumentation
     * @return bool Gibt im Erfolgsfall TRUE zurück; FALSE falls das Verfahren nicht gefunden wurde oder es noch nicht als gelöscht markiert war
     * @throws PDOException
     * @throws Exception
     */
    public function finalDelVerfahren($verfahrensId) {
      if($this->isConnected()) {
        # Das Verfahren wird erstmal nur als gelöscht markiert
        $sth = $this->pdo->prepare('DELETE FROM verfahren WHERE Status = 3 AND id = ?;');

        $sth->execute(array($verfahrensId));

        ob_start();
        $sth->debugDumpParams();
        $sqlDump = ob_get_clean();
        print "DBCon.class.php -> finalDelVerfahren() Execute: $sqlDump";

        $deletedRows = $sth->rowCount();

        if($deletedRows === 1) {
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
        $sth = $this->pdo->prepare('SELECT Verfahrens_Id, Datum, verfahren_historie.Kennung, personen.Name, personen.Anzeigename FROM verfahren_historie LEFT JOIN personen ON verfahren_historie.Kennung = personen.Kennung WHERE Verfahrens_Id = ? ORDER BY Datum DESC;');
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

      $tomRows = [];

      if($tier !== 0) {
        $sth = $this->pdo->prepare("SELECT DISTINCT toms.Identifier AS Identifier, Category, Subcategory, Title, toms.Description AS Description, Risklevel, toms_desc.Description AS CatDesc, Objective AS CatObjective, Delimit AS CatDelimit, toms_desc.URL AS CatURL
          FROM ebene_rollen
          INNER JOIN tom_rollen ON ebene_rollen.RoleID = tom_rollen.RoleID
          INNER JOIN toms ON tom_rollen.TOMID = toms.Identifier
          LEFT OUTER JOIN toms_desc ON toms.Identifier LIKE toms_desc.Identifier || '%'
          WHERE EbeneID = ? ORDER BY toms.Identifier ASC;");
        $sth->execute([$tier]);
        $tomRows = $sth->fetchAll();

        if(count($tomRows) === 0) {
          $sth = $this->pdo->prepare("SELECT DISTINCT toms.Identifier AS Identifier, Category, Subcategory, Title, toms.Description AS Description, Risklevel, toms_desc.Description AS CatDesc, Objective AS CatObjective, Delimit AS CatDelimit, toms_desc.URL AS CatURL
            FROM toms
            LEFT OUTER JOIN toms_desc ON toms.Identifier LIKE toms_desc.Identifier || '%'
            ORDER BY toms.Identifier ASC;");
          $sth->execute();
          $tomRows = $sth->fetchAll();
        }
      }
      else {
        $sth = $this->pdo->prepare("SELECT DISTINCT toms.Identifier AS Identifier, Category, Subcategory, Title, toms.Description AS Description, Risklevel, toms_desc.Description AS CatDesc, Objective AS CatObjective, Delimit AS CatDelimit, toms_desc.URL AS CatURL
          FROM toms
          LEFT OUTER JOIN toms_desc ON toms.Identifier LIKE toms_desc.Identifier || '%'
          ORDER BY toms.Identifier ASC;");
        $sth->execute();
        $tomRows = $sth->fetchAll();
      }

      ob_start();
      $sth->debugDumpParams();
      $sqlDump = ob_get_clean();
      print "DBCon.class.php -> getTOMs() Execute: $sqlDump";

      return $tomRows;
    }

    /**
     * Aktualisiert die Berechtigungen für ein Verfahren.
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

      $sql = 'SELECT Dependent, Bezeichnung, Typ, Status FROM dependency LEFT JOIN verfahren ON dependency.Dependent = verfahren.ID WHERE Dependency = ? ORDER BY Bezeichnung ASC;';

      $sth = $this->pdo->prepare($sql);

      $sth->execute(array($verfahrensId));

      ob_start();
      $sth->debugDumpParams();
      $sqlDump = ob_get_clean();
      print "DBCon.class.php -> getDependencies() Execute: $sqlDump";

      foreach($sth->fetchAll() as $entry) {
        array_push($dependencies, ['id' => intval($entry['Dependent']), 'name' => $entry['Bezeichnung'], 'type' => intval($entry['Typ']), 'status' => intval($entry['Status'])]);
      }

      return $dependencies;
    }

    /**
     * Fragt ab, von welchen Verfahren $verfahrensId abhängt.
     *
     * @param  int      $verfahrensId ID des Verfahrens
     * @param  string   $userId       Nutzerkennung
     * @param  string[] $userGroups   Gruppen des ausführenden Nutzers
     * @param  bool     $userIsDSB    (optional) Gibt an, ob der ausführende Nutzer ein DSB ist (Zugriff auf alle Verfahren)
     * @return int[] Gibt eine Liste mit den IDs von abhängigen Verfahren an
     * @throws PDOException
     * @throws Exception
     */
    public function getDependenciesOf($verfahrensId, $userId, $userGroups, $userIsDSB = FALSE) {
      if(!$this->isConnected()) {
        throw new Exception("DBCon.class.php -> Keine aktive Datenbank-Verbindung!");
      }

      if(!$userIsDSB && $this->getPermissionLevel($verfahrensId, $userId, $userGroups) < 1) {
        return FALSE;
      }

      $dependencies = [];

      $sql = 'SELECT Dependency, Bezeichnung, Typ, Status FROM dependency LEFT JOIN verfahren ON dependency.Dependency = verfahren.ID WHERE Dependent = ? ORDER BY Bezeichnung ASC;';

      $sth = $this->pdo->prepare($sql);

      $sth->execute(array($verfahrensId));

      ob_start();
      $sth->debugDumpParams();
      $sqlDump = ob_get_clean();
      print "DBCon.class.php -> getDependenciesOf() Execute: $sqlDump";

      foreach($sth->fetchAll() as $entry) {
        array_push($dependencies, ['id' => intval($entry['Dependency']), 'name' => $entry['Bezeichnung'], 'type' => intval($entry['Typ']), 'status' => intval($entry['Status'])]);
      }

      return $dependencies;
    }

    /**
     * Gibt die Berechtigungsstufe für einen Nutzer und ein Verfahren zurück.
     *
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

      $permLevel = 0; # Standardmäßig keine Berechtigung

      # Prüfe Leseberechtigung
      # Gibt keine Reihe zurück bei keinen Berechtigungen; gibt 0 als Perm zurück bei Leseberechtigung und 1 bei Schreibberechtigung
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

      # Wenn keine Rückgabe existiert wird $permLevel 0 behalten
      # Bei Rückgabe mit 1 existiert Schreibgerechtigung, sonst nur Leseberechtigung
      if(!empty($result)) {
        $permLevel = ((int) $result['Perm']) === 1 ? 2 : 1;
      }

      return $permLevel;
    }

    /**
     * Gibt die Vorschläge für Eingabefelder zurück.
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
     * Gibt alle Dokumente zurück, die an eine Dokumentation angehangen sind.
     *
     * @param  int      $verfahrensId ID einer Dokumentation
     * @return mixed[] Array mit den Einträgen in der Form [['DocID' => 1, 'ProcessID' => 2, 'Description' => 'Test', 'FileRef' => 'test.pdf', 'FileSize' => 1200, 'Attach' => 0, 'Date' => '2020-09-08 12:06:18']]
     * @throws PDOException
     * @throws Exception
     */
    public function listDocuments($verfahrensId) {
      if(!$this->isConnected()) {
        throw new Exception("DBCon.class.php -> Keine aktive Datenbank-Verbindung!");
      }

      $sql = 'SELECT * FROM documents WHERE ProcessID = ? ORDER BY DocID ASC;';

      $sth = $this->pdo->prepare($sql);

      $sth->execute([$verfahrensId]);

      ob_start();
      $sth->debugDumpParams();
      $sqlDump = ob_get_clean();
      print "DBCon.class.php -> getDocuments() Execute: $sqlDump";

      return $sth->fetchAll();
    }

    /**
     * Gibt die Detals zu einem Dokument zurück.
     *
     * @param  int      $docID        ID eines Dokuments
     * @return mixed[] Array mit den Einträgen in der Form ['DocID' => 1, 'ProcessID' => 2, 'Description' => 'Test', 'FileRef' => 'test.pdf', 'FileSize' => 1200, 'Attach' => 0, 'Date' => '2020-09-08 12:06:18']
     * @throws PDOException
     * @throws Exception
     */
    public function getDocumentDetails($docID) {
      if(!$this->isConnected()) {
        throw new Exception("DBCon.class.php -> Keine aktive Datenbank-Verbindung!");
      }

      $sql = 'SELECT * FROM documents WHERE DocID = ? LIMIT 1;';

      $sth = $this->pdo->prepare($sql);

      $sth->execute([$docID]);

      ob_start();
      $sth->debugDumpParams();
      $sqlDump = ob_get_clean();
      print "DBCon.class.php -> getDocumentDetails() Execute: $sqlDump";

      $result = $sth->fetchAll();

      if(empty($result)) return [];

      return $result[0];
    }

    /**
     * Fügt ein angehängtes Dokument hinzu.
     *
     * @param  int      $verfahrensId ID einer Dokumentation
     * @param  string   $description  Beschreibung des Dokuments
     * @param  string   $fileRef      Dateireferenz
     * @param  int      $fileSize     Dateigröße in Bytes
     * @param  bool     $attach       Gibt an, ob die Datei an die Abschluss-PDF angehängt werden soll
     * @return int ID des neuen Dokuments; -1 bei fehlenden Berechtigungen
     * @throws PDOException
     * @throws Exception
     */
    public function addDocument($verfahrensId, $description, $fileRef, $fileSize, $attach) {
      if(!$this->isConnected()) {
        throw new Exception("DBCon.class.php -> Keine aktive Datenbank-Verbindung!");
      }

      $sql = 'INSERT INTO documents (ProcessID, Description, FileRef, FileSize, Attach) VALUES (?, ?, ?, ?, ?);';

      $sth = $this->pdo->prepare($sql);

      $sth->execute([$verfahrensId, $description, $fileRef, $fileSize, ($attach ? 1 : 0)]);

      ob_start();
      $sth->debugDumpParams();
      $sqlDump = ob_get_clean();
      print "DBCon.class.php -> addDocument() Execute: $sqlDump";

      $changedRows = $sth->rowCount();
      if($changedRows !== 1) {
        throw new Exception("DBCon.class.php -> Fehler beim Hinzufügen eines Dokuments! (Fehler: Unbekannter Fehler - Anzahl geänderter Reihen: $changedRows)");
      }

      # ID des neuen Dokuments holen
      $sth = $this->pdo->prepare('SELECT last_insert_rowid();');
      $sth->execute();

      ob_start();
      $sth->debugDumpParams();
      $sqlDump = ob_get_clean();
      print "DBCon.class.php -> addDocument() Execute: $sqlDump";

      $docID = $sth->fetch()['last_insert_rowid()'];

      if($docID === FALSE || !is_numeric($docID)) {
        throw new Exception("DBCon.class.php -> Fehler beim Hinzufügen eines Dokuments! (Fehler: ID des neuen Dokuments konnte nicht abgefragt werden (Wert: $docID))");
      }

      return $docID;
    }

    /**
     * Aktualisiert ein angehängtes Dokument.
     *
     * @param  int      $docID        ID eines Dokuments
     * @param  string   $description  Neue Beschreibung des Dokuments
     * @param  string   $fileRef      Neue Dateireferenz
     * @param  int      $fileSize     Dateigröße in Bytes
     * @param  bool     $attach       Gibt an, ob die Datei an die Abschluss-PDF angehängt werden soll
     * @return bool TRUE bei Erfolg, sonst FALSE
     * @throws PDOException
     * @throws Exception
     */
    public function updateDocument($docID, $description, $fileRef, $fileSize, $attach) {
      if(!$this->isConnected()) {
        throw new Exception("DBCon.class.php -> Keine aktive Datenbank-Verbindung!");
      }

      $sql = 'UPDATE documents SET Description = ?, FileRef = ?, FileSize = ?, Attach = ?, Date = (datetime(CURRENT_TIMESTAMP, \'localtime\')) WHERE DocID = ?;';

      $sth = $this->pdo->prepare($sql);

      $sth->execute([$description, $fileRef, $fileSize, ($attach ? 1 : 0), $docID]);

      ob_start();
      $sth->debugDumpParams();
      $sqlDump = ob_get_clean();
      print "DBCon.class.php -> updateDocument() Execute: $sqlDump";

      $changedRows = $sth->rowCount();
      if($changedRows !== 1) {
        throw new Exception("DBCon.class.php -> Fehler beim Aktualisieren eines Dokuments! (Fehler: Unbekannter Fehler - Anzahl geänderter Reihen: $changedRows)");
      }

      return TRUE;
    }

    /**
     * Löscht ein angehängtes Dokument.
     *
     * @param  int      $docID        ID eines Dokuments
     * @return bool TRUE bei Erfolg, sonst FALSE
     * @throws PDOException
     * @throws Exception
     */
    public function deleteDocument($docID) {
      if(!$this->isConnected()) {
        throw new Exception("DBCon.class.php -> Keine aktive Datenbank-Verbindung!");
      }

      $sql = 'DELETE FROM documents WHERE DocID = ?;';

      $sth = $this->pdo->prepare($sql);

      $sth->execute([$docID]);

      ob_start();
      $sth->debugDumpParams();
      $sqlDump = ob_get_clean();
      print "DBCon.class.php -> updateDocument() Execute: $sqlDump";

      $changedRows = $sth->rowCount();
      if($changedRows !== 1) {
        throw new Exception("DBCon.class.php -> Fehler beim Aktualisieren eines Dokuments! (Fehler: Unbekannter Fehler - Anzahl geänderter Reihen: $changedRows)");
      }

      return TRUE;
    }

    /**
     * Fügt einen Revisionseintrag hinzu.
     *
     * @param int    $verfahrensId ID einer Dokumentation
     * @param string $comment      Revisionskommentar
     * @param string $editor       Name des Bearbeiters
     * @return bool TRUE
     * @throws PDOException
     * @throws Exception
     */
    public function addRevision($verfahrensId, $comment, $editor) {
      if(!$this->isConnected()) {
        throw new Exception("DBCon.class.php -> Keine aktive Datenbank-Verbindung!");
      }

      # Letzte Revision holen
      $sql = 'SELECT * FROM revisions WHERE ProcessID = ? ORDER BY Revision DESC LIMIT 1;';
      $sth1 = $this->pdo->prepare($sql);
      $sth1->execute([$verfahrensId]);

      ob_start();
      $sth1->debugDumpParams();
      $sqlDump = ob_get_clean();
      print "DBCon.class.php -> addRevision() Execute: $sqlDump";

      $lastRevision = $sth1->fetch();

      if(empty($lastRevision)) {
        $newRevisionNumber = 1;
      }
      else {
        $newRevisionNumber = intval($lastRevision['Revision']) + 1;
      }

      # Neue Revision eintragen
      $sql = 'INSERT INTO revisions (ProcessID, Revision, Comment, Editor) VALUES (?, ?, ?, ?);';

      $sth2 = $this->pdo->prepare($sql);
      $sth2->execute([$verfahrensId, $newRevisionNumber, $comment, $editor]);

      ob_start();
      $sth2->debugDumpParams();
      $sqlDump = ob_get_clean();
      print "DBCon.class.php -> addRevision() Execute: $sqlDump";

      $changedRows = $sth2->rowCount();
      if($changedRows !== 1) {
        throw new Exception("DBCon.class.php -> Fehler beim Hinzufügen der Revision! (Fehler: Unbekannter Fehler - Anzahl geänderter Reihen: $changedRows)");
      }

      return TRUE;
    }

    /**
     * Listet die Revisionen einer Dokumentation auf.
     *
     * @param int    $verfahrensId ID einer Dokumentation
     * @return mixed[] Liste der Revisionen [['ProcessID' => 1, 'Revision' => 2, 'Comment' => 'Test', 'Editr' => 'Name', 'Date' => '20202-09-15'],...]
     * @throws PDOException
     * @throws Exception
     */
    public function listRevisions($verfahrensId) {
      if(!$this->isConnected()) {
        throw new Exception("DBCon.class.php -> Keine aktive Datenbank-Verbindung!");
      }

      # Letzte Revision holen
      $sql = 'SELECT * FROM revisions WHERE ProcessID = ? ORDER BY Revision DESC;';
      $sth1 = $this->pdo->prepare($sql);
      $sth1->execute([$verfahrensId]);

      ob_start();
      $sth1->debugDumpParams();
      $sqlDump = ob_get_clean();
      print "DBCon.class.php -> listRevisions() Execute: $sqlDump";

      $lastRevisions = $sth1->fetchAll();

      if(empty($lastRevisions)) {
        return [];
      }
      else {
        return $lastRevisions;
      }
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
