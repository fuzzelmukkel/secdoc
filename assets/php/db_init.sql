BEGIN TRANSACTION;
PRAGMA user_version = 10;
PRAGMA foreign_keys = ON;
CREATE TABLE IF NOT EXISTS verfahren (
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
);
CREATE TABLE IF NOT EXISTS verfahren_historie (
	Verfahrens_Id INTEGER,                                         -- Die eindeutige ID eines Verfahrens
	Kennung VARCHAR(8) NOT NULL,                                   -- Nutzerkennung des bearbeitenden Nutzers
	Datum DATE DEFAULT (datetime(CURRENT_TIMESTAMP, 'localtime')), -- Aktuelles Datum
	PRIMARY KEY (Verfahrens_Id, Kennung, Datum),
	FOREIGN KEY (Verfahrens_Id) REFERENCES verfahren(ID) ON UPDATE CASCADE ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS personen (
	Kennung VARCHAR(8) PRIMARY KEY ON CONFLICT IGNORE, -- Eindeutige Nutzerkennung
	Name TEXT,                                         -- Name der Person
	Anzeigename TEXT,                                  -- Anzeigename mit Name, Anschrift, Telefon, E-Mail
	Datenquelle VARCHAR(50) DEFAULT ''                 -- Hinweis auf die genutzte Quelle für die Daten
);
CREATE TABLE IF NOT EXISTS organisationseinheiten (
	Org_Id TEXT PRIMARY KEY ON CONFLICT IGNORE, -- ID der Organisationseinheit
	Name TEXT                                   -- Name der Organisationseinheit
);
CREATE TABLE IF NOT EXISTS ivven (
	Name TEXT PRIMARY KEY ON CONFLICT IGNORE  -- Name der IVV
);
CREATE TABLE IF NOT EXISTS cpe (
	CPE TEXT PRIMARY KEY ON CONFLICT REPLACE, -- CPE-Nummer
	Name TEXT,                                -- Name des CPE Eintrags
	Typ TEXT                                  -- Typ des Eintrags (a für Applikation, o für Betriebssystem, h für Hardware)
);
CREATE TABLE IF NOT EXISTS permissions (
	Process_ID INT,                 -- Process identifier
	ID TEXT NOT NULL,               -- User or group ID
	IsGroup INT NOT NULL DEFAULT 0, -- Is given ID a group? (0 = user ID, 1 = group ID)
	CanEdit INT NOT NULL DEFAULT 0, -- Can user/group edit? (0 = read only, 1 = full access)
	PRIMARY KEY (Process_ID, ID),
	FOREIGN KEY (Process_ID) REFERENCES verfahren(ID) ON UPDATE CASCADE ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS suggestions (
	Field TEXT NOT NULL,                       -- Input field using this suggestion
	Lang VARCHAR(2) DEFAULT 'de',              -- Language
	Entry TEXT NOT NULL,                       -- Suggestion
	AdditionalInfo TEXT NOT NULL DEFAULT '{}', -- Additional space for informations (e.g. JSON-String)
	PRIMARY KEY (Field, Lang, Entry)
);
CREATE TABLE IF NOT EXISTS dependency (
	Dependent INT,                             -- Process identifier of dependent process
	Dependency INT,                            -- Process identifier of process the dependent depends on
	PRIMARY KEY (Dependent, Dependency),
	FOREIGN KEY (Dependent) REFERENCES verfahren(ID) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (Dependency) REFERENCES verfahren(ID) ON UPDATE CASCADE ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS toms (
	Identifier VARCHAR(10),            -- Unique identifier across one language, e.g. APP.1.1.A1
	Category TEXT NOT NULL,            -- Grouping for multiple TOMs, e.g. APP - Anwendungen
	Subcategory TEXT DEFAULT '',       -- Secondary level grouping, e.g. APP.1.1 Office-Produkte
	Title TEXT DEFAULT '',             -- Short title for TOM, e.g. Sicherstellen der Integrität von Office-Produkten
	Description TEXT NOT NULL,         -- Full description
	URL TEXT DEFAULT '',               -- URL, e.g. for BSI web site
	Risklevel  INT NOT NULL DEFAULT 1, -- Risklevel where this is needed (1 = Low, 2 = Medium, 3 = High)
	PRIMARY KEY (Identifier)
);
CREATE TABLE IF NOT EXISTS rollen (                 -- Rollen aus dem BSI IT-Grundschutz-Kompendium
	RoleID INT NOT NULL DEFAULT 0,     -- ID der Rolle
	Rolle VARCHAR(128),                -- Name der Rolle
	PRIMARY KEY (RoleID)
);
CREATE TABLE IF NOT EXISTS ebene_rollen (           -- Zuweisung von Rollen zu Ebenen
	EbeneID INT NOT NULL DEFAULT 0,    -- ID der Ebene (1 - Verarbeitungstätigkeit, 2 - Fachapplikation, 3 - IT-Verfahren)
	RoleID INT NOT NULL DEFAULT 0,     -- ID der Rolle (siehe Tabelle rollen)
	PRIMARY KEY (EbeneID, RoleID),
	FOREIGN KEY (RoleID) REFERENCES rollen(RoleID) ON UPDATE CASCADE ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS tom_rollen (             -- Zuweisung von TOMs zu Rollen
	TOMID VARCHAR(10),                 -- ID der TOM (siehe Tabelle toms)
	RoleID INT NOT NULL DEFAULT 0,     -- ID der Rolle (siehe Tabelle rollen)
	PRIMARY KEY (TOMID, RoleID),
	FOREIGN KEY (TOMID) REFERENCES toms(Identifier) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (RoleID) REFERENCES rollen(RoleID) ON UPDATE CASCADE ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS toms_desc ( -- Beschreibungen zu Bausteinen
	Identifier TEXT,      -- ID des Bausteins
	Description TEXT,     -- Beschreibung
	Objective TEXT,       -- Zielsetzung
	Delimit TEXT,         -- Abgrenzung
	URL TEXT DEFAULT '',  -- URL
	PRIMARY KEY (Identifier)
);
END TRANSACTION;