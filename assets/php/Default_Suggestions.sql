BEGIN TRANSACTION;
DELETE FROM suggestions;
INSERT INTO suggestions (Field, Entry) VALUES ("daten_grundlagen_bezeichnung", "Art. 6 (1) a) - Einwilligung");
INSERT INTO suggestions (Field, Entry) VALUES ("daten_grundlagen_bezeichnung", "Art. 6 (1) b) - Vertragserfüllung");
INSERT INTO suggestions (Field, Entry) VALUES ("daten_grundlagen_bezeichnung", "Art. 6 (1) c) - Rechtliche Verpflichtung");
INSERT INTO suggestions (Field, Entry) VALUES ("daten_grundlagen_bezeichnung", "Art. 6 (1) d) - Lebenswichtige Interessen");
INSERT INTO suggestions (Field, Entry) VALUES ("daten_grundlagen_bezeichnung", "Art. 6 (1) e) - Öffentliches Interesse");
INSERT INTO suggestions (Field, Entry) VALUES ("daten_grundlagen_bezeichnung", "Art. 6 (1) f) - Berechtigte Interessen");
INSERT INTO suggestions (Field, Entry) VALUES ("daten_kategorien_beschreibung", "Name");
INSERT INTO suggestions (Field, Entry) VALUES ("daten_kategorien_beschreibung", "E-Mail");
INSERT INTO suggestions (Field, Entry) VALUES ("daten_kategorien_beschreibung", "Kennung");
INSERT INTO suggestions (Field, Entry) VALUES ("daten_kategorien_beschreibung", "Anschrift");
INSERT INTO suggestions (Field, Entry) VALUES ("daten_personen_betroffene", "Rektorat");
INSERT INTO suggestions (Field, Entry) VALUES ("daten_personen_betroffene", "Hochschulrat");
INSERT INTO suggestions (Field, Entry) VALUES ("daten_personen_betroffene", "Dekane");
INSERT INTO suggestions (Field, Entry) VALUES ("daten_personen_betroffene", "Professoren");
INSERT INTO suggestions (Field, Entry) VALUES ("daten_personen_betroffene", "Juniorprofessoren");
INSERT INTO suggestions (Field, Entry) VALUES ("daten_personen_betroffene", "Wissenschaftliche Mitarbeiter");
INSERT INTO suggestions (Field, Entry) VALUES ("daten_personen_betroffene", "Künstlerische Mitarbeiter");
INSERT INTO suggestions (Field, Entry) VALUES ("daten_personen_betroffene", "Mitarbeiter");
INSERT INTO suggestions (Field, Entry) VALUES ("daten_personen_betroffene", "Nebenberufliche Professoren");
INSERT INTO suggestions (Field, Entry) VALUES ("daten_personen_betroffene", "Entpflichtete Professoren");
INSERT INTO suggestions (Field, Entry) VALUES ("daten_personen_betroffene", "Privatdozenten");
INSERT INTO suggestions (Field, Entry) VALUES ("daten_personen_betroffene", "Studierende");
INSERT INTO suggestions (Field, Entry) VALUES ("daten_personen_betroffene", "Wissenschaftliche Hilfskräfte");
INSERT INTO suggestions (Field, Entry) VALUES ("daten_personen_betroffene", "Ehrenbürger");
INSERT INTO suggestions (Field, Entry) VALUES ("daten_personen_betroffene", "Ehrensenatoren");
INSERT INTO suggestions (Field, Entry) VALUES ("daten_personen_betroffene", "Zweithörer");
INSERT INTO suggestions (Field, Entry) VALUES ("daten_personen_betroffene", "Gasthörer");
INSERT INTO suggestions (Field, Entry) VALUES ("daten_personen_betroffene", "Alumni");
INSERT INTO suggestions (Field, Entry) VALUES ("daten_personen_betroffene", "Studienbewerber");
INSERT INTO suggestions (Field, Entry) VALUES ("daten_personen_betroffene", "Bewerber um eine Beschäftigung");
INSERT INTO suggestions (Field, Entry) VALUES ("daten_personen_betroffene", "Ausgeschiedene Mitglieder");
INSERT INTO suggestions (Field, Entry) VALUES ("daten_personen_betroffene", "Ausgeschiedene Angehörige");
INSERT INTO suggestions (Field, Entry) VALUES ("daten_personen_betroffene", "Förderer, Fördergesellschaften");
INSERT INTO suggestions (Field, Entry) VALUES ("daten_personen_betroffene", "Kooperationen");
INSERT INTO suggestions (Field, Entry) VALUES ("daten_personen_betroffene", "Sonstige");
INSERT INTO suggestions (Field, Entry) VALUES ("daten_personen_betroffene", "Ausgründungen");
INSERT INTO suggestions (Field, Entry) VALUES ("daten_personen_betroffene", "An-Institute");
INSERT INTO suggestions (Field, Entry) VALUES ("daten_personen_betroffene", "Geschäftspartner, Kunden, Lieferanten");
INSERT INTO suggestions VALUES('daten_kategorien_herkunft','de','Beim Nutzer erhoben','{}');
INSERT INTO suggestions VALUES('daten_kategorien_herkunft','de','IDM','{}');
INSERT INTO suggestions VALUES('daten_loeschung_frist','de','7 Tage','{}');
INSERT INTO suggestions VALUES('daten_loeschung_frist','de','Nach Exmatrikulation','{}');
INSERT INTO suggestions VALUES('daten_kategorien_herkunft','de','Studierendensekretariat','{}');
INSERT INTO suggestions VALUES('daten_kategorien_herkunft','de','Personaldezernat','{}');
INSERT INTO suggestions VALUES('daten_loeschung_frist','de','Nach Kündigung','{}');
INSERT INTO suggestions VALUES('datenzugriff_empfaenger_intern_stelle','de','Zentrum für Informationsverarbeitung','{}');
INSERT INTO suggestions VALUES('datenzugriff_zugriff_personen','de','Administratoren','{}');
INSERT INTO suggestions VALUES('datenzugriff_zugriff_personen','de','Mitarbeiter','{}');
INSERT INTO suggestions VALUES('datenzugriff_zugriff_personen','de','Studenten','{}');
INSERT INTO suggestions VALUES('datenzugriff_zugriff_umfang','de','Einsehen von Logdaten','{}');
INSERT INTO suggestions VALUES('datenzugriff_zugriff_umfang','de','Vollzugriff','{}');
INSERT INTO suggestions VALUES('datenzugriff_zugriff_umfang','de','Auf eigene Daten beschränkter Zugriff','{}');
INSERT INTO suggestions VALUES('systeme_software_art','de','Datenbank','{}');
INSERT INTO suggestions VALUES('systeme_software_art','de','Webserver','{}');
INSERT INTO suggestions VALUES('systeme_software_art','de','Office-Anwendung','{}');
INSERT INTO suggestions VALUES('systeme_software_art','de','Versionsverwaltung','{}');
INSERT INTO suggestions VALUES('systeme_software_art','de','Konfigurationsmanagement','{}');
INSERT INTO suggestions VALUES('systeme_klienten_typ','de','Desktop','{}');
INSERT INTO suggestions VALUES('systeme_klienten_typ','de','Laptop','{}');
INSERT INTO suggestions VALUES('systeme_klienten_typ','de','Tablet','{}');
INSERT INTO suggestions VALUES('systeme_klienten_typ','de','Smartphone','{}');
INSERT INTO suggestions VALUES('systeme_server_funktion','de','Datenbankserver','{}');
INSERT INTO suggestions VALUES('systeme_server_funktion','de','Webserver','{}');
INSERT INTO suggestions VALUES('systeme_server_funktion','de','Fileserver','{}');
INSERT INTO suggestions VALUES('systeme_server_funktion','de','Backupserver','{}');
INSERT INTO suggestions VALUES('systeme_datensicherung_medium','de','Festplatten','{}');
INSERT INTO suggestions VALUES('systeme_datensicherung_medium','de','Bandlaufwerk','{}');
INSERT INTO suggestions VALUES('systeme_protokolle_protokoll','de','HTTP','{}');
INSERT INTO suggestions VALUES('systeme_protokolle_protokoll','de','HTTPS','{}');
INSERT INTO suggestions VALUES('systeme_protokolle_protokoll','de','IMAP','{}');
INSERT INTO suggestions VALUES('systeme_protokolle_protokoll','de','FTP','{}');
INSERT INTO suggestions VALUES('systeme_protokolle_protokoll','de','SSH','{}');
INSERT INTO suggestions VALUES('allgemein_zweck','de','Verwaltung von E-Mails','{}');
INSERT INTO suggestions VALUES('allgemein_zweck','de','Verwaltung von Prüfungsdaten','{}');
INSERT INTO suggestions (Field, Entry) VALUES ('allgemein_bezeichnung', 'E-Learning-Angebot');
INSERT INTO suggestions (Field, Entry) VALUES ('allgemein_bezeichnung', 'Web-Content-Management-System');
INSERT INTO suggestions (Field, Entry) VALUES ('allgemein_bezeichnung', 'Benutzerverwaltung');
INSERT INTO suggestions (Field, Entry) VALUES ('allgemein_bezeichnung', 'E-Mail Service');
INSERT INTO suggestions (Field, Entry) VALUES ('allgemein_bezeichnung', 'Dateiserver');
INSERT INTO suggestions (Field, Entry) VALUES ('allgemein_bezeichnung', 'Raumvergabesystem');
END TRANSACTION;
