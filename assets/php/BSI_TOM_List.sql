begin transaction;
delete from ebene_rollen;
delete from tom_rollen;
delete from rollen;
delete from toms;
insert into rollen (RoleID, Rolle) values (1, 'Anforderungsmanager (Compliance Manager)');
insert into rollen (RoleID, Rolle) values (2, 'Archivverwalter');
insert into rollen (RoleID, Rolle) values (3, 'Auditteam');
insert into rollen (RoleID, Rolle) values (4, 'Bauleiter');
insert into rollen (RoleID, Rolle) values (5, 'Benutzer');
insert into rollen (RoleID, Rolle) values (6, 'Bereichssicherheitsbeauftragter');
insert into rollen (RoleID, Rolle) values (7, 'Beschaffer');
insert into rollen (RoleID, Rolle) values (8, 'Beschaffungsstelle');
insert into rollen (RoleID, Rolle) values (9, 'Betriebsleiter');
insert into rollen (RoleID, Rolle) values (10, 'Brandschutzbeauftragter');
insert into rollen (RoleID, Rolle) values (11, 'Datenschutzbeauftragter');
insert into rollen (RoleID, Rolle) values (12, 'Entwickler');
insert into rollen (RoleID, Rolle) values (13, 'Ermittler');
insert into rollen (RoleID, Rolle) values (14, 'Ermittlungsleiter');
insert into rollen (RoleID, Rolle) values (15, 'Errichterfirma');
insert into rollen (RoleID, Rolle) values (16, 'Fachabteilung');
insert into rollen (RoleID, Rolle) values (17, 'Fachverantwortliche');
insert into rollen (RoleID, Rolle) values (18, 'Fax-Verantwortlicher');
insert into rollen (RoleID, Rolle) values (19, 'Haustechnik');
insert into rollen (RoleID, Rolle) values (20, 'Hersteller');
insert into rollen (RoleID, Rolle) values (21, 'ICS-Administrator');
insert into rollen (RoleID, Rolle) values (22, 'ICS-Informationssicherheitsbeauftragter');
insert into rollen (RoleID, Rolle) values (23, 'IS-Revisionsteam');
insert into rollen (RoleID, Rolle) values (24, 'IT-Betrieb');
insert into rollen (RoleID, Rolle) values (25, 'Informationssicherheitsbeauftragter (ISB)');
insert into rollen (RoleID, Rolle) values (26, 'Innerer Dienst');
insert into rollen (RoleID, Rolle) values (27, 'Institutionsleitung');
insert into rollen (RoleID, Rolle) values (28, 'Leiter Beschaffung');
insert into rollen (RoleID, Rolle) values (29, 'Leiter Entwicklung');
insert into rollen (RoleID, Rolle) values (30, 'Leiter Haustechnik');
insert into rollen (RoleID, Rolle) values (31, 'Leiter IT');
insert into rollen (RoleID, Rolle) values (32, 'Leiter Netze');
insert into rollen (RoleID, Rolle) values (33, 'Leiter Organisation');
insert into rollen (RoleID, Rolle) values (34, 'Leiter Personal');
insert into rollen (RoleID, Rolle) values (35, 'Leiter Produktion und Fertigung');
insert into rollen (RoleID, Rolle) values (36, 'Leitstellen-Operator');
insert into rollen (RoleID, Rolle) values (37, 'Mitarbeiter');
insert into rollen (RoleID, Rolle) values (38, 'Notfallbeauftragter');
insert into rollen (RoleID, Rolle) values (39, 'Personalabteilung');
insert into rollen (RoleID, Rolle) values (40, 'Planer');
insert into rollen (RoleID, Rolle) values (41, 'Pressestelle');
insert into rollen (RoleID, Rolle) values (42, 'TK-Anlagen-Verantwortlicher');
insert into rollen (RoleID, Rolle) values (43, 'Telearbeiter');
insert into rollen (RoleID, Rolle) values (44, 'Tester');
insert into rollen (RoleID, Rolle) values (45, 'Verantwortlicher für die IS-Revision');
insert into rollen (RoleID, Rolle) values (46, 'Vorgesetzte');
insert into rollen (RoleID, Rolle) values (47, 'Wartungspersonal');
insert into rollen (RoleID, Rolle) values (48, 'Änderungsmanager');
insert into ebene_rollen (EbeneID, RoleID) values (4, 1); -- Anforderungsmanager (Compliance Manager)
insert into ebene_rollen (EbeneID, RoleID) values (2, 2); -- Archivverwalter
insert into ebene_rollen (EbeneID, RoleID) values (4, 3); -- Auditteam
insert into ebene_rollen (EbeneID, RoleID) values (3, 4); -- Bauleiter
insert into ebene_rollen (EbeneID, RoleID) values (1, 5); -- Benutzer
insert into ebene_rollen (EbeneID, RoleID) values (2, 5); -- Benutzer
insert into ebene_rollen (EbeneID, RoleID) values (4, 6); -- Bereichssicherheitsbeauftragter
insert into ebene_rollen (EbeneID, RoleID) values (2, 7); -- Beschaffer
insert into ebene_rollen (EbeneID, RoleID) values (2, 8); -- Beschaffungsstelle
insert into ebene_rollen (EbeneID, RoleID) values (4, 9); -- Betriebsleiter
insert into ebene_rollen (EbeneID, RoleID) values (3, 10); -- Brandschutzbeauftragter
insert into ebene_rollen (EbeneID, RoleID) values (4, 11); -- Datenschutzbeauftragter
insert into ebene_rollen (EbeneID, RoleID) values (2, 12); -- Entwickler
insert into ebene_rollen (EbeneID, RoleID) values (4, 13); -- Ermittler
insert into ebene_rollen (EbeneID, RoleID) values (4, 14); -- Ermittlungsleiter
insert into ebene_rollen (EbeneID, RoleID) values (4, 15); -- Errichterfirma
insert into ebene_rollen (EbeneID, RoleID) values (2, 16); -- Fachabteilung
insert into ebene_rollen (EbeneID, RoleID) values (2, 17); -- Fachverantwortliche
insert into ebene_rollen (EbeneID, RoleID) values (2, 18); -- Fax-Verantwortlicher
insert into ebene_rollen (EbeneID, RoleID) values (3, 19); -- Haustechnik
insert into ebene_rollen (EbeneID, RoleID) values (3, 20); -- Hersteller
insert into ebene_rollen (EbeneID, RoleID) values (3, 21); -- ICS-Administrator
insert into ebene_rollen (EbeneID, RoleID) values (4, 22); -- ICS-Informationssicherheitsbeauftragter
insert into ebene_rollen (EbeneID, RoleID) values (4, 23); -- IS-Revisionsteam
insert into ebene_rollen (EbeneID, RoleID) values (3, 24); -- IT-Betrieb
insert into ebene_rollen (EbeneID, RoleID) values (4, 25); -- Informationssicherheitsbeauftragter (ISB)
insert into ebene_rollen (EbeneID, RoleID) values (2, 26); -- Innerer Dienst
insert into ebene_rollen (EbeneID, RoleID) values (2, 27); -- Institutionsleitung
insert into ebene_rollen (EbeneID, RoleID) values (2, 28); -- Leiter Beschaffung
insert into ebene_rollen (EbeneID, RoleID) values (2, 29); -- Leiter Entwicklung
insert into ebene_rollen (EbeneID, RoleID) values (3, 30); -- Leiter Haustechnik
insert into ebene_rollen (EbeneID, RoleID) values (3, 31); -- Leiter IT
insert into ebene_rollen (EbeneID, RoleID) values (3, 32); -- Leiter Netze
insert into ebene_rollen (EbeneID, RoleID) values (2, 33); -- Leiter Organisation
insert into ebene_rollen (EbeneID, RoleID) values (2, 34); -- Leiter Personal
insert into ebene_rollen (EbeneID, RoleID) values (3, 35); -- Leiter Produktion und Fertigung
insert into ebene_rollen (EbeneID, RoleID) values (4, 36); -- Leitstellen-Operator
insert into ebene_rollen (EbeneID, RoleID) values (1, 37); -- Mitarbeiter
insert into ebene_rollen (EbeneID, RoleID) values (4, 38); -- Notfallbeauftragter
insert into ebene_rollen (EbeneID, RoleID) values (2, 39); -- Personalabteilung
insert into ebene_rollen (EbeneID, RoleID) values (2, 40); -- Planer
insert into ebene_rollen (EbeneID, RoleID) values (2, 41); -- Pressestelle
insert into ebene_rollen (EbeneID, RoleID) values (4, 42); -- TK-Anlagen-Verantwortlicher
insert into ebene_rollen (EbeneID, RoleID) values (1, 43); -- Telearbeiter
insert into ebene_rollen (EbeneID, RoleID) values (2, 44); -- Tester
insert into ebene_rollen (EbeneID, RoleID) values (4, 45); -- Verantwortlicher für die IS-Revision
insert into ebene_rollen (EbeneID, RoleID) values (4, 46); -- Vorgesetzte
insert into ebene_rollen (EbeneID, RoleID) values (3, 47); -- Wartungspersonal
insert into ebene_rollen (EbeneID, RoleID) values (2, 48); -- Änderungsmanager
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.1.1.A1', 'APP - Anwendungen', 'APP.1.1 Office-Produkte', 'APP.1.1.A1 Sicherstellen der Integrität von Office-Produkten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_1_1_Office-Produkte.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.1.1.A10', 'APP - Anwendungen', 'APP.1.1 Office-Produkte', 'APP.1.1.A10 Regelung der Software-Entwicklung durch Endbenutzer', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_1_1_Office-Produkte.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.1.1.A11', 'APP - Anwendungen', 'APP.1.1 Office-Produkte', 'APP.1.1.A11 Geregelter Einsatz von Erweiterungen für Office-Produkte', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_1_1_Office-Produkte.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.1.1.A12', 'APP - Anwendungen', 'APP.1.1 Office-Produkte', 'APP.1.1.A12 Verzicht auf Cloud-Speicherung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_1_1_Office-Produkte.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.1.1.A13', 'APP - Anwendungen', 'APP.1.1 Office-Produkte', 'APP.1.1.A13 Verwendung von Viewer-Funktionen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_1_1_Office-Produkte.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.1.1.A14', 'APP - Anwendungen', 'APP.1.1 Office-Produkte', 'APP.1.1.A14 Schutz gegen nachträgliche Veränderungen von Dokumenten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_1_1_Office-Produkte.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.1.1.A15', 'APP - Anwendungen', 'APP.1.1 Office-Produkte', 'APP.1.1.A15 Einsatz von Verschlüsselung und Digitalen Signaturen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_1_1_Office-Produkte.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.1.1.A16', 'APP - Anwendungen', 'APP.1.1 Office-Produkte', 'APP.1.1.A16 Integritätsprüfung von Dokumenten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_1_1_Office-Produkte.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.1.1.A2', 'APP - Anwendungen', 'APP.1.1 Office-Produkte', 'APP.1.1.A2 Einschränken von Aktiven Inhalten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_1_1_Office-Produkte.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.1.1.A3', 'APP - Anwendungen', 'APP.1.1 Office-Produkte', 'APP.1.1.A3 Sicheres Öffnen von Dokumenten aus externen Quellen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_1_1_Office-Produkte.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.1.1.A4', 'APP - Anwendungen', 'APP.1.1 Office-Produkte', 'APP.1.1.A4 Absichern des laufenden Betriebs von Office-Produkten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_1_1_Office-Produkte.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.1.1.A5', 'APP - Anwendungen', 'APP.1.1 Office-Produkte', 'APP.1.1.A5 Auswahl geeigneter Office-Produkte', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_1_1_Office-Produkte.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.1.1.A6', 'APP - Anwendungen', 'APP.1.1 Office-Produkte', 'APP.1.1.A6 Testen neuer Versionen von Office-Produkten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_1_1_Office-Produkte.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.1.1.A7', 'APP - Anwendungen', 'APP.1.1 Office-Produkte', 'APP.1.1.A7 Installation und sichere Standardkonfiguration von Office-Produkten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_1_1_Office-Produkte.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.1.1.A8', 'APP - Anwendungen', 'APP.1.1 Office-Produkte', 'APP.1.1.A8 Regelmäßige Versionskontrolle von Office-Produkten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_1_1_Office-Produkte.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.1.1.A9', 'APP - Anwendungen', 'APP.1.1 Office-Produkte', 'APP.1.1.A9 Beseitigung von Restinformationen vor Weitergabe von Dokumenten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_1_1_Office-Produkte.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.1.2.A1', 'APP - Anwendungen', 'APP.1.2 Webbrowser', 'APP.1.2.A1 Verwendung von Sandboxing', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_1_2_Webbrowser.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.1.2.A10', 'APP - Anwendungen', 'APP.1.2 Webbrowser', 'APP.1.2.A10 Verwendung des privaten Modus', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_1_2_Webbrowser.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.1.2.A11', 'APP - Anwendungen', 'APP.1.2 Webbrowser', 'APP.1.2.A11 Überprüfung auf schädliche Inhalte', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_1_2_Webbrowser.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.1.2.A12', 'APP - Anwendungen', 'APP.1.2 Webbrowser', 'APP.1.2.A12 Zwei-Browser-Strategie', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_1_2_Webbrowser.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.1.2.A2', 'APP - Anwendungen', 'APP.1.2 Webbrowser', 'APP.1.2.A2 Unterstützung sicherer Verschlüsselung der Kommunikation', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_1_2_Webbrowser.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.1.2.A3', 'APP - Anwendungen', 'APP.1.2 Webbrowser', 'APP.1.2.A3 Verwendung von vertrauenswürdigen Zertifikaten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_1_2_Webbrowser.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.1.2.A4', 'APP - Anwendungen', 'APP.1.2 Webbrowser', 'APP.1.2.A4 Versionsprüfung und Aktualisierung des Webbrowsers', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_1_2_Webbrowser.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.1.2.A5', 'APP - Anwendungen', 'APP.1.2 Webbrowser', 'APP.1.2.A5 Verwendung einer zentralen Basiskonfiguration', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_1_2_Webbrowser.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.1.2.A6', 'APP - Anwendungen', 'APP.1.2 Webbrowser', 'APP.1.2.A6 Kennwortmanagement im Webbrowser', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_1_2_Webbrowser.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.1.2.A7', 'APP - Anwendungen', 'APP.1.2 Webbrowser', 'APP.1.2.A7 Datensparsamkeit in Webbrowsern', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_1_2_Webbrowser.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.1.2.A8', 'APP - Anwendungen', 'APP.1.2 Webbrowser', 'APP.1.2.A8 Verwendung von Plug-ins und Erweiterungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_1_2_Webbrowser.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.1.2.A9', 'APP - Anwendungen', 'APP.1.2 Webbrowser', 'APP.1.2.A9 Einsatz einer isolierten Webbrowser-Umgebung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_1_2_Webbrowser.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.1.4.A1', 'APP - Anwendungen', 'APP.1.4 Mobile Anwendungen (Apps)', 'APP.1.4.A1 Anforderungsanalyse für die Nutzung von Apps', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_1_4_Mobile_Anwendungen_(Apps).html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.1.4.A10', 'APP - Anwendungen', 'APP.1.4 Mobile Anwendungen (Apps)', 'APP.1.4.A10 Sichere Authentisierung von Apps', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_1_4_Mobile_Anwendungen_(Apps).html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.1.4.A11', 'APP - Anwendungen', 'APP.1.4 Mobile Anwendungen (Apps)', 'APP.1.4.A11 Zentrales Management von Apps', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_1_4_Mobile_Anwendungen_(Apps).html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.1.4.A12', 'APP - Anwendungen', 'APP.1.4 Mobile Anwendungen (Apps)', 'APP.1.4.A12 Sichere Deinstallation von Apps', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_1_4_Mobile_Anwendungen_(Apps).html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.1.4.A13', 'APP - Anwendungen', 'APP.1.4 Mobile Anwendungen (Apps)', 'APP.1.4.A13 Entwicklung von Fallback-Lösungen für Apps', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_1_4_Mobile_Anwendungen_(Apps).html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.1.4.A14', 'APP - Anwendungen', 'APP.1.4 Mobile Anwendungen (Apps)', 'APP.1.4.A14 Unterstützung zusätzlicher Authentisierungsmerkmale bei Apps', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_1_4_Mobile_Anwendungen_(Apps).html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.1.4.A15', 'APP - Anwendungen', 'APP.1.4 Mobile Anwendungen (Apps)', 'APP.1.4.A15 Durchführung von Penetrationstests für Apps', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_1_4_Mobile_Anwendungen_(Apps).html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.1.4.A2', 'APP - Anwendungen', 'APP.1.4 Mobile Anwendungen (Apps)', 'APP.1.4.A2 Regelungen für die Verwendung von mobilen Endgeräten und Apps', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_1_4_Mobile_Anwendungen_(Apps).html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.1.4.A3', 'APP - Anwendungen', 'APP.1.4 Mobile Anwendungen (Apps)', 'APP.1.4.A3 Verwendung sicherer Quellen für Apps', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_1_4_Mobile_Anwendungen_(Apps).html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.1.4.A4', 'APP - Anwendungen', 'APP.1.4 Mobile Anwendungen (Apps)', 'APP.1.4.A4 Test und Freigabe von Apps', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_1_4_Mobile_Anwendungen_(Apps).html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.1.4.A5', 'APP - Anwendungen', 'APP.1.4 Mobile Anwendungen (Apps)', 'APP.1.4.A5 Minimierung und Kontrolle von App-Berechtigungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_1_4_Mobile_Anwendungen_(Apps).html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.1.4.A6', 'APP - Anwendungen', 'APP.1.4 Mobile Anwendungen (Apps)', 'APP.1.4.A6 Patchmanagement für Apps', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_1_4_Mobile_Anwendungen_(Apps).html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.1.4.A7', 'APP - Anwendungen', 'APP.1.4 Mobile Anwendungen (Apps)', 'APP.1.4.A7 Sichere Speicherung lokaler App-Daten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_1_4_Mobile_Anwendungen_(Apps).html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.1.4.A8', 'APP - Anwendungen', 'APP.1.4 Mobile Anwendungen (Apps)', 'APP.1.4.A8 Verhinderung von Datenabfluss', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_1_4_Mobile_Anwendungen_(Apps).html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.1.4.A9', 'APP - Anwendungen', 'APP.1.4 Mobile Anwendungen (Apps)', 'APP.1.4.A9 Sichere Anbindung an Backend-Systeme', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_1_4_Mobile_Anwendungen_(Apps).html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.2.1.A1', 'APP - Anwendungen', 'APP.2.1 Allgemeiner Verzeichnisdienst', 'APP.2.1.A1 Erstellung einer Sicherheitsrichtlinie für Verzeichnisdienste', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_2_1_Allgemeiner_Verzeichnisdienst.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.2.1.A10', 'APP - Anwendungen', 'APP.2.1 Allgemeiner Verzeichnisdienst', 'APP.2.1.A10 Schulung zu Administration und Betrieb von Verzeichnisdiensten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_2_1_Allgemeiner_Verzeichnisdienst.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.2.1.A11', 'APP - Anwendungen', 'APP.2.1 Allgemeiner Verzeichnisdienst', 'APP.2.1.A11 Einrichtung des Zugriffs auf Verzeichnisdienste', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_2_1_Allgemeiner_Verzeichnisdienst.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.2.1.A12', 'APP - Anwendungen', 'APP.2.1 Allgemeiner Verzeichnisdienst', 'APP.2.1.A12 Überwachung von Verzeichnisdiensten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_2_1_Allgemeiner_Verzeichnisdienst.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.2.1.A13', 'APP - Anwendungen', 'APP.2.1 Allgemeiner Verzeichnisdienst', 'APP.2.1.A13 Absicherung der Kommunikation mit Verzeichnisdiensten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_2_1_Allgemeiner_Verzeichnisdienst.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.2.1.A14', 'APP - Anwendungen', 'APP.2.1 Allgemeiner Verzeichnisdienst', 'APP.2.1.A14 Geregelte Außerbetriebnahme eines Verzeichnisdienstes', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_2_1_Allgemeiner_Verzeichnisdienst.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.2.1.A15', 'APP - Anwendungen', 'APP.2.1 Allgemeiner Verzeichnisdienst', 'APP.2.1.A15 Migration von Verzeichnisdiensten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_2_1_Allgemeiner_Verzeichnisdienst.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.2.1.A16', 'APP - Anwendungen', 'APP.2.1 Allgemeiner Verzeichnisdienst', 'APP.2.1.A16 Erstellung eines Notfallplans für den Ausfall eines Verzeichnisdienstes', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_2_1_Allgemeiner_Verzeichnisdienst.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.2.1.A2', 'APP - Anwendungen', 'APP.2.1 Allgemeiner Verzeichnisdienst', 'APP.2.1.A2 Planung des Einsatzes von Verzeichnisdiensten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_2_1_Allgemeiner_Verzeichnisdienst.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.2.1.A3', 'APP - Anwendungen', 'APP.2.1 Allgemeiner Verzeichnisdienst', 'APP.2.1.A3 Einrichtung von Zugriffsberechtigungen auf Verzeichnisdienste', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_2_1_Allgemeiner_Verzeichnisdienst.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.2.1.A4', 'APP - Anwendungen', 'APP.2.1 Allgemeiner Verzeichnisdienst', 'APP.2.1.A4 Sichere Installation von Verzeichnisdiensten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_2_1_Allgemeiner_Verzeichnisdienst.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.2.1.A5', 'APP - Anwendungen', 'APP.2.1 Allgemeiner Verzeichnisdienst', 'APP.2.1.A5 Sichere Konfiguration und Konfigurationsänderungen von Verzeichnisdiensten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_2_1_Allgemeiner_Verzeichnisdienst.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.2.1.A6', 'APP - Anwendungen', 'APP.2.1 Allgemeiner Verzeichnisdienst', 'APP.2.1.A6 Sicherer Betrieb von Verzeichnisdiensten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_2_1_Allgemeiner_Verzeichnisdienst.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.2.1.A7', 'APP - Anwendungen', 'APP.2.1 Allgemeiner Verzeichnisdienst', 'APP.2.1.A7 Erstellung eines Sicherheitskonzepts für den Einsatz von Verzeichnisdiensten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_2_1_Allgemeiner_Verzeichnisdienst.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.2.1.A8', 'APP - Anwendungen', 'APP.2.1 Allgemeiner Verzeichnisdienst', 'APP.2.1.A8 Planung einer Partitionierung und Replikation im Verzeichnisdienst', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_2_1_Allgemeiner_Verzeichnisdienst.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.2.1.A9', 'APP - Anwendungen', 'APP.2.1 Allgemeiner Verzeichnisdienst', 'APP.2.1.A9 Geeignete Auswahl von Komponenten für Verzeichnisdienste', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_2_1_Allgemeiner_Verzeichnisdienst.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.2.2.A1', 'APP - Anwendungen', 'APP.2.2 Active Directory', 'APP.2.2.A1 Planung des Active Directory', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_2_2_Active_Directory.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.2.2.A10', 'APP - Anwendungen', 'APP.2.2 Active Directory', 'APP.2.2.A10 Sicherer Einsatz von DNS für Active Directory', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_2_2_Active_Directory.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.2.2.A11', 'APP - Anwendungen', 'APP.2.2 Active Directory', 'APP.2.2.A11 Überwachung der Active-Directory-Infrastruktur', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_2_2_Active_Directory.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.2.2.A12', 'APP - Anwendungen', 'APP.2.2 Active Directory', 'APP.2.2.A12 Datensicherung für Domänen-Controller', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_2_2_Active_Directory.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.2.2.A13', 'APP - Anwendungen', 'APP.2.2 Active Directory', 'APP.2.2.A13 Einsatz von Zwei-Faktor-Authentisierung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_2_2_Active_Directory.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.2.2.A14', 'APP - Anwendungen', 'APP.2.2 Active Directory', 'APP.2.2.A14 Verwendung dedizierter privilegierter Administrationssysteme', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_2_2_Active_Directory.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.2.2.A15', 'APP - Anwendungen', 'APP.2.2 Active Directory', 'APP.2.2.A15 Trennung von Administrations- und Produktionsumgebung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_2_2_Active_Directory.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.2.2.A2', 'APP - Anwendungen', 'APP.2.2 Active Directory', 'APP.2.2.A2 Planung der Active-Directory-Administration', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_2_2_Active_Directory.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.2.2.A3', 'APP - Anwendungen', 'APP.2.2 Active Directory', 'APP.2.2.A3 Planung der Gruppenrichtlinien unter Windows', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_2_2_Active_Directory.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.2.2.A4', 'APP - Anwendungen', 'APP.2.2 Active Directory', 'APP.2.2.A4 Schulung zur Active-Directory-Verwaltung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_2_2_Active_Directory.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.2.2.A5', 'APP - Anwendungen', 'APP.2.2 Active Directory', 'APP.2.2.A5 Härtung des Active Directory', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_2_2_Active_Directory.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.2.2.A6', 'APP - Anwendungen', 'APP.2.2 Active Directory', 'APP.2.2.A6 Aufrechterhaltung der Betriebssicherheit von Active Directory', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_2_2_Active_Directory.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.2.2.A7', 'APP - Anwendungen', 'APP.2.2 Active Directory', 'APP.2.2.A7 Umsetzung sicherer Verwaltungsmethoden für Active Directory', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_2_2_Active_Directory.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.2.2.A8', 'APP - Anwendungen', 'APP.2.2 Active Directory', 'APP.2.2.A8 Konfiguration des „Sicheren Kanals“ unter Windows', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_2_2_Active_Directory.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.2.2.A9', 'APP - Anwendungen', 'APP.2.2 Active Directory', 'APP.2.2.A9 Schutz der Authentisierung beim Einsatz von Active Directory', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_2_2_Active_Directory.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.2.3.A1', 'APP - Anwendungen', 'APP.2.3 OpenLDAP', 'APP.2.3.A1 Planung und Auswahl von Backends und Overlays für OpenLDAP', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_2_3_OpenLDAP.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.2.3.A10', 'APP - Anwendungen', 'APP.2.3 OpenLDAP', 'APP.2.3.A10 Sichere Aktualisierung von OpenLDAP', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_2_3_OpenLDAP.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.2.3.A11', 'APP - Anwendungen', 'APP.2.3 OpenLDAP', 'APP.2.3.A11 Einschränkung der OpenLDAP-Laufzeitumgebung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_2_3_OpenLDAP.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.2.3.A12', 'APP - Anwendungen', 'APP.2.3 OpenLDAP', 'APP.2.3.A12 Protokollierung und Überwachung von OpenLDAP', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_2_3_OpenLDAP.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.2.3.A13', 'APP - Anwendungen', 'APP.2.3 OpenLDAP', 'APP.2.3.A13 Datensicherung von OpenLDAP', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_2_3_OpenLDAP.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.2.3.A2', 'APP - Anwendungen', 'APP.2.3 OpenLDAP', 'APP.2.3.A2 Sichere Installation von OpenLDAP', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_2_3_OpenLDAP.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.2.3.A3', 'APP - Anwendungen', 'APP.2.3 OpenLDAP', 'APP.2.3.A3 Sichere Konfiguration von OpenLDAP', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_2_3_OpenLDAP.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.2.3.A4', 'APP - Anwendungen', 'APP.2.3 OpenLDAP', 'APP.2.3.A4 Konfiguration der durch OpenLDAP verwendeten Datenbank', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_2_3_OpenLDAP.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.2.3.A5', 'APP - Anwendungen', 'APP.2.3 OpenLDAP', 'APP.2.3.A5 Sichere Vergabe von Zugriffsrechten auf dem OpenLDAP', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_2_3_OpenLDAP.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.2.3.A6', 'APP - Anwendungen', 'APP.2.3 OpenLDAP', 'APP.2.3.A6 Sichere Authentisierung gegenüber OpenLDAP', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_2_3_OpenLDAP.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.2.3.A7', 'APP - Anwendungen', 'APP.2.3 OpenLDAP', 'APP.2.3.A7 Schulung von Administratoren von OpenLDAP', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_2_3_OpenLDAP.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.2.3.A8', 'APP - Anwendungen', 'APP.2.3 OpenLDAP', 'APP.2.3.A8 Einschränkungen von Attributen bei OpenLDAP', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_2_3_OpenLDAP.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.2.3.A9', 'APP - Anwendungen', 'APP.2.3 OpenLDAP', 'APP.2.3.A9 Partitionierung und Replikation bei OpenLDAP', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_2_3_OpenLDAP.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.1.A1', 'APP - Anwendungen', 'APP.3.1 Webanwendungen', 'APP.3.1.A1 Authentisierung bei Webanwendungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_1_Webanwendungen.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.1.A10', 'APP - Anwendungen', 'APP.3.1 Webanwendungen', 'APP.3.1.A10 ENTFALLEN', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_1_Webanwendungen.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.1.A11', 'APP - Anwendungen', 'APP.3.1 Webanwendungen', 'APP.3.1.A11 Sichere Anbindung von Hintergrundsystemen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_1_Webanwendungen.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.1.A12', 'APP - Anwendungen', 'APP.3.1 Webanwendungen', 'APP.3.1.A12 Sichere Konfiguration von Webanwendungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_1_Webanwendungen.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.1.A13', 'APP - Anwendungen', 'APP.3.1 Webanwendungen', 'APP.3.1.A13 Restriktive Herausgabe sicherheitsrelevanter Informationen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_1_Webanwendungen.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.1.A14', 'APP - Anwendungen', 'APP.3.1 Webanwendungen', 'APP.3.1.A14 Schutz vertraulicher Daten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_1_Webanwendungen.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.1.A15', 'APP - Anwendungen', 'APP.3.1 Webanwendungen', 'APP.3.1.A15 Verifikation essenzieller Änderungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_1_Webanwendungen.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.1.A16', 'APP - Anwendungen', 'APP.3.1 Webanwendungen', 'APP.3.1.A16 Umfassende Eingabevalidierung und Ausgabekodierung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_1_Webanwendungen.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.1.A17', 'APP - Anwendungen', 'APP.3.1 Webanwendungen', 'APP.3.1.A17 Fehlerbehandlung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_1_Webanwendungen.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.1.A18', 'APP - Anwendungen', 'APP.3.1 Webanwendungen', 'APP.3.1.A18 ENTFALLEN', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_1_Webanwendungen.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.1.A19', 'APP - Anwendungen', 'APP.3.1 Webanwendungen', 'APP.3.1.A19 Schutz vor SQL-Injection', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_1_Webanwendungen.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.1.A2', 'APP - Anwendungen', 'APP.3.1 Webanwendungen', 'APP.3.1.A2 Zugriffskontrolle bei Webanwendungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_1_Webanwendungen.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.1.A20', 'APP - Anwendungen', 'APP.3.1 Webanwendungen', 'APP.3.1.A20 Einsatz von Web Application Firewalls', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_1_Webanwendungen.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.1.A21', 'APP - Anwendungen', 'APP.3.1 Webanwendungen', 'APP.3.1.A21 Sichere HTTP-Konfiguration bei Webanwendungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_1_Webanwendungen.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.1.A22', 'APP - Anwendungen', 'APP.3.1 Webanwendungen', 'APP.3.1.A22 Überprüfung von Webanwendungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_1_Webanwendungen.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.1.A23', 'APP - Anwendungen', 'APP.3.1 Webanwendungen', 'APP.3.1.A23 Verhinderung von Cross-Site-Request-Forgery', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_1_Webanwendungen.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.1.A24', 'APP - Anwendungen', 'APP.3.1 Webanwendungen', 'APP.3.1.A24 Verhinderung der Blockade von Ressourcen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_1_Webanwendungen.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.1.A25', 'APP - Anwendungen', 'APP.3.1 Webanwendungen', 'APP.3.1.A25 Kryptografische Sicherung vertraulicher Daten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_1_Webanwendungen.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.1.A3', 'APP - Anwendungen', 'APP.3.1 Webanwendungen', 'APP.3.1.A3 Sicheres Session-Management', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_1_Webanwendungen.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.1.A4', 'APP - Anwendungen', 'APP.3.1 Webanwendungen', 'APP.3.1.A4 Kontrolliertes Einbinden von Daten und Inhalten bei Webanwendungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_1_Webanwendungen.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.1.A5', 'APP - Anwendungen', 'APP.3.1 Webanwendungen', 'APP.3.1.A5 Protokollierung sicherheitsrelevanter Ereignisse von Webanwendungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_1_Webanwendungen.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.1.A6', 'APP - Anwendungen', 'APP.3.1 Webanwendungen', 'APP.3.1.A6 ENTFALLEN', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_1_Webanwendungen.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.1.A7', 'APP - Anwendungen', 'APP.3.1 Webanwendungen', 'APP.3.1.A7 Schutz vor unerlaubter automatisierter Nutzung von Webanwendungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_1_Webanwendungen.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.1.A8', 'APP - Anwendungen', 'APP.3.1 Webanwendungen', 'APP.3.1.A8 Systemarchitektur einer Webanwendung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_1_Webanwendungen.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.1.A9', 'APP - Anwendungen', 'APP.3.1 Webanwendungen', 'APP.3.1.A9 Beschaffung, Entwicklung und Erweiterung von Webanwendungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_1_Webanwendungen.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.2.A1', 'APP - Anwendungen', 'APP.3.2 Webserver', 'APP.3.2.A1 Sichere Konfiguration eines Webservers', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_2_Webserver.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.2.A10', 'APP - Anwendungen', 'APP.3.2 Webserver', 'APP.3.2.A10 Auswahl eines geeigneten Webhosters', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_2_Webserver.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.2.A11', 'APP - Anwendungen', 'APP.3.2 Webserver', 'APP.3.2.A11 Verschlüsselung über TLS', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_2_Webserver.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.2.A12', 'APP - Anwendungen', 'APP.3.2 Webserver', 'APP.3.2.A12 Geeigneter Umgang mit Fehlern und Fehlermeldungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_2_Webserver.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.2.A13', 'APP - Anwendungen', 'APP.3.2 Webserver', 'APP.3.2.A13 Zugriffskontrolle für Webcrawler', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_2_Webserver.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.2.A14', 'APP - Anwendungen', 'APP.3.2 Webserver', 'APP.3.2.A14 Integritätsprüfungen und Schutz vor Schadsoftware', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_2_Webserver.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.2.A15', 'APP - Anwendungen', 'APP.3.2 Webserver', 'APP.3.2.A15 Redundanz', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_2_Webserver.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.2.A16', 'APP - Anwendungen', 'APP.3.2 Webserver', 'APP.3.2.A16 Penetrationstest und Revision', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_2_Webserver.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.2.A17', 'APP - Anwendungen', 'APP.3.2 Webserver', 'APP.3.2.A17 Einsatz erweiterter Authentisierungsmethoden für Webserver', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_2_Webserver.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.2.A18', 'APP - Anwendungen', 'APP.3.2 Webserver', 'APP.3.2.A18 Schutz vor Denial-of-Service-Angriffen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_2_Webserver.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.2.A19', 'APP - Anwendungen', 'APP.3.2 Webserver', 'APP.3.2.A19 ENTFALLEN', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_2_Webserver.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.2.A2', 'APP - Anwendungen', 'APP.3.2 Webserver', 'APP.3.2.A2 Schutz der Webserver-Dateien', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_2_Webserver.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.2.A20', 'APP - Anwendungen', 'APP.3.2 Webserver', 'APP.3.2.A20 Benennung von Ansprechpartnern', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_2_Webserver.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.2.A3', 'APP - Anwendungen', 'APP.3.2 Webserver', 'APP.3.2.A3 Absicherung von Datei-Uploads und -Downloads', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_2_Webserver.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.2.A4', 'APP - Anwendungen', 'APP.3.2 Webserver', 'APP.3.2.A4 Protokollierung von Ereignissen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_2_Webserver.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.2.A5', 'APP - Anwendungen', 'APP.3.2 Webserver', 'APP.3.2.A5 Authentisierung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_2_Webserver.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.2.A6', 'APP - Anwendungen', 'APP.3.2 Webserver', 'APP.3.2.A6 ENTFALLEN', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_2_Webserver.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.2.A7', 'APP - Anwendungen', 'APP.3.2 Webserver', 'APP.3.2.A7 Rechtliche Rahmenbedingungen für Webangebote', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_2_Webserver.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.2.A8', 'APP - Anwendungen', 'APP.3.2 Webserver', 'APP.3.2.A8 Planung des Einsatzes eines Webservers', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_2_Webserver.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.2.A9', 'APP - Anwendungen', 'APP.3.2 Webserver', 'APP.3.2.A9 Festlegung einer Sicherheitsrichtlinie für den Webserver', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_2_Webserver.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.3.A1', 'APP - Anwendungen', 'APP.3.3 Fileserver', 'APP.3.3.A1 ENTFALLEN', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_3_Fileserver.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.3.A10', 'APP - Anwendungen', 'APP.3.3 Fileserver', 'APP.3.3.A10 ENTFALLEN', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_3_Fileserver.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.3.A11', 'APP - Anwendungen', 'APP.3.3 Fileserver', 'APP.3.3.A11 Einsatz von Speicherbeschränkungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_3_Fileserver.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.3.A12', 'APP - Anwendungen', 'APP.3.3 Fileserver', 'APP.3.3.A12 Verschlüsselung des Datenbestandes', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_3_Fileserver.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.3.A13', 'APP - Anwendungen', 'APP.3.3 Fileserver', 'APP.3.3.A13 Replizieren zwischen Standorten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_3_Fileserver.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.3.A14', 'APP - Anwendungen', 'APP.3.3 Fileserver', 'APP.3.3.A14 Einsatz von Error-Correction-Codes', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_3_Fileserver.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.3.A15', 'APP - Anwendungen', 'APP.3.3 Fileserver', 'APP.3.3.A15 Planung von Fileservern', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_3_Fileserver.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.3.A2', 'APP - Anwendungen', 'APP.3.3 Fileserver', 'APP.3.3.A2 Einsatz von RAID-Systemen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_3_Fileserver.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.3.A3', 'APP - Anwendungen', 'APP.3.3 Fileserver', 'APP.3.3.A3 Einsatz von Viren-Schutzprogrammen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_3_Fileserver.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.3.A4', 'APP - Anwendungen', 'APP.3.3 Fileserver', 'APP.3.3.A4 ENTFALLEN', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_3_Fileserver.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.3.A5', 'APP - Anwendungen', 'APP.3.3 Fileserver', 'APP.3.3.A5 Restriktive Rechtevergabe', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_3_Fileserver.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.3.A6', 'APP - Anwendungen', 'APP.3.3 Fileserver', 'APP.3.3.A6 Beschaffung eines Fileservers und Auswahl eines Dienstes', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_3_Fileserver.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.3.A7', 'APP - Anwendungen', 'APP.3.3 Fileserver', 'APP.3.3.A7 Auswahl eines Dateisystems', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_3_Fileserver.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.3.A8', 'APP - Anwendungen', 'APP.3.3 Fileserver', 'APP.3.3.A8 Strukturierte Datenhaltung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_3_Fileserver.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.3.A9', 'APP - Anwendungen', 'APP.3.3 Fileserver', 'APP.3.3.A9 Sicheres Speichermanagement', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_3_Fileserver.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.4.A1', 'APP - Anwendungen', 'APP.3.4 Samba', 'APP.3.4.A1 Planung des Einsatzes eines Samba-Servers', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_4_Samba.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.4.A10', 'APP - Anwendungen', 'APP.3.4 Samba', 'APP.3.4.A10 Sicherer Einsatz externer Programme auf einem Samba-Server', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_4_Samba.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.4.A11', 'APP - Anwendungen', 'APP.3.4 Samba', 'APP.3.4.A11 Sicherer Einsatz von Kommunikationsprotokollen beim Einsatz eines Samba-Servers', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_4_Samba.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.4.A12', 'APP - Anwendungen', 'APP.3.4 Samba', 'APP.3.4.A12 Schulung der Administratoren eines Samba-Servers', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_4_Samba.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.4.A13', 'APP - Anwendungen', 'APP.3.4 Samba', 'APP.3.4.A13 Regelmäßige Sicherung wichtiger Systemkomponenten eines Samba-Servers', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_4_Samba.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.4.A14', 'APP - Anwendungen', 'APP.3.4 Samba', 'APP.3.4.A14 ENTFALLEN', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_4_Samba.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.4.A15', 'APP - Anwendungen', 'APP.3.4 Samba', 'APP.3.4.A15 Verschlüsselung der Datenpakete unter Samba', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_4_Samba.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.4.A2', 'APP - Anwendungen', 'APP.3.4 Samba', 'APP.3.4.A2 Sichere Grundkonfiguration eines Samba-Servers', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_4_Samba.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.4.A3', 'APP - Anwendungen', 'APP.3.4 Samba', 'APP.3.4.A3 Sichere Konfiguration des Samba-Servers', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_4_Samba.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.4.A4', 'APP - Anwendungen', 'APP.3.4 Samba', 'APP.3.4.A4 Vermeidung der NTFS-Eigenschaften auf einem Samba-Server', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_4_Samba.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.4.A5', 'APP - Anwendungen', 'APP.3.4 Samba', 'APP.3.4.A5 Sichere Konfiguration der Zugriffssteuerung bei einem Samba-Server', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_4_Samba.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.4.A6', 'APP - Anwendungen', 'APP.3.4 Samba', 'APP.3.4.A6 Sichere Konfiguration von Winbind unter Samba', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_4_Samba.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.4.A7', 'APP - Anwendungen', 'APP.3.4 Samba', 'APP.3.4.A7 Sichere Konfiguration von DNS unter Samba', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_4_Samba.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.4.A8', 'APP - Anwendungen', 'APP.3.4 Samba', 'APP.3.4.A8 Sichere Konfiguration von LDAP unter Samba', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_4_Samba.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.4.A9', 'APP - Anwendungen', 'APP.3.4 Samba', 'APP.3.4.A9 Sichere Konfiguration von Kerberos unter Samba', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_4_Samba.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.6.A1', 'APP - Anwendungen', 'APP.3.6 DNS-Server', 'APP.3.6.A1 Planung des DNS-Einsatzes', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_6_DNS-Server.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.6.A10', 'APP - Anwendungen', 'APP.3.6 DNS-Server', 'APP.3.6.A10 Auswahl eines geeigneten DNS-Server-Produktes', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_6_DNS-Server.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.6.A11', 'APP - Anwendungen', 'APP.3.6 DNS-Server', 'APP.3.6.A11 Ausreichende Dimensionierung der DNS-Server', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_6_DNS-Server.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.6.A12', 'APP - Anwendungen', 'APP.3.6 DNS-Server', 'APP.3.6.A12 Schulung der Verantwortlichen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_6_DNS-Server.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.6.A13', 'APP - Anwendungen', 'APP.3.6 DNS-Server', 'APP.3.6.A13 Einschränkung der Sichtbarkeit von Domain-Informationen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_6_DNS-Server.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.6.A14', 'APP - Anwendungen', 'APP.3.6 DNS-Server', 'APP.3.6.A14 Platzierung der Nameserver', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_6_DNS-Server.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.6.A15', 'APP - Anwendungen', 'APP.3.6 DNS-Server', 'APP.3.6.A15 Auswertung der Logdaten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_6_DNS-Server.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.6.A16', 'APP - Anwendungen', 'APP.3.6 DNS-Server', 'APP.3.6.A16 Integration eines DNS-Servers in eine "P-A-P"-Struktur', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_6_DNS-Server.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.6.A17', 'APP - Anwendungen', 'APP.3.6 DNS-Server', 'APP.3.6.A17 Einsatz von DNSSEC', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_6_DNS-Server.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.6.A18', 'APP - Anwendungen', 'APP.3.6 DNS-Server', 'APP.3.6.A18 Erweiterte Absicherung von Zonentransfers', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_6_DNS-Server.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.6.A19', 'APP - Anwendungen', 'APP.3.6 DNS-Server', 'APP.3.6.A19 Aussonderung von DNS-Servern', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_6_DNS-Server.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.6.A2', 'APP - Anwendungen', 'APP.3.6 DNS-Server', 'APP.3.6.A2 Einsatz redundanter DNS-Server', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_6_DNS-Server.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.6.A20', 'APP - Anwendungen', 'APP.3.6 DNS-Server', 'APP.3.6.A20 Prüfung des Notfallplans auf Durchführbarkeit', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_6_DNS-Server.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.6.A21', 'APP - Anwendungen', 'APP.3.6 DNS-Server', 'APP.3.6.A21 Hidden-Master', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_6_DNS-Server.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.6.A22', 'APP - Anwendungen', 'APP.3.6 DNS-Server', 'APP.3.6.A22 Anbindung der DNS-Server über unterschiedliche Provider', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_6_DNS-Server.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.6.A3', 'APP - Anwendungen', 'APP.3.6 DNS-Server', 'APP.3.6.A3 Verwendung von separaten DNS-Servern für interne und externe Anfragen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_6_DNS-Server.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.6.A4', 'APP - Anwendungen', 'APP.3.6 DNS-Server', 'APP.3.6.A4 Sichere Grundkonfiguration eines DNS-Servers', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_6_DNS-Server.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.6.A5', 'APP - Anwendungen', 'APP.3.6 DNS-Server', 'APP.3.6.A5 ENTFALLEN', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_6_DNS-Server.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.6.A6', 'APP - Anwendungen', 'APP.3.6 DNS-Server', 'APP.3.6.A6 Absicherung von dynamischen DNS-Updates', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_6_DNS-Server.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.6.A7', 'APP - Anwendungen', 'APP.3.6 DNS-Server', 'APP.3.6.A7 Überwachung von DNS-Servern', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_6_DNS-Server.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.6.A8', 'APP - Anwendungen', 'APP.3.6 DNS-Server', 'APP.3.6.A8 Verwaltung von Domainnamen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_6_DNS-Server.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.3.6.A9', 'APP - Anwendungen', 'APP.3.6 DNS-Server', 'APP.3.6.A9 Erstellen eines Notfallplans für DNS-Server', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_3_6_DNS-Server.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.4.2.A1', 'APP - Anwendungen', 'APP.4.2 SAP-ERP-System', 'APP.4.2.A1 Sichere Konfiguration des SAP-ABAP-Stacks', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_4_2_SAP-ERP-System.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.4.2.A10', 'APP - Anwendungen', 'APP.4.2 SAP-ERP-System', 'APP.4.2.A10 Regelmäßige Implementierung von Sicherheitskorrekturen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_4_2_SAP-ERP-System.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.4.2.A11', 'APP - Anwendungen', 'APP.4.2 SAP-ERP-System', 'APP.4.2.A11 Sichere Installation eines SAP-ERP-Systems', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_4_2_SAP-ERP-System.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.4.2.A12', 'APP - Anwendungen', 'APP.4.2 SAP-ERP-System', 'APP.4.2.A12 SAP-Berechtigungsentwicklung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_4_2_SAP-ERP-System.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.4.2.A13', 'APP - Anwendungen', 'APP.4.2 SAP-ERP-System', 'APP.4.2.A13 SAP-Passwortsicherheit', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_4_2_SAP-ERP-System.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.4.2.A14', 'APP - Anwendungen', 'APP.4.2 SAP-ERP-System', 'APP.4.2.A14 Identifizierung kritischer SAP-Berechtigungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_4_2_SAP-ERP-System.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.4.2.A15', 'APP - Anwendungen', 'APP.4.2 SAP-ERP-System', 'APP.4.2.A15 Sichere Konfiguration des SAP-Routers', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_4_2_SAP-ERP-System.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.4.2.A16', 'APP - Anwendungen', 'APP.4.2 SAP-ERP-System', 'APP.4.2.A16 Umsetzung von Sicherheitsanforderungen für das Betriebssystem Windows', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_4_2_SAP-ERP-System.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.4.2.A17', 'APP - Anwendungen', 'APP.4.2 SAP-ERP-System', 'APP.4.2.A17 Umsetzung von Sicherheitsanforderungen für das Betriebssystem Unix', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_4_2_SAP-ERP-System.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.4.2.A18', 'APP - Anwendungen', 'APP.4.2 SAP-ERP-System', 'APP.4.2.A18 Abschaltung von unsicherer Kommunikation', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_4_2_SAP-ERP-System.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.4.2.A19', 'APP - Anwendungen', 'APP.4.2 SAP-ERP-System', 'APP.4.2.A19 Definition der Sicherheitsrichtlinien für Benutzer', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_4_2_SAP-ERP-System.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.4.2.A2', 'APP - Anwendungen', 'APP.4.2 SAP-ERP-System', 'APP.4.2.A2 Sichere Konfiguration des SAP-JAVA-Stacks', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_4_2_SAP-ERP-System.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.4.2.A20', 'APP - Anwendungen', 'APP.4.2 SAP-ERP-System', 'APP.4.2.A20 Sichere SAP-GUI-Einstellungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_4_2_SAP-ERP-System.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.4.2.A21', 'APP - Anwendungen', 'APP.4.2 SAP-ERP-System', 'APP.4.2.A21 Konfiguration des Security Audit Logs', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_4_2_SAP-ERP-System.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.4.2.A22', 'APP - Anwendungen', 'APP.4.2 SAP-ERP-System', 'APP.4.2.A22 Schutz des Spools im SAP-ERP-System', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_4_2_SAP-ERP-System.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.4.2.A23', 'APP - Anwendungen', 'APP.4.2 SAP-ERP-System', 'APP.4.2.A23 Schutz der SAP-Hintergrundverarbeitung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_4_2_SAP-ERP-System.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.4.2.A24', 'APP - Anwendungen', 'APP.4.2 SAP-ERP-System', 'APP.4.2.A24 Aktivierung und Absicherung des Internet Communication Frameworks', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_4_2_SAP-ERP-System.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.4.2.A25', 'APP - Anwendungen', 'APP.4.2 SAP-ERP-System', 'APP.4.2.A25 Sichere Konfiguration des SAP Web Dispatchers', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_4_2_SAP-ERP-System.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.4.2.A26', 'APP - Anwendungen', 'APP.4.2 SAP-ERP-System', 'APP.4.2.A26 Schutz des kundeneigenen Codes im SAP-ERP-System', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_4_2_SAP-ERP-System.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.4.2.A27', 'APP - Anwendungen', 'APP.4.2 SAP-ERP-System', 'APP.4.2.A27 Audit des SAP-ERP-Systems', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_4_2_SAP-ERP-System.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.4.2.A28', 'APP - Anwendungen', 'APP.4.2 SAP-ERP-System', 'APP.4.2.A28 Erstellung eines Notfallkonzeptes', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_4_2_SAP-ERP-System.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.4.2.A29', 'APP - Anwendungen', 'APP.4.2 SAP-ERP-System', 'APP.4.2.A29 Einrichten eines Notfallbenutzers', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_4_2_SAP-ERP-System.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.4.2.A3', 'APP - Anwendungen', 'APP.4.2 SAP-ERP-System', 'APP.4.2.A3 Netzsicherheit', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_4_2_SAP-ERP-System.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.4.2.A30', 'APP - Anwendungen', 'APP.4.2 SAP-ERP-System', 'APP.4.2.A30 Implementierung eines kontinuierlichen Monitorings der Sicherheitseinstellungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_4_2_SAP-ERP-System.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.4.2.A31', 'APP - Anwendungen', 'APP.4.2 SAP-ERP-System', 'APP.4.2.A31 Konfiguration von SAP Single-Sign-On', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_4_2_SAP-ERP-System.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.4.2.A32', 'APP - Anwendungen', 'APP.4.2 SAP-ERP-System', 'APP.4.2.A32 Echtzeiterfassung und Alarmierung von irregulären Vorgängen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_4_2_SAP-ERP-System.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.4.2.A4', 'APP - Anwendungen', 'APP.4.2 SAP-ERP-System', 'APP.4.2.A4 Absicherung der ausgelieferten SAP-Standardbenutzer-Kennungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_4_2_SAP-ERP-System.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.4.2.A5', 'APP - Anwendungen', 'APP.4.2 SAP-ERP-System', 'APP.4.2.A5 Konfiguration und Absicherung der SAP-Benutzerverwaltung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_4_2_SAP-ERP-System.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.4.2.A6', 'APP - Anwendungen', 'APP.4.2 SAP-ERP-System', 'APP.4.2.A6 Erstellung und Umsetzung eines Benutzer- und Berechtigungskonzeptes', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_4_2_SAP-ERP-System.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.4.2.A7', 'APP - Anwendungen', 'APP.4.2 SAP-ERP-System', 'APP.4.2.A7 Absicherung der SAP-Datenbanken', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_4_2_SAP-ERP-System.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.4.2.A8', 'APP - Anwendungen', 'APP.4.2 SAP-ERP-System', 'APP.4.2.A8 Absicherung der SAP-RFC-Schnittstelle', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_4_2_SAP-ERP-System.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.4.2.A9', 'APP - Anwendungen', 'APP.4.2 SAP-ERP-System', 'APP.4.2.A9 Absicherung und Überwachung des Message-Servers', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_4_2_SAP-ERP-System.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.4.3.A1', 'APP - Anwendungen', 'APP.4.3 Relationale Datenbanksysteme', 'APP.4.3.A1 Erstellung einer Sicherheitsrichtlinie für Datenbanksysteme', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_4_3_Relationale_Datenbanksysteme.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.4.3.A10', 'APP - Anwendungen', 'APP.4.3 Relationale Datenbanksysteme', 'APP.4.3.A10 Auswahl geeigneter Datenbankmanagementsysteme', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_4_3_Relationale_Datenbanksysteme.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.4.3.A11', 'APP - Anwendungen', 'APP.4.3 Relationale Datenbanksysteme', 'APP.4.3.A11 Ausreichende Dimensionierung der Hardware', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_4_3_Relationale_Datenbanksysteme.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.4.3.A12', 'APP - Anwendungen', 'APP.4.3 Relationale Datenbanksysteme', 'APP.4.3.A12 Einheitlicher Konfigurationsstandard von Datenbankmanagementsystemen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_4_3_Relationale_Datenbanksysteme.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.4.3.A13', 'APP - Anwendungen', 'APP.4.3 Relationale Datenbanksysteme', 'APP.4.3.A13 Restriktive Handhabung von Datenbank-Links', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_4_3_Relationale_Datenbanksysteme.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.4.3.A14', 'APP - Anwendungen', 'APP.4.3 Relationale Datenbanksysteme', 'APP.4.3.A14 Überprüfung der Datensicherung eines Datenbanksystems', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_4_3_Relationale_Datenbanksysteme.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.4.3.A15', 'APP - Anwendungen', 'APP.4.3 Relationale Datenbanksysteme', 'APP.4.3.A15 Schulung der Datenbankadministratoren', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_4_3_Relationale_Datenbanksysteme.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.4.3.A16', 'APP - Anwendungen', 'APP.4.3 Relationale Datenbanksysteme', 'APP.4.3.A16 Verschlüsselung der Datenbankanbindung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_4_3_Relationale_Datenbanksysteme.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.4.3.A17', 'APP - Anwendungen', 'APP.4.3 Relationale Datenbanksysteme', 'APP.4.3.A17 Datenübernahme oder Migration', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_4_3_Relationale_Datenbanksysteme.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.4.3.A18', 'APP - Anwendungen', 'APP.4.3 Relationale Datenbanksysteme', 'APP.4.3.A18 Überwachung des Datenbankmanagementsystems', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_4_3_Relationale_Datenbanksysteme.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.4.3.A19', 'APP - Anwendungen', 'APP.4.3 Relationale Datenbanksysteme', 'APP.4.3.A19 Schutz vor schädlichen Datenbank-Skripten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_4_3_Relationale_Datenbanksysteme.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.4.3.A2', 'APP - Anwendungen', 'APP.4.3 Relationale Datenbanksysteme', 'APP.4.3.A2 Installation des Datenbankmanagementsystems', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_4_3_Relationale_Datenbanksysteme.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.4.3.A20', 'APP - Anwendungen', 'APP.4.3 Relationale Datenbanksysteme', 'APP.4.3.A20 Regelmäßige Audits', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_4_3_Relationale_Datenbanksysteme.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.4.3.A21', 'APP - Anwendungen', 'APP.4.3 Relationale Datenbanksysteme', 'APP.4.3.A21 Einsatz von Datenbank Security Tools', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_4_3_Relationale_Datenbanksysteme.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.4.3.A22', 'APP - Anwendungen', 'APP.4.3 Relationale Datenbanksysteme', 'APP.4.3.A22 Notfallvorsorge', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_4_3_Relationale_Datenbanksysteme.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.4.3.A23', 'APP - Anwendungen', 'APP.4.3 Relationale Datenbanksysteme', 'APP.4.3.A23 Archivierung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_4_3_Relationale_Datenbanksysteme.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.4.3.A24', 'APP - Anwendungen', 'APP.4.3 Relationale Datenbanksysteme', 'APP.4.3.A24 Datenverschlüsselung in der Datenbank', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_4_3_Relationale_Datenbanksysteme.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.4.3.A25', 'APP - Anwendungen', 'APP.4.3 Relationale Datenbanksysteme', 'APP.4.3.A25 Sicherheitsüberprüfungen von Datenbanksystemen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_4_3_Relationale_Datenbanksysteme.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.4.3.A3', 'APP - Anwendungen', 'APP.4.3 Relationale Datenbanksysteme', 'APP.4.3.A3 Basishärtung des Datenbankmanagementsystems', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_4_3_Relationale_Datenbanksysteme.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.4.3.A4', 'APP - Anwendungen', 'APP.4.3 Relationale Datenbanksysteme', 'APP.4.3.A4 Geregeltes Anlegen neuer Datenbanken', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_4_3_Relationale_Datenbanksysteme.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.4.3.A5', 'APP - Anwendungen', 'APP.4.3 Relationale Datenbanksysteme', 'APP.4.3.A5 Benutzer- und Berechtigungskonzept', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_4_3_Relationale_Datenbanksysteme.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.4.3.A6', 'APP - Anwendungen', 'APP.4.3 Relationale Datenbanksysteme', 'APP.4.3.A6 Passwortänderung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_4_3_Relationale_Datenbanksysteme.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.4.3.A7', 'APP - Anwendungen', 'APP.4.3 Relationale Datenbanksysteme', 'APP.4.3.A7 Zeitnahes Einspielen von Sicherheitsupdates', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_4_3_Relationale_Datenbanksysteme.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.4.3.A8', 'APP - Anwendungen', 'APP.4.3 Relationale Datenbanksysteme', 'APP.4.3.A8 Datenbank-Protokollierung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_4_3_Relationale_Datenbanksysteme.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.4.3.A9', 'APP - Anwendungen', 'APP.4.3 Relationale Datenbanksysteme', 'APP.4.3.A9 Datensicherung eines Datenbanksystems', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_4_3_Relationale_Datenbanksysteme.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.4.6.A1', 'APP - Anwendungen', 'APP.4.6 SAP ABAP-Programmierung', 'APP.4.6.A1 Absicherung von Reports mit Berechtigungsprüfungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_4_6_SAP_ABAP-Programmierung.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.4.6.A10', 'APP - Anwendungen', 'APP.4.6 SAP ABAP-Programmierung', 'APP.4.6.A10 Verhinderung der Ausführung von Betriebssystemkommandos', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_4_6_SAP_ABAP-Programmierung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.4.6.A11', 'APP - Anwendungen', 'APP.4.6 SAP ABAP-Programmierung', 'APP.4.6.A11 Vermeidung von eingeschleustem Schadcode', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_4_6_SAP_ABAP-Programmierung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.4.6.A12', 'APP - Anwendungen', 'APP.4.6 SAP ABAP-Programmierung', 'APP.4.6.A12 Vermeidung von generischer Modulausführung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_4_6_SAP_ABAP-Programmierung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.4.6.A13', 'APP - Anwendungen', 'APP.4.6 SAP ABAP-Programmierung', 'APP.4.6.A13 Vermeidung von generischem Zugriff auf Tabelleninhalte', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_4_6_SAP_ABAP-Programmierung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.4.6.A14', 'APP - Anwendungen', 'APP.4.6 SAP ABAP-Programmierung', 'APP.4.6.A14 Vermeidung von nativen SQL-Anweisungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_4_6_SAP_ABAP-Programmierung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.4.6.A15', 'APP - Anwendungen', 'APP.4.6 SAP ABAP-Programmierung', 'APP.4.6.A15 Vermeidung von Datenlecks', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_4_6_SAP_ABAP-Programmierung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.4.6.A16', 'APP - Anwendungen', 'APP.4.6 SAP ABAP-Programmierung', 'APP.4.6.A16 Verzicht auf systemabhängige Funktionsausführung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_4_6_SAP_ABAP-Programmierung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.4.6.A17', 'APP - Anwendungen', 'APP.4.6 SAP ABAP-Programmierung', 'APP.4.6.A17 Verzicht auf mandantenabhängige Funktionsausführung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_4_6_SAP_ABAP-Programmierung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.4.6.A18', 'APP - Anwendungen', 'APP.4.6 SAP ABAP-Programmierung', 'APP.4.6.A18 Vermeidung von Open-SQL-Injection-Schwachstellen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_4_6_SAP_ABAP-Programmierung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.4.6.A19', 'APP - Anwendungen', 'APP.4.6 SAP ABAP-Programmierung', 'APP.4.6.A19 Schutz vor Cross-Site-Scripting', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_4_6_SAP_ABAP-Programmierung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.4.6.A2', 'APP - Anwendungen', 'APP.4.6 SAP ABAP-Programmierung', 'APP.4.6.A2 Formal korrekte Auswertung von Berechtigungsprüfungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_4_6_SAP_ABAP-Programmierung.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.4.6.A20', 'APP - Anwendungen', 'APP.4.6 SAP ABAP-Programmierung', 'APP.4.6.A20 Keine Zugriffe auf Daten eines anderen Mandanten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_4_6_SAP_ABAP-Programmierung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.4.6.A21', 'APP - Anwendungen', 'APP.4.6 SAP ABAP-Programmierung', 'APP.4.6.A21 Verbot von verstecktem ABAP-Quelltext', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_4_6_SAP_ABAP-Programmierung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.4.6.A22', 'APP - Anwendungen', 'APP.4.6 SAP ABAP-Programmierung', 'APP.4.6.A22 Einsatz von ABAP-Codeanalyse Werkzeugen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_4_6_SAP_ABAP-Programmierung.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.4.6.A3', 'APP - Anwendungen', 'APP.4.6 SAP ABAP-Programmierung', 'APP.4.6.A3 Berechtigungsprüfung vor dem Start einer Transaktion', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_4_6_SAP_ABAP-Programmierung.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.4.6.A4', 'APP - Anwendungen', 'APP.4.6 SAP ABAP-Programmierung', 'APP.4.6.A4 Verzicht auf proprietäre Berechtigungsprüfungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_4_6_SAP_ABAP-Programmierung.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.4.6.A5', 'APP - Anwendungen', 'APP.4.6 SAP ABAP-Programmierung', 'APP.4.6.A5 Erstellung einer Richtlinie für die ABAP-Entwicklung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_4_6_SAP_ABAP-Programmierung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.4.6.A6', 'APP - Anwendungen', 'APP.4.6 SAP ABAP-Programmierung', 'APP.4.6.A6 Vollständige Ausführung von Berechtigungsprüfungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_4_6_SAP_ABAP-Programmierung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.4.6.A7', 'APP - Anwendungen', 'APP.4.6 SAP ABAP-Programmierung', 'APP.4.6.A7 Berechtigungsprüfung während der Eingabeverarbeitung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_4_6_SAP_ABAP-Programmierung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.4.6.A8', 'APP - Anwendungen', 'APP.4.6 SAP ABAP-Programmierung', 'APP.4.6.A8 Schutz vor unberechtigten oder manipulierenden Zugriffen auf das Dateisystem', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_4_6_SAP_ABAP-Programmierung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.4.6.A9', 'APP - Anwendungen', 'APP.4.6 SAP ABAP-Programmierung', 'APP.4.6.A9 Berechtigungsprüfung in remote-fähigen Funktionsbausteinen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_4_6_SAP_ABAP-Programmierung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.5.1.A1', 'APP - Anwendungen', 'APP.5.1 Allgemeine Groupware', 'APP.5.1.A1 Sichere Installation von Groupware-Systemen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_5_1_Allgemeine_Groupware.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.5.1.A10', 'APP - Anwendungen', 'APP.5.1 Allgemeine Groupware', 'APP.5.1.A10 ENTFALLEN', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_5_1_Allgemeine_Groupware.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.5.1.A11', 'APP - Anwendungen', 'APP.5.1 Allgemeine Groupware', 'APP.5.1.A11 ENTFALLEN', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_5_1_Allgemeine_Groupware.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.5.1.A12', 'APP - Anwendungen', 'APP.5.1 Allgemeine Groupware', 'APP.5.1.A12 Schulung zu Sicherheitsmechanismen von Groupware-Clients für Benutzer', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_5_1_Allgemeine_Groupware.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.5.1.A13', 'APP - Anwendungen', 'APP.5.1 Allgemeine Groupware', 'APP.5.1.A13 ENTFALLEN', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_5_1_Allgemeine_Groupware.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.5.1.A14', 'APP - Anwendungen', 'APP.5.1 Allgemeine Groupware', 'APP.5.1.A14 ENTFALLEN', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_5_1_Allgemeine_Groupware.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.5.1.A15', 'APP - Anwendungen', 'APP.5.1 Allgemeine Groupware', 'APP.5.1.A15 ENTFALLEN', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_5_1_Allgemeine_Groupware.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.5.1.A16', 'APP - Anwendungen', 'APP.5.1 Allgemeine Groupware', 'APP.5.1.A16 Umgang mit SPAM durch Benutzer', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_5_1_Allgemeine_Groupware.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.5.1.A17', 'APP - Anwendungen', 'APP.5.1 Allgemeine Groupware', 'APP.5.1.A17 Auswahl eines Groupware- oder E-Mail-Providers', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_5_1_Allgemeine_Groupware.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.5.1.A18', 'APP - Anwendungen', 'APP.5.1 Allgemeine Groupware', 'APP.5.1.A18 Erweiterter Spamschutz auf dem E-Mailserver', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_5_1_Allgemeine_Groupware.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.5.1.A19', 'APP - Anwendungen', 'APP.5.1 Allgemeine Groupware', 'APP.5.1.A19 ENTFALLEN', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_5_1_Allgemeine_Groupware.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.5.1.A2', 'APP - Anwendungen', 'APP.5.1 Allgemeine Groupware', 'APP.5.1.A2 Sichere Konfiguration der Groupware-Clients', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_5_1_Allgemeine_Groupware.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.5.1.A20', 'APP - Anwendungen', 'APP.5.1 Allgemeine Groupware', 'APP.5.1.A20 ENTFALLEN', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_5_1_Allgemeine_Groupware.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.5.1.A21', 'APP - Anwendungen', 'APP.5.1 Allgemeine Groupware', 'APP.5.1.A21 Ende-zu-Ende-Verschlüsselung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_5_1_Allgemeine_Groupware.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.5.1.A22', 'APP - Anwendungen', 'APP.5.1 Allgemeine Groupware', 'APP.5.1.A22 Spam- und Virenschutz auf dem E-Mailserver', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_5_1_Allgemeine_Groupware.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.5.1.A3', 'APP - Anwendungen', 'APP.5.1 Allgemeine Groupware', 'APP.5.1.A3 Sicherer Betrieb von Groupware-Systemen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_5_1_Allgemeine_Groupware.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.5.1.A4', 'APP - Anwendungen', 'APP.5.1 Allgemeine Groupware', 'APP.5.1.A4 Datensicherung und Archivierung bei Groupware', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_5_1_Allgemeine_Groupware.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.5.1.A5', 'APP - Anwendungen', 'APP.5.1 Allgemeine Groupware', 'APP.5.1.A5 ENTFALLEN', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_5_1_Allgemeine_Groupware.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.5.1.A6', 'APP - Anwendungen', 'APP.5.1 Allgemeine Groupware', 'APP.5.1.A6 Festlegung von Vertretungsregelungen bei E-Mail-Nutzung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_5_1_Allgemeine_Groupware.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.5.1.A7', 'APP - Anwendungen', 'APP.5.1 Allgemeine Groupware', 'APP.5.1.A7 Planung des sicheren Einsatzes von Groupware-Systemen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_5_1_Allgemeine_Groupware.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.5.1.A8', 'APP - Anwendungen', 'APP.5.1 Allgemeine Groupware', 'APP.5.1.A8 Festlegung einer Sicherheitsrichtlinie für Groupware', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_5_1_Allgemeine_Groupware.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.5.1.A9', 'APP - Anwendungen', 'APP.5.1 Allgemeine Groupware', 'APP.5.1.A9 ENTFALLEN', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_5_1_Allgemeine_Groupware.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.5.2.A1', 'APP - Anwendungen', 'APP.5.2 Microsoft Exchange und Outlook', 'APP.5.2.A1 Planung des Einsatzes von Microsoft Exchange und Outlook', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_5_2_Microsoft_Exchange_und_Outlook.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.5.2.A10', 'APP - Anwendungen', 'APP.5.2 Microsoft Exchange und Outlook', 'APP.5.2.A10 Sichere Konfiguration von Outlook', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_5_2_Microsoft_Exchange_und_Outlook.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.5.2.A11', 'APP - Anwendungen', 'APP.5.2 Microsoft Exchange und Outlook', 'APP.5.2.A11 Absicherung der Kommunikation zwischen Microsoft Exchange-Systemen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_5_2_Microsoft_Exchange_und_Outlook.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.5.2.A12', 'APP - Anwendungen', 'APP.5.2 Microsoft Exchange und Outlook', 'APP.5.2.A12 Einsatz von Outlook Anywhere, MAPI over HTTP und Outlook Web App', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_5_2_Microsoft_Exchange_und_Outlook.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.5.2.A13', 'APP - Anwendungen', 'APP.5.2 Microsoft Exchange und Outlook', 'APP.5.2.A13 ENTFALLEN', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_5_2_Microsoft_Exchange_und_Outlook.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.5.2.A14', 'APP - Anwendungen', 'APP.5.2 Microsoft Exchange und Outlook', 'APP.5.2.A14 Schulung zu Sicherheitsmechanismen von Outlook für Anwender', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_5_2_Microsoft_Exchange_und_Outlook.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.5.2.A15', 'APP - Anwendungen', 'APP.5.2 Microsoft Exchange und Outlook', 'APP.5.2.A15 Betriebsdokumentation für Microsoft Exchange', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_5_2_Microsoft_Exchange_und_Outlook.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.5.2.A16', 'APP - Anwendungen', 'APP.5.2 Microsoft Exchange und Outlook', 'APP.5.2.A16 ENTFALLEN', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_5_2_Microsoft_Exchange_und_Outlook.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.5.2.A17', 'APP - Anwendungen', 'APP.5.2 Microsoft Exchange und Outlook', 'APP.5.2.A17 Verschlüsselung von Microsoft Exchange-Datenbankdateien', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_5_2_Microsoft_Exchange_und_Outlook.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.5.2.A18', 'APP - Anwendungen', 'APP.5.2 Microsoft Exchange und Outlook', 'APP.5.2.A18 ENTFALLEN', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_5_2_Microsoft_Exchange_und_Outlook.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.5.2.A19', 'APP - Anwendungen', 'APP.5.2 Microsoft Exchange und Outlook', 'APP.5.2.A19 Erstellung einer Sicherheitsrichtlinie für Microsoft Exchange', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_5_2_Microsoft_Exchange_und_Outlook.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.5.2.A2', 'APP - Anwendungen', 'APP.5.2 Microsoft Exchange und Outlook', 'APP.5.2.A2 Auswahl einer geeigneten Microsoft Exchange-Infrastruktur', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_5_2_Microsoft_Exchange_und_Outlook.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.5.2.A3', 'APP - Anwendungen', 'APP.5.2 Microsoft Exchange und Outlook', 'APP.5.2.A3 Berechtigungsmanagement und Zugriffsrechte', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_5_2_Microsoft_Exchange_und_Outlook.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.5.2.A4', 'APP - Anwendungen', 'APP.5.2 Microsoft Exchange und Outlook', 'APP.5.2.A4 ENTFALLEN', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_5_2_Microsoft_Exchange_und_Outlook.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.5.2.A5', 'APP - Anwendungen', 'APP.5.2 Microsoft Exchange und Outlook', 'APP.5.2.A5 Datensicherung von Microsoft Exchange', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_5_2_Microsoft_Exchange_und_Outlook.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.5.2.A6', 'APP - Anwendungen', 'APP.5.2 Microsoft Exchange und Outlook', 'APP.5.2.A6 ENTFALLEN', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_5_2_Microsoft_Exchange_und_Outlook.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.5.2.A7', 'APP - Anwendungen', 'APP.5.2 Microsoft Exchange und Outlook', 'APP.5.2.A7 Migration von Microsoft Exchange-Systemen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_5_2_Microsoft_Exchange_und_Outlook.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.5.2.A8', 'APP - Anwendungen', 'APP.5.2 Microsoft Exchange und Outlook', 'APP.5.2.A8 ENTFALLEN', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_5_2_Microsoft_Exchange_und_Outlook.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('APP.5.2.A9', 'APP - Anwendungen', 'APP.5.2 Microsoft Exchange und Outlook', 'APP.5.2.A9 Sichere Konfiguration von Microsoft Exchange-Servern', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/APP/APP_5_2_Microsoft_Exchange_und_Outlook.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.1.A1', 'CON - Konzepte und Vorgehensweisen', 'CON.1 Kryptokonzept', 'CON.1.A1 Auswahl geeigneter kryptografischer Verfahren', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_1_Kryptokonzept.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.1.A10', 'CON - Konzepte und Vorgehensweisen', 'CON.1 Kryptokonzept', 'CON.1.A10 Entwicklung eines Kryptokonzepts', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_1_Kryptokonzept.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.1.A11', 'CON - Konzepte und Vorgehensweisen', 'CON.1 Kryptokonzept', 'CON.1.A11 Sichere Konfiguration der Kryptomodule', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_1_Kryptokonzept.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.1.A12', 'CON - Konzepte und Vorgehensweisen', 'CON.1 Kryptokonzept', 'CON.1.A12 Sichere Rollenteilung beim Einsatz von Kryptomodulen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_1_Kryptokonzept.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.1.A13', 'CON - Konzepte und Vorgehensweisen', 'CON.1 Kryptokonzept', 'CON.1.A13 Anforderungen an die Betriebssystem-Sicherheit beim Einsatz von Kryptomodulen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_1_Kryptokonzept.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.1.A14', 'CON - Konzepte und Vorgehensweisen', 'CON.1 Kryptokonzept', 'CON.1.A14 Schulung von Benutzern und Administratoren', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_1_Kryptokonzept.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.1.A15', 'CON - Konzepte und Vorgehensweisen', 'CON.1 Kryptokonzept', 'CON.1.A15 Reaktion auf praktische Schwächung eines Kryptoverfahrens', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_1_Kryptokonzept.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.1.A16', 'CON - Konzepte und Vorgehensweisen', 'CON.1 Kryptokonzept', 'CON.1.A16 Physische Absicherung von Kryptomodulen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_1_Kryptokonzept.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.1.A17', 'CON - Konzepte und Vorgehensweisen', 'CON.1 Kryptokonzept', 'CON.1.A17 Abstrahlsicherheit', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_1_Kryptokonzept.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.1.A18', 'CON - Konzepte und Vorgehensweisen', 'CON.1 Kryptokonzept', 'CON.1.A18 Kryptografische Ersatzmodule', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_1_Kryptokonzept.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.1.A2', 'CON - Konzepte und Vorgehensweisen', 'CON.1 Kryptokonzept', 'CON.1.A2 Datensicherung bei Einsatz kryptografischer Verfahren', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_1_Kryptokonzept.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.1.A3', 'CON - Konzepte und Vorgehensweisen', 'CON.1 Kryptokonzept', 'CON.1.A3 Verschlüsselung der Kommunikationsverbindungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_1_Kryptokonzept.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.1.A4', 'CON - Konzepte und Vorgehensweisen', 'CON.1 Kryptokonzept', 'CON.1.A4 Geeignetes Schlüsselmanagement', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_1_Kryptokonzept.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.1.A5', 'CON - Konzepte und Vorgehensweisen', 'CON.1 Kryptokonzept', 'CON.1.A5 Sicheres Löschen und Vernichten von kryptografischen Schlüsseln', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_1_Kryptokonzept.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.1.A6', 'CON - Konzepte und Vorgehensweisen', 'CON.1 Kryptokonzept', 'CON.1.A6 Bedarfserhebung für kryptografische Verfahren und Produkte', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_1_Kryptokonzept.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.1.A7', 'CON - Konzepte und Vorgehensweisen', 'CON.1 Kryptokonzept', 'CON.1.A7 Erstellung einer Sicherheitsrichtlinie für den Einsatz kryptografischer Verfahren und Produkte', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_1_Kryptokonzept.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.1.A8', 'CON - Konzepte und Vorgehensweisen', 'CON.1 Kryptokonzept', 'CON.1.A8 Erhebung der Einflussfaktoren für kryptografische Verfahren und Produkte', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_1_Kryptokonzept.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.1.A9', 'CON - Konzepte und Vorgehensweisen', 'CON.1 Kryptokonzept', 'CON.1.A9 Auswahl eines geeigneten kryptografischen Produkts', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_1_Kryptokonzept.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.2.A1', 'CON - Konzepte und Vorgehensweisen', 'CON.2 Datenschutz', 'CON.2.A1 Umsetzung Standard-Datenschutzmodell', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_2_Datenschutz.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.3.A1', 'CON - Konzepte und Vorgehensweisen', 'CON.3 Datensicherungskonzept', 'CON.3.A1 Erhebung der Einflussfaktoren für Datensicherungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_3_Datensicherungskonzept.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.3.A10', 'CON - Konzepte und Vorgehensweisen', 'CON.3 Datensicherungskonzept', 'CON.3.A10 Verpflichtung der Mitarbeiter zur Datensicherung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_3_Datensicherungskonzept.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.3.A11', 'CON - Konzepte und Vorgehensweisen', 'CON.3 Datensicherungskonzept', 'CON.3.A11 Sicherungskopie der eingesetzten Software', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_3_Datensicherungskonzept.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.3.A12', 'CON - Konzepte und Vorgehensweisen', 'CON.3 Datensicherungskonzept', 'CON.3.A12 Geeignete Aufbewahrung der Backup-Datenträger', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_3_Datensicherungskonzept.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.3.A13', 'CON - Konzepte und Vorgehensweisen', 'CON.3 Datensicherungskonzept', 'CON.3.A13 Einsatz kryptografischer Verfahren bei der Datensicherung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_3_Datensicherungskonzept.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.3.A2', 'CON - Konzepte und Vorgehensweisen', 'CON.3 Datensicherungskonzept', 'CON.3.A2 Festlegung der Verfahrensweise für die Datensicherung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_3_Datensicherungskonzept.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.3.A3', 'CON - Konzepte und Vorgehensweisen', 'CON.3 Datensicherungskonzept', 'CON.3.A3 ENTFALLEN', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_3_Datensicherungskonzept.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.3.A4', 'CON - Konzepte und Vorgehensweisen', 'CON.3 Datensicherungskonzept', 'CON.3.A4 Erstellung eines Minimaldatensicherungskonzeptes', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_3_Datensicherungskonzept.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.3.A5', 'CON - Konzepte und Vorgehensweisen', 'CON.3 Datensicherungskonzept', 'CON.3.A5 Regelmäßige Datensicherung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_3_Datensicherungskonzept.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.3.A6', 'CON - Konzepte und Vorgehensweisen', 'CON.3 Datensicherungskonzept', 'CON.3.A6 Entwicklung eines Datensicherungskonzepts', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_3_Datensicherungskonzept.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.3.A7', 'CON - Konzepte und Vorgehensweisen', 'CON.3 Datensicherungskonzept', 'CON.3.A7 Beschaffung eines geeigneten Datensicherungssystems', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_3_Datensicherungskonzept.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.3.A8', 'CON - Konzepte und Vorgehensweisen', 'CON.3 Datensicherungskonzept', 'CON.3.A8 ENTFALLEN', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_3_Datensicherungskonzept.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.3.A9', 'CON - Konzepte und Vorgehensweisen', 'CON.3 Datensicherungskonzept', 'CON.3.A9 Voraussetzungen für die Online-Datensicherung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_3_Datensicherungskonzept.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.4.A1', 'CON - Konzepte und Vorgehensweisen', 'CON.4 Auswahl und Einsatz von Standardsoftware', 'CON.4.A1 Sicherstellen der Integrität von Standardsoftware', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_4_Auswahl_und_Einsatz_von_Standardsoftware.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.4.A10', 'CON - Konzepte und Vorgehensweisen', 'CON.4 Auswahl und Einsatz von Standardsoftware', 'CON.4.A10 Implementierung zusätzlicher Sicherheitsfunktionen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_4_Auswahl_und_Einsatz_von_Standardsoftware.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.4.A11', 'CON - Konzepte und Vorgehensweisen', 'CON.4 Auswahl und Einsatz von Standardsoftware', 'CON.4.A11 Nutzung zertifizierter Standardsoftware', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_4_Auswahl_und_Einsatz_von_Standardsoftware.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.4.A12', 'CON - Konzepte und Vorgehensweisen', 'CON.4 Auswahl und Einsatz von Standardsoftware', 'CON.4.A12 Einsatz von Verschlüsselung, Checksummen oder digitalen Signaturen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_4_Auswahl_und_Einsatz_von_Standardsoftware.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.4.A2', 'CON - Konzepte und Vorgehensweisen', 'CON.4 Auswahl und Einsatz von Standardsoftware', 'CON.4.A2 Entwicklung der Installationsanweisung für Standardsoftware', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_4_Auswahl_und_Einsatz_von_Standardsoftware.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.4.A3', 'CON - Konzepte und Vorgehensweisen', 'CON.4 Auswahl und Einsatz von Standardsoftware', 'CON.4.A3 Sichere Installation und Konfiguration von Standardsoftware', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_4_Auswahl_und_Einsatz_von_Standardsoftware.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.4.A4', 'CON - Konzepte und Vorgehensweisen', 'CON.4 Auswahl und Einsatz von Standardsoftware', 'CON.4.A4 Festlegung der Verantwortlichkeiten im Bereich Standardsoftware', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_4_Auswahl_und_Einsatz_von_Standardsoftware.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.4.A5', 'CON - Konzepte und Vorgehensweisen', 'CON.4 Auswahl und Einsatz von Standardsoftware', 'CON.4.A5 Erstellung eines Anforderungskatalogs für Standardsoftware', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_4_Auswahl_und_Einsatz_von_Standardsoftware.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.4.A6', 'CON - Konzepte und Vorgehensweisen', 'CON.4 Auswahl und Einsatz von Standardsoftware', 'CON.4.A6 Auswahl einer geeigneten Standardsoftware', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_4_Auswahl_und_Einsatz_von_Standardsoftware.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.4.A7', 'CON - Konzepte und Vorgehensweisen', 'CON.4 Auswahl und Einsatz von Standardsoftware', 'CON.4.A7 Überprüfung der Lieferung von Standardsoftware', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_4_Auswahl_und_Einsatz_von_Standardsoftware.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.4.A8', 'CON - Konzepte und Vorgehensweisen', 'CON.4 Auswahl und Einsatz von Standardsoftware', 'CON.4.A8 Lizenzverwaltung und Versionskontrolle von Standardsoftware', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_4_Auswahl_und_Einsatz_von_Standardsoftware.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.4.A9', 'CON - Konzepte und Vorgehensweisen', 'CON.4 Auswahl und Einsatz von Standardsoftware', 'CON.4.A9 Deinstallation von Standardsoftware', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_4_Auswahl_und_Einsatz_von_Standardsoftware.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.5.A1', 'CON - Konzepte und Vorgehensweisen', 'CON.5 Entwicklung und Einsatz von Individualsoftware', 'CON.5.A1 Festlegung benötigter Sicherheitsfunktionen der Individualsoftware', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_5_Entwicklung_und_Einsatz_von_Individualsoftware.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.5.A10', 'CON - Konzepte und Vorgehensweisen', 'CON.5 Entwicklung und Einsatz von Individualsoftware', 'CON.5.A10 ENTFALLEN', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_5_Entwicklung_und_Einsatz_von_Individualsoftware.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.5.A11', 'CON - Konzepte und Vorgehensweisen', 'CON.5 Entwicklung und Einsatz von Individualsoftware', 'CON.5.A11 Geeignete und rechtskonforme Beschaffung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_5_Entwicklung_und_Einsatz_von_Individualsoftware.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.5.A12', 'CON - Konzepte und Vorgehensweisen', 'CON.5 Entwicklung und Einsatz von Individualsoftware', 'CON.5.A12 Treuhänderische Hinterlegung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_5_Entwicklung_und_Einsatz_von_Individualsoftware.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.5.A13', 'CON - Konzepte und Vorgehensweisen', 'CON.5 Entwicklung und Einsatz von Individualsoftware', 'CON.5.A13 Entwicklung eines Redundanzkonzeptes für Anwendungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_5_Entwicklung_und_Einsatz_von_Individualsoftware.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.5.A2', 'CON - Konzepte und Vorgehensweisen', 'CON.5 Entwicklung und Einsatz von Individualsoftware', 'CON.5.A2 ENTFALLEN', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_5_Entwicklung_und_Einsatz_von_Individualsoftware.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.5.A3', 'CON - Konzepte und Vorgehensweisen', 'CON.5 Entwicklung und Einsatz von Individualsoftware', 'CON.5.A3 Sichere Installation von Individualsoftware', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_5_Entwicklung_und_Einsatz_von_Individualsoftware.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.5.A4', 'CON - Konzepte und Vorgehensweisen', 'CON.5 Entwicklung und Einsatz von Individualsoftware', 'CON.5.A4 Heranführen von Benutzerinnen und Benutzern an Individualsoftware', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_5_Entwicklung_und_Einsatz_von_Individualsoftware.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.5.A5', 'CON - Konzepte und Vorgehensweisen', 'CON.5 Entwicklung und Einsatz von Individualsoftware', 'CON.5.A5 ENTFALLEN', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_5_Entwicklung_und_Einsatz_von_Individualsoftware.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.5.A6', 'CON - Konzepte und Vorgehensweisen', 'CON.5 Entwicklung und Einsatz von Individualsoftware', 'CON.5.A6 Dokumentation der Anforderungen an die Individualsoftware', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_5_Entwicklung_und_Einsatz_von_Individualsoftware.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.5.A7', 'CON - Konzepte und Vorgehensweisen', 'CON.5 Entwicklung und Einsatz von Individualsoftware', 'CON.5.A7 ENTFALLEN', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_5_Entwicklung_und_Einsatz_von_Individualsoftware.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.5.A8', 'CON - Konzepte und Vorgehensweisen', 'CON.5 Entwicklung und Einsatz von Individualsoftware', 'CON.5.A8 Geeignete Steuerung der Anwendungsentwicklung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_5_Entwicklung_und_Einsatz_von_Individualsoftware.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.5.A9', 'CON - Konzepte und Vorgehensweisen', 'CON.5 Entwicklung und Einsatz von Individualsoftware', 'CON.5.A9 Außerbetriebnahme von Individualsoftware', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_5_Entwicklung_und_Einsatz_von_Individualsoftware.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.6.A1', 'CON - Konzepte und Vorgehensweisen', 'CON.6 Löschen und Vernichten', 'CON.6.A1 Regelung der Vorgehensweise für die Löschung und Vernichtung von Informationen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_6_Löschen_und_Vernichten.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.6.A10', 'CON - Konzepte und Vorgehensweisen', 'CON.6 Löschen und Vernichten', 'CON.6.A10 Beschaffung geeigneter Geräte zur Löschung oder Vernichtung von Daten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_6_Löschen_und_Vernichten.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.6.A11', 'CON - Konzepte und Vorgehensweisen', 'CON.6 Löschen und Vernichten', 'CON.6.A11 Vernichtung von Datenträgern durch externe Dienstleister', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_6_Löschen_und_Vernichten.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.6.A2', 'CON - Konzepte und Vorgehensweisen', 'CON.6 Löschen und Vernichten', 'CON.6.A2 Ordnungsgemäße Entsorgung von schützenswerten Betriebsmitteln und Informationen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_6_Löschen_und_Vernichten.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.6.A3', 'CON - Konzepte und Vorgehensweisen', 'CON.6 Löschen und Vernichten', 'CON.6.A3 Löschen der Datenträger vor und nach dem Austausch', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_6_Löschen_und_Vernichten.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.6.A4', 'CON - Konzepte und Vorgehensweisen', 'CON.6 Löschen und Vernichten', 'CON.6.A4 Auswahl geeigneter Verfahren zur Löschung oder Vernichtung von Datenträgern', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_6_Löschen_und_Vernichten.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.6.A5', 'CON - Konzepte und Vorgehensweisen', 'CON.6 Löschen und Vernichten', 'CON.6.A5 Geregelte Außerbetriebnahme von IT-Systemen und Datenträgern', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_6_Löschen_und_Vernichten.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.6.A6', 'CON - Konzepte und Vorgehensweisen', 'CON.6 Löschen und Vernichten', 'CON.6.A6 Einweisung aller Mitarbeiter in die Methoden zur Löschung oder Vernichtung von Informationen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_6_Löschen_und_Vernichten.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.6.A7', 'CON - Konzepte und Vorgehensweisen', 'CON.6 Löschen und Vernichten', 'CON.6.A7 Beseitigung von Restinformationen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_6_Löschen_und_Vernichten.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.6.A8', 'CON - Konzepte und Vorgehensweisen', 'CON.6 Löschen und Vernichten', 'CON.6.A8 Erstellung einer Richtlinie für die Löschung und Vernichtung von Informationen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_6_Löschen_und_Vernichten.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.6.A9', 'CON - Konzepte und Vorgehensweisen', 'CON.6 Löschen und Vernichten', 'CON.6.A9 Auswahl geeigneter Verfahren zur Löschung oder Vernichtung von Datenträgern bei erhöhtem Schutzbedarf', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_6_Löschen_und_Vernichten.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.7.A1', 'CON - Konzepte und Vorgehensweisen', 'CON.7 Informationssicherheit auf Auslandsreisen', 'CON.7.A1 Sicherheitsrichtlinie zur Informationssicherheit auf Auslandsreisen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_7_Informationssicherheit_auf_Auslandsreisen.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.7.A10', 'CON - Konzepte und Vorgehensweisen', 'CON.7 Informationssicherheit auf Auslandsreisen', 'CON.7.A10 Verschlüsselung tragbarer IT-Systeme und Datenträger', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_7_Informationssicherheit_auf_Auslandsreisen.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.7.A11', 'CON - Konzepte und Vorgehensweisen', 'CON.7 Informationssicherheit auf Auslandsreisen', 'CON.7.A11 Einsatz von Diebstahl-Sicherungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_7_Informationssicherheit_auf_Auslandsreisen.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.7.A12', 'CON - Konzepte und Vorgehensweisen', 'CON.7 Informationssicherheit auf Auslandsreisen', 'CON.7.A12 Sicheres Vernichten von schutzbedürftigen Materialien und Dokumenten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_7_Informationssicherheit_auf_Auslandsreisen.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.7.A13', 'CON - Konzepte und Vorgehensweisen', 'CON.7 Informationssicherheit auf Auslandsreisen', 'CON.7.A13 Mitnahme notwendiger Daten und Datenträger', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_7_Informationssicherheit_auf_Auslandsreisen.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.7.A14', 'CON - Konzepte und Vorgehensweisen', 'CON.7 Informationssicherheit auf Auslandsreisen', 'CON.7.A14 Kryptografisch abgesicherte E-Mail-Kommunikation', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_7_Informationssicherheit_auf_Auslandsreisen.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.7.A15', 'CON - Konzepte und Vorgehensweisen', 'CON.7 Informationssicherheit auf Auslandsreisen', 'CON.7.A15 Abstrahlsicherheit tragbarer IT-Systeme', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_7_Informationssicherheit_auf_Auslandsreisen.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.7.A16', 'CON - Konzepte und Vorgehensweisen', 'CON.7 Informationssicherheit auf Auslandsreisen', 'CON.7.A16 Integritätsschutz durch Check-Summen oder digitale Signaturen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_7_Informationssicherheit_auf_Auslandsreisen.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.7.A17', 'CON - Konzepte und Vorgehensweisen', 'CON.7 Informationssicherheit auf Auslandsreisen', 'CON.7.A17 Verwendung vorkonfigurierter Reise-Hardware', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_7_Informationssicherheit_auf_Auslandsreisen.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.7.A18', 'CON - Konzepte und Vorgehensweisen', 'CON.7 Informationssicherheit auf Auslandsreisen', 'CON.7.A18 Eingeschränkte Berechtigungen auf Auslandsreisen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_7_Informationssicherheit_auf_Auslandsreisen.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.7.A2', 'CON - Konzepte und Vorgehensweisen', 'CON.7 Informationssicherheit auf Auslandsreisen', 'CON.7.A2 Sensibilisierung der Mitarbeiter zur Informationssicherheit auf Auslandsreisen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_7_Informationssicherheit_auf_Auslandsreisen.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.7.A3', 'CON - Konzepte und Vorgehensweisen', 'CON.7 Informationssicherheit auf Auslandsreisen', 'CON.7.A3 Identifikation länderspezifischer Regelungen, Reise- und Umgebungsbedingungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_7_Informationssicherheit_auf_Auslandsreisen.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.7.A4', 'CON - Konzepte und Vorgehensweisen', 'CON.7 Informationssicherheit auf Auslandsreisen', 'CON.7.A4 Verwendung von Sichtschutz-Folien', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_7_Informationssicherheit_auf_Auslandsreisen.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.7.A5', 'CON - Konzepte und Vorgehensweisen', 'CON.7 Informationssicherheit auf Auslandsreisen', 'CON.7.A5 Verwendung der Bildschirm-/Code-Sperre', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_7_Informationssicherheit_auf_Auslandsreisen.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.7.A6', 'CON - Konzepte und Vorgehensweisen', 'CON.7 Informationssicherheit auf Auslandsreisen', 'CON.7.A6 Zeitnahe Verlustmeldung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_7_Informationssicherheit_auf_Auslandsreisen.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.7.A7', 'CON - Konzepte und Vorgehensweisen', 'CON.7 Informationssicherheit auf Auslandsreisen', 'CON.7.A7 Sicherer Remote-Zugriff auf das Netz der Institution', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_7_Informationssicherheit_auf_Auslandsreisen.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.7.A8', 'CON - Konzepte und Vorgehensweisen', 'CON.7 Informationssicherheit auf Auslandsreisen', 'CON.7.A8 Sichere Nutzung von öffentlichen WLANs', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_7_Informationssicherheit_auf_Auslandsreisen.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.7.A9', 'CON - Konzepte und Vorgehensweisen', 'CON.7 Informationssicherheit auf Auslandsreisen', 'CON.7.A9 Sicherer Umgang mit mobilen Datenträgern', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_7_Informationssicherheit_auf_Auslandsreisen.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.8.A1', 'CON - Konzepte und Vorgehensweisen', 'CON.8 Software-Entwicklung', 'CON.8.A1 Definition von Rollen und Verantwortlichkeiten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_8_Software-Entwicklung.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.8.A10', 'CON - Konzepte und Vorgehensweisen', 'CON.8 Software-Entwicklung', 'CON.8.A10 Versionsverwaltung des Quellcodes', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_8_Software-Entwicklung.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.8.A11', 'CON - Konzepte und Vorgehensweisen', 'CON.8 Software-Entwicklung', 'CON.8.A11 Erstellung einer Richtlinie für die Software-Entwicklung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_8_Software-Entwicklung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.8.A12', 'CON - Konzepte und Vorgehensweisen', 'CON.8 Software-Entwicklung', 'CON.8.A12 Ausführliche Dokumentation', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_8_Software-Entwicklung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.8.A13', 'CON - Konzepte und Vorgehensweisen', 'CON.8 Software-Entwicklung', 'CON.8.A13 Beschaffung von Werkzeugen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_8_Software-Entwicklung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.8.A14', 'CON - Konzepte und Vorgehensweisen', 'CON.8 Software-Entwicklung', 'CON.8.A14 Schulung des Projektteams zur Informationssicherheit', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_8_Software-Entwicklung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.8.A15', 'CON - Konzepte und Vorgehensweisen', 'CON.8 Software-Entwicklung', 'CON.8.A15 Sicherer Einsatz der Test- und Entwicklungsumgebungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_8_Software-Entwicklung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.8.A16', 'CON - Konzepte und Vorgehensweisen', 'CON.8 Software-Entwicklung', 'CON.8.A16 Geeignete Steuerung der Software-Entwicklung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_8_Software-Entwicklung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.8.A17', 'CON - Konzepte und Vorgehensweisen', 'CON.8 Software-Entwicklung', 'CON.8.A17 Auswahl vertrauenswürdiger Entwicklungswerkzeuge', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_8_Software-Entwicklung.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.8.A18', 'CON - Konzepte und Vorgehensweisen', 'CON.8 Software-Entwicklung', 'CON.8.A18 Regelmäßige Sicherheitsaudits für die Entwicklungsumgebung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_8_Software-Entwicklung.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.8.A19', 'CON - Konzepte und Vorgehensweisen', 'CON.8 Software-Entwicklung', 'CON.8.A19 Regelmäßige Integritätsprüfung der Entwicklungsumgebung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_8_Software-Entwicklung.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.8.A2', 'CON - Konzepte und Vorgehensweisen', 'CON.8 Software-Entwicklung', 'CON.8.A2 Auswahl eines Vorgehensmodells', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_8_Software-Entwicklung.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.8.A3', 'CON - Konzepte und Vorgehensweisen', 'CON.8 Software-Entwicklung', 'CON.8.A3 Auswahl einer Entwicklungsumgebung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_8_Software-Entwicklung.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.8.A4', 'CON - Konzepte und Vorgehensweisen', 'CON.8 Software-Entwicklung', 'CON.8.A4 Einhaltung einer sicheren Vorgehensweise', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_8_Software-Entwicklung.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.8.A5', 'CON - Konzepte und Vorgehensweisen', 'CON.8 Software-Entwicklung', 'CON.8.A5 Sicheres Systemdesign', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_8_Software-Entwicklung.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.8.A6', 'CON - Konzepte und Vorgehensweisen', 'CON.8 Software-Entwicklung', 'CON.8.A6 Verwendung von Bibliotheken aus vertrauenswürdigen Quellen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_8_Software-Entwicklung.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.8.A7', 'CON - Konzepte und Vorgehensweisen', 'CON.8 Software-Entwicklung', 'CON.8.A7 Anwendung von Testverfahren', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_8_Software-Entwicklung.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.8.A8', 'CON - Konzepte und Vorgehensweisen', 'CON.8 Software-Entwicklung', 'CON.8.A8 Bereitstellung von Patches, Updates und Änderungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_8_Software-Entwicklung.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.8.A9', 'CON - Konzepte und Vorgehensweisen', 'CON.8 Software-Entwicklung', 'CON.8.A9 Berücksichtigung von Compliance-Anforderungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_8_Software-Entwicklung.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.9.A1', 'CON - Konzepte und Vorgehensweisen', 'CON.9 Informationsaustausch', 'CON.9.A1 Festlegung zulässiger Empfänger', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_9_Informationsaustausch.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.9.A2', 'CON - Konzepte und Vorgehensweisen', 'CON.9 Informationsaustausch', 'CON.9.A2 Regelung des Informationsaustausches', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_9_Informationsaustausch.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.9.A3', 'CON - Konzepte und Vorgehensweisen', 'CON.9 Informationsaustausch', 'CON.9.A3 Unterweisung des Personals zum Informationsaustausch', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_9_Informationsaustausch.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.9.A4', 'CON - Konzepte und Vorgehensweisen', 'CON.9 Informationsaustausch', 'CON.9.A4 Vereinbarungen zum Informationsaustausch mit Externen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_9_Informationsaustausch.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.9.A5', 'CON - Konzepte und Vorgehensweisen', 'CON.9 Informationsaustausch', 'CON.9.A5 Beseitigung von Restinformationen in Dateien vor Weitergabe', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_9_Informationsaustausch.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.9.A6', 'CON - Konzepte und Vorgehensweisen', 'CON.9 Informationsaustausch', 'CON.9.A6 Kompatibilitätsprüfung des Sender- und Empfängersystems', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_9_Informationsaustausch.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.9.A7', 'CON - Konzepte und Vorgehensweisen', 'CON.9 Informationsaustausch', 'CON.9.A7 Sicherungskopie der übermittelten Daten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_9_Informationsaustausch.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('CON.9.A8', 'CON - Konzepte und Vorgehensweisen', 'CON.9 Informationsaustausch', 'CON.9.A8 Verschlüsselung und Signatur', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/CON/CON_9_Informationsaustausch.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.1.A1', 'DER - Detektion und Reaktion', 'DER.1 Detektion von sicherheitsrelevanten Ereignissen', 'DER.1.A1 Erstellung einer Sicherheitsrichtlinie für die Detektion von sicherheitsrelevanten Ereignissen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_1_Detektion_von_sicherheitsrelevanten_Ereignissen.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.1.A10', 'DER - Detektion und Reaktion', 'DER.1 Detektion von sicherheitsrelevanten Ereignissen', 'DER.1.A10 Einsatz von TLS-/SSH-Proxies', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_1_Detektion_von_sicherheitsrelevanten_Ereignissen.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.1.A11', 'DER - Detektion und Reaktion', 'DER.1 Detektion von sicherheitsrelevanten Ereignissen', 'DER.1.A11 Nutzung einer zentralen Protokollierungsinfrastruktur für die Auswertung sicherheitsrelevanter Ereignisse', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_1_Detektion_von_sicherheitsrelevanten_Ereignissen.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.1.A12', 'DER - Detektion und Reaktion', 'DER.1 Detektion von sicherheitsrelevanten Ereignissen', 'DER.1.A12 Auswertung von Informationen aus externen Quellen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_1_Detektion_von_sicherheitsrelevanten_Ereignissen.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.1.A13', 'DER - Detektion und Reaktion', 'DER.1 Detektion von sicherheitsrelevanten Ereignissen', 'DER.1.A13 Regelmäßige Audits der Detektionssysteme', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_1_Detektion_von_sicherheitsrelevanten_Ereignissen.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.1.A14', 'DER - Detektion und Reaktion', 'DER.1 Detektion von sicherheitsrelevanten Ereignissen', 'DER.1.A14 Auswertung der Protokolldaten durch spezialisiertes Personal', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_1_Detektion_von_sicherheitsrelevanten_Ereignissen.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.1.A15', 'DER - Detektion und Reaktion', 'DER.1 Detektion von sicherheitsrelevanten Ereignissen', 'DER.1.A15 Zentrale Detektion und Echtzeitüberprüfung von Ereignismeldungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_1_Detektion_von_sicherheitsrelevanten_Ereignissen.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.1.A16', 'DER - Detektion und Reaktion', 'DER.1 Detektion von sicherheitsrelevanten Ereignissen', 'DER.1.A16 Einsatz von Detektionssystemen nach Schutzbedarfsanforderungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_1_Detektion_von_sicherheitsrelevanten_Ereignissen.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.1.A17', 'DER - Detektion und Reaktion', 'DER.1 Detektion von sicherheitsrelevanten Ereignissen', 'DER.1.A17 Automatische Reaktion auf sicherheitsrelevante Ereignisse', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_1_Detektion_von_sicherheitsrelevanten_Ereignissen.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.1.A18', 'DER - Detektion und Reaktion', 'DER.1 Detektion von sicherheitsrelevanten Ereignissen', 'DER.1.A18 Durchführung regelmäßiger Integritätskontrollen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_1_Detektion_von_sicherheitsrelevanten_Ereignissen.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.1.A2', 'DER - Detektion und Reaktion', 'DER.1 Detektion von sicherheitsrelevanten Ereignissen', 'DER.1.A2 Einhaltung rechtlicher Bedingungen bei der Auswertung von Protokolldaten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_1_Detektion_von_sicherheitsrelevanten_Ereignissen.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.1.A3', 'DER - Detektion und Reaktion', 'DER.1 Detektion von sicherheitsrelevanten Ereignissen', 'DER.1.A3 Festlegung von Meldewegen für sicherheitsrelevante Ereignisse', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_1_Detektion_von_sicherheitsrelevanten_Ereignissen.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.1.A4', 'DER - Detektion und Reaktion', 'DER.1 Detektion von sicherheitsrelevanten Ereignissen', 'DER.1.A4 Sensibilisierung der Mitarbeiter', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_1_Detektion_von_sicherheitsrelevanten_Ereignissen.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.1.A5', 'DER - Detektion und Reaktion', 'DER.1 Detektion von sicherheitsrelevanten Ereignissen', 'DER.1.A5 Einsatz von mitgelieferten Systemfunktionen zur Detektion', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_1_Detektion_von_sicherheitsrelevanten_Ereignissen.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.1.A6', 'DER - Detektion und Reaktion', 'DER.1 Detektion von sicherheitsrelevanten Ereignissen', 'DER.1.A6 Kontinuierliche Überwachung und Auswertung von Protokolldaten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_1_Detektion_von_sicherheitsrelevanten_Ereignissen.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.1.A7', 'DER - Detektion und Reaktion', 'DER.1 Detektion von sicherheitsrelevanten Ereignissen', 'DER.1.A7 Schulung von Verantwortlichen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_1_Detektion_von_sicherheitsrelevanten_Ereignissen.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.1.A8', 'DER - Detektion und Reaktion', 'DER.1 Detektion von sicherheitsrelevanten Ereignissen', 'DER.1.A8 Festlegung von zu schützenden Segmenten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_1_Detektion_von_sicherheitsrelevanten_Ereignissen.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.1.A9', 'DER - Detektion und Reaktion', 'DER.1 Detektion von sicherheitsrelevanten Ereignissen', 'DER.1.A9 Einsatz zusätzlicher Detektionssysteme', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_1_Detektion_von_sicherheitsrelevanten_Ereignissen.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.2.1.A1', 'DER - Detektion und Reaktion', 'DER.2.1 Behandlung von Sicherheitsvorfällen', 'DER.2.1.A1 Definition eines Sicherheitsvorfalls', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_2_1_Behandlung_von_Sicherheitsvorfällen.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.2.1.A10', 'DER - Detektion und Reaktion', 'DER.2.1 Behandlung von Sicherheitsvorfällen', 'DER.2.1.A10 Eindämmen der Auswirkung von Sicherheitsvorfällen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_2_1_Behandlung_von_Sicherheitsvorfällen.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.2.1.A11', 'DER - Detektion und Reaktion', 'DER.2.1 Behandlung von Sicherheitsvorfällen', 'DER.2.1.A11 Einstufung von Sicherheitsvorfällen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_2_1_Behandlung_von_Sicherheitsvorfällen.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.2.1.A12', 'DER - Detektion und Reaktion', 'DER.2.1 Behandlung von Sicherheitsvorfällen', 'DER.2.1.A12 Festlegung der Schnittstellen der Sicherheitsvorfallbehandlung zur Störungs- und Fehlerbehebung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_2_1_Behandlung_von_Sicherheitsvorfällen.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.2.1.A13', 'DER - Detektion und Reaktion', 'DER.2.1 Behandlung von Sicherheitsvorfällen', 'DER.2.1.A13 Einbindung in das Sicherheits- und Notfallmanagement', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_2_1_Behandlung_von_Sicherheitsvorfällen.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.2.1.A14', 'DER - Detektion und Reaktion', 'DER.2.1 Behandlung von Sicherheitsvorfällen', 'DER.2.1.A14 Eskalationsstrategie für Sicherheitsvorfälle', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_2_1_Behandlung_von_Sicherheitsvorfällen.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.2.1.A15', 'DER - Detektion und Reaktion', 'DER.2.1 Behandlung von Sicherheitsvorfällen', 'DER.2.1.A15 Schulung der Mitarbeiter der zentralen Anlaufstelle des IT-Betriebs zur Behandlung von Sicherheitsvorfällen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_2_1_Behandlung_von_Sicherheitsvorfällen.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.2.1.A16', 'DER - Detektion und Reaktion', 'DER.2.1 Behandlung von Sicherheitsvorfällen', 'DER.2.1.A16 Dokumentation der Behandlung von Sicherheitsvorfällen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_2_1_Behandlung_von_Sicherheitsvorfällen.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.2.1.A17', 'DER - Detektion und Reaktion', 'DER.2.1 Behandlung von Sicherheitsvorfällen', 'DER.2.1.A17 Nachbereitung von Sicherheitsvorfällen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_2_1_Behandlung_von_Sicherheitsvorfällen.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.2.1.A18', 'DER - Detektion und Reaktion', 'DER.2.1 Behandlung von Sicherheitsvorfällen', 'DER.2.1.A18 Weiterentwicklung der Prozesse durch Erkenntnisse aus Sicherheitsvorfällen und Branchenentwicklungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_2_1_Behandlung_von_Sicherheitsvorfällen.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.2.1.A19', 'DER - Detektion und Reaktion', 'DER.2.1 Behandlung von Sicherheitsvorfällen', 'DER.2.1.A19 Festlegung von Prioritäten für die Behandlung von Sicherheitsvorfällen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_2_1_Behandlung_von_Sicherheitsvorfällen.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.2.1.A2', 'DER - Detektion und Reaktion', 'DER.2.1 Behandlung von Sicherheitsvorfällen', 'DER.2.1.A2 Erstellung einer Richtlinie zur Behandlung von Sicherheitsvorfällen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_2_1_Behandlung_von_Sicherheitsvorfällen.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.2.1.A20', 'DER - Detektion und Reaktion', 'DER.2.1 Behandlung von Sicherheitsvorfällen', 'DER.2.1.A20 Einrichtung einer internen Meldestelle für Sicherheitsvorfälle', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_2_1_Behandlung_von_Sicherheitsvorfällen.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.2.1.A21', 'DER - Detektion und Reaktion', 'DER.2.1 Behandlung von Sicherheitsvorfällen', 'DER.2.1.A21 Einrichtung eines Expertenteams für die Behandlung von Sicherheitsvorfällen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_2_1_Behandlung_von_Sicherheitsvorfällen.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.2.1.A22', 'DER - Detektion und Reaktion', 'DER.2.1 Behandlung von Sicherheitsvorfällen', 'DER.2.1.A22 Überprüfung des Managementsystems zur Behandlung von Sicherheitsvorfällen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_2_1_Behandlung_von_Sicherheitsvorfällen.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.2.1.A3', 'DER - Detektion und Reaktion', 'DER.2.1 Behandlung von Sicherheitsvorfällen', 'DER.2.1.A3 Festlegung von Verantwortlichkeiten und Ansprechpartnern bei Sicherheitsvorfällen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_2_1_Behandlung_von_Sicherheitsvorfällen.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.2.1.A4', 'DER - Detektion und Reaktion', 'DER.2.1 Behandlung von Sicherheitsvorfällen', 'DER.2.1.A4 Benachrichtigung betroffener Stellen bei Sicherheitsvorfällen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_2_1_Behandlung_von_Sicherheitsvorfällen.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.2.1.A5', 'DER - Detektion und Reaktion', 'DER.2.1 Behandlung von Sicherheitsvorfällen', 'DER.2.1.A5 Behebung von Sicherheitsvorfällen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_2_1_Behandlung_von_Sicherheitsvorfällen.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.2.1.A6', 'DER - Detektion und Reaktion', 'DER.2.1 Behandlung von Sicherheitsvorfällen', 'DER.2.1.A6 Wiederherstellung der Betriebsumgebung nach Sicherheitsvorfällen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_2_1_Behandlung_von_Sicherheitsvorfällen.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.2.1.A7', 'DER - Detektion und Reaktion', 'DER.2.1 Behandlung von Sicherheitsvorfällen', 'DER.2.1.A7 Etablierung einer Vorgehensweise zur Behandlung von Sicherheitsvorfällen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_2_1_Behandlung_von_Sicherheitsvorfällen.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.2.1.A8', 'DER - Detektion und Reaktion', 'DER.2.1 Behandlung von Sicherheitsvorfällen', 'DER.2.1.A8 Aufbau von Organisationsstrukturen zur Behandlung von Sicherheitsvorfällen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_2_1_Behandlung_von_Sicherheitsvorfällen.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.2.1.A9', 'DER - Detektion und Reaktion', 'DER.2.1 Behandlung von Sicherheitsvorfällen', 'DER.2.1.A9 Festlegung von Meldewegen für Sicherheitsvorfälle', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_2_1_Behandlung_von_Sicherheitsvorfällen.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.2.2.A1', 'DER - Detektion und Reaktion', 'DER.2.2 Vorsorge für die IT-Forensik', 'DER.2.2.A1 Prüfung rechtlicher und regulatorischer Rahmenbedingungen zur Erfassung und Auswertbarkeit', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_2_2_Vorsorge_für_die_IT-Forensik.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.2.2.A10', 'DER - Detektion und Reaktion', 'DER.2.2 Vorsorge für die IT-Forensik', 'DER.2.2.A10 IT-forensische Sicherung von Beweismitteln', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_2_2_Vorsorge_für_die_IT-Forensik.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.2.2.A11', 'DER - Detektion und Reaktion', 'DER.2.2 Vorsorge für die IT-Forensik', 'DER.2.2.A11 Dokumentation der Beweissicherung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_2_2_Vorsorge_für_die_IT-Forensik.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.2.2.A12', 'DER - Detektion und Reaktion', 'DER.2.2 Vorsorge für die IT-Forensik', 'DER.2.2.A12 Sichere Verwahrung von Originaldatenträgern und Beweismitteln', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_2_2_Vorsorge_für_die_IT-Forensik.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.2.2.A13', 'DER - Detektion und Reaktion', 'DER.2.2 Vorsorge für die IT-Forensik', 'DER.2.2.A13 Rahmenverträge mit externen Dienstleistern', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_2_2_Vorsorge_für_die_IT-Forensik.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.2.2.A14', 'DER - Detektion und Reaktion', 'DER.2.2 Vorsorge für die IT-Forensik', 'DER.2.2.A14 Festlegung von Standardverfahren für die Beweissicherung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_2_2_Vorsorge_für_die_IT-Forensik.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.2.2.A15', 'DER - Detektion und Reaktion', 'DER.2.2 Vorsorge für die IT-Forensik', 'DER.2.2.A15 Durchführung von Übungen zur Beweissicherung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_2_2_Vorsorge_für_die_IT-Forensik.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.2.2.A2', 'DER - Detektion und Reaktion', 'DER.2.2 Vorsorge für die IT-Forensik', 'DER.2.2.A2 Erstellung eines Leitfadens für Erstmaßnahmen bei einem IT-Sicherheitsvorfall', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_2_2_Vorsorge_für_die_IT-Forensik.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.2.2.A3', 'DER - Detektion und Reaktion', 'DER.2.2 Vorsorge für die IT-Forensik', 'DER.2.2.A3 Vorauswahl von Forensik-Dienstleistern', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_2_2_Vorsorge_für_die_IT-Forensik.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.2.2.A4', 'DER - Detektion und Reaktion', 'DER.2.2 Vorsorge für die IT-Forensik', 'DER.2.2.A4 Festlegung von Schnittstellen zum Krisen- und Notfallmanagement', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_2_2_Vorsorge_für_die_IT-Forensik.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.2.2.A5', 'DER - Detektion und Reaktion', 'DER.2.2 Vorsorge für die IT-Forensik', 'DER.2.2.A5 Erstellung eines Leitfadens für Beweissicherungsmaßnahmen bei IT-Sicherheitsvorfällen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_2_2_Vorsorge_für_die_IT-Forensik.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.2.2.A6', 'DER - Detektion und Reaktion', 'DER.2.2 Vorsorge für die IT-Forensik', 'DER.2.2.A6 Schulung des Personals für die Umsetzung der forensischen Sicherung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_2_2_Vorsorge_für_die_IT-Forensik.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.2.2.A7', 'DER - Detektion und Reaktion', 'DER.2.2 Vorsorge für die IT-Forensik', 'DER.2.2.A7 Auswahl von Werkzeugen zur Forensik', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_2_2_Vorsorge_für_die_IT-Forensik.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.2.2.A8', 'DER - Detektion und Reaktion', 'DER.2.2 Vorsorge für die IT-Forensik', 'DER.2.2.A8 Auswahl und Reihenfolge der zu sichernden Beweismittel', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_2_2_Vorsorge_für_die_IT-Forensik.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.2.2.A9', 'DER - Detektion und Reaktion', 'DER.2.2 Vorsorge für die IT-Forensik', 'DER.2.2.A9 Vorauswahl forensisch relevanter Daten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_2_2_Vorsorge_für_die_IT-Forensik.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.2.3.A1', 'DER - Detektion und Reaktion', 'DER.2.3 Bereinigung weitreichender Sicherheitsvorfälle', 'DER.2.3.A1 Einrichtung eines Leitungsgremiums', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_2_3_Bereinigung_weitreichender_Sicherheitsvorfälle.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.2.3.A10', 'DER - Detektion und Reaktion', 'DER.2.3 Bereinigung weitreichender Sicherheitsvorfälle', 'DER.2.3.A10 Umbauten zur Erschwerung eines erneuten Angriffs durch denselben Angreifer', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_2_3_Bereinigung_weitreichender_Sicherheitsvorfälle.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.2.3.A2', 'DER - Detektion und Reaktion', 'DER.2.3 Bereinigung weitreichender Sicherheitsvorfälle', 'DER.2.3.A2 Entscheidung für eine Bereinigungsstrategie', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_2_3_Bereinigung_weitreichender_Sicherheitsvorfälle.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.2.3.A3', 'DER - Detektion und Reaktion', 'DER.2.3 Bereinigung weitreichender Sicherheitsvorfälle', 'DER.2.3.A3 Isolierung der betroffenen Netzabschnitte', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_2_3_Bereinigung_weitreichender_Sicherheitsvorfälle.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.2.3.A4', 'DER - Detektion und Reaktion', 'DER.2.3 Bereinigung weitreichender Sicherheitsvorfälle', 'DER.2.3.A4 Sperrung und Änderung von Zugangsdaten und kryptografischen Schlüsseln', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_2_3_Bereinigung_weitreichender_Sicherheitsvorfälle.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.2.3.A5', 'DER - Detektion und Reaktion', 'DER.2.3 Bereinigung weitreichender Sicherheitsvorfälle', 'DER.2.3.A5 Schließen des initialen Einbruchswegs', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_2_3_Bereinigung_weitreichender_Sicherheitsvorfälle.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.2.3.A6', 'DER - Detektion und Reaktion', 'DER.2.3 Bereinigung weitreichender Sicherheitsvorfälle', 'DER.2.3.A6 Rückführung in den Produktivbetrieb', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_2_3_Bereinigung_weitreichender_Sicherheitsvorfälle.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.2.3.A7', 'DER - Detektion und Reaktion', 'DER.2.3 Bereinigung weitreichender Sicherheitsvorfälle', 'DER.2.3.A7 Gezielte Systemhärtung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_2_3_Bereinigung_weitreichender_Sicherheitsvorfälle.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.2.3.A8', 'DER - Detektion und Reaktion', 'DER.2.3 Bereinigung weitreichender Sicherheitsvorfälle', 'DER.2.3.A8 Etablierung sicherer, unabhängiger Kommunikationskanäle', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_2_3_Bereinigung_weitreichender_Sicherheitsvorfälle.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.2.3.A9', 'DER - Detektion und Reaktion', 'DER.2.3 Bereinigung weitreichender Sicherheitsvorfälle', 'DER.2.3.A9 Hardwaretausch betroffener IT-Systeme', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_2_3_Bereinigung_weitreichender_Sicherheitsvorfälle.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.3.1.A1', 'DER - Detektion und Reaktion', 'DER.3.1 Audits und Revisionen', 'DER.3.1.A1 Definition von Verantwortlichkeiten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_3_1_Audits_und_Revisionen.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.3.1.A10', 'DER - Detektion und Reaktion', 'DER.3.1 Audits und Revisionen', 'DER.3.1.A10 Erstellung eines Audit- oder Revisionsplans', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_3_1_Audits_und_Revisionen.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.3.1.A11', 'DER - Detektion und Reaktion', 'DER.3.1 Audits und Revisionen', 'DER.3.1.A11 Kommunikation und Verhalten während der Prüfungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_3_1_Audits_und_Revisionen.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.3.1.A12', 'DER - Detektion und Reaktion', 'DER.3.1 Audits und Revisionen', 'DER.3.1.A12 Durchführung eines Auftaktgesprächs', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_3_1_Audits_und_Revisionen.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.3.1.A13', 'DER - Detektion und Reaktion', 'DER.3.1 Audits und Revisionen', 'DER.3.1.A13 Sichtung und Prüfung der Dokumente', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_3_1_Audits_und_Revisionen.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.3.1.A14', 'DER - Detektion und Reaktion', 'DER.3.1 Audits und Revisionen', 'DER.3.1.A14 Auswahl von Stichproben', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_3_1_Audits_und_Revisionen.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.3.1.A15', 'DER - Detektion und Reaktion', 'DER.3.1 Audits und Revisionen', 'DER.3.1.A15 Auswahl von geeigneten Prüfmethoden', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_3_1_Audits_und_Revisionen.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.3.1.A16', 'DER - Detektion und Reaktion', 'DER.3.1 Audits und Revisionen', 'DER.3.1.A16 Ablaufplan der Vor-Ort-Prüfung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_3_1_Audits_und_Revisionen.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.3.1.A17', 'DER - Detektion und Reaktion', 'DER.3.1 Audits und Revisionen', 'DER.3.1.A17 Durchführung der Vor-Ort-Prüfung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_3_1_Audits_und_Revisionen.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.3.1.A18', 'DER - Detektion und Reaktion', 'DER.3.1 Audits und Revisionen', 'DER.3.1.A18 Durchführung von Interviews', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_3_1_Audits_und_Revisionen.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.3.1.A19', 'DER - Detektion und Reaktion', 'DER.3.1 Audits und Revisionen', 'DER.3.1.A19 Überprüfung des Risikobehandlungsplans', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_3_1_Audits_und_Revisionen.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.3.1.A2', 'DER - Detektion und Reaktion', 'DER.3.1 Audits und Revisionen', 'DER.3.1.A2 Vorbereitung eines Audits oder einer Revision', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_3_1_Audits_und_Revisionen.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.3.1.A20', 'DER - Detektion und Reaktion', 'DER.3.1 Audits und Revisionen', 'DER.3.1.A20 Durchführung einer Abschlussbesprechung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_3_1_Audits_und_Revisionen.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.3.1.A21', 'DER - Detektion und Reaktion', 'DER.3.1 Audits und Revisionen', 'DER.3.1.A21 Auswertung der Prüfungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_3_1_Audits_und_Revisionen.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.3.1.A22', 'DER - Detektion und Reaktion', 'DER.3.1 Audits und Revisionen', 'DER.3.1.A22 Erstellung eines Auditberichts', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_3_1_Audits_und_Revisionen.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.3.1.A23', 'DER - Detektion und Reaktion', 'DER.3.1 Audits und Revisionen', 'DER.3.1.A23 Dokumentation der Revisionsergebnisse', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_3_1_Audits_und_Revisionen.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.3.1.A24', 'DER - Detektion und Reaktion', 'DER.3.1 Audits und Revisionen', 'DER.3.1.A24 Abschluss des Audits oder der Revision', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_3_1_Audits_und_Revisionen.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.3.1.A25', 'DER - Detektion und Reaktion', 'DER.3.1 Audits und Revisionen', 'DER.3.1.A25 Nachbereitung eines Audits', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_3_1_Audits_und_Revisionen.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.3.1.A26', 'DER - Detektion und Reaktion', 'DER.3.1 Audits und Revisionen', 'DER.3.1.A26 Überwachen und Anpassen des Auditprogramms', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_3_1_Audits_und_Revisionen.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.3.1.A27', 'DER - Detektion und Reaktion', 'DER.3.1 Audits und Revisionen', 'DER.3.1.A27 Aufbewahrung und Archivierung von Unterlagen zu Audits und Revisionen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_3_1_Audits_und_Revisionen.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.3.1.A28', 'DER - Detektion und Reaktion', 'DER.3.1 Audits und Revisionen', 'DER.3.1.A28 Sicherheitsüberprüfung der Auditoren', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_3_1_Audits_und_Revisionen.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.3.1.A3', 'DER - Detektion und Reaktion', 'DER.3.1 Audits und Revisionen', 'DER.3.1.A3 Durchführung eines Audits', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_3_1_Audits_und_Revisionen.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.3.1.A4', 'DER - Detektion und Reaktion', 'DER.3.1 Audits und Revisionen', 'DER.3.1.A4 Durchführung einer Revision', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_3_1_Audits_und_Revisionen.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.3.1.A5', 'DER - Detektion und Reaktion', 'DER.3.1 Audits und Revisionen', 'DER.3.1.A5 Integration in den Informationssicherheitsprozess', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_3_1_Audits_und_Revisionen.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.3.1.A6', 'DER - Detektion und Reaktion', 'DER.3.1 Audits und Revisionen', 'DER.3.1.A6 Definition der Prüfungsgrundlage und eines einheitlichen Bewertungsschemas', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_3_1_Audits_und_Revisionen.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.3.1.A7', 'DER - Detektion und Reaktion', 'DER.3.1 Audits und Revisionen', 'DER.3.1.A7 Erstellung eines Auditprogramms', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_3_1_Audits_und_Revisionen.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.3.1.A8', 'DER - Detektion und Reaktion', 'DER.3.1 Audits und Revisionen', 'DER.3.1.A8 Erstellung einer Revisionsliste', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_3_1_Audits_und_Revisionen.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.3.1.A9', 'DER - Detektion und Reaktion', 'DER.3.1 Audits und Revisionen', 'DER.3.1.A9 Auswahl eines geeigneten Audit- oder Revionsteams', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_3_1_Audits_und_Revisionen.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.3.2.A1', 'DER - Detektion und Reaktion', 'DER.3.2 Revisionen auf Basis des Leitfadens IS-Revision', 'DER.3.2.A1 Benennung von Verantwortlichen für die IS-Revision', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_3_2_Revisionen_auf_Basis_des_Leitfadens_IS-Revision.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.3.2.A10', 'DER - Detektion und Reaktion', 'DER.3.2 Revisionen auf Basis des Leitfadens IS-Revision', 'DER.3.2.A10 Kommunikationsabsprache', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_3_2_Revisionen_auf_Basis_des_Leitfadens_IS-Revision.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.3.2.A11', 'DER - Detektion und Reaktion', 'DER.3.2 Revisionen auf Basis des Leitfadens IS-Revision', 'DER.3.2.A11 Durchführung eines Auftaktgesprächs für eine IS-Querschnittsrevision', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_3_2_Revisionen_auf_Basis_des_Leitfadens_IS-Revision.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.3.2.A12', 'DER - Detektion und Reaktion', 'DER.3.2 Revisionen auf Basis des Leitfadens IS-Revision', 'DER.3.2.A12 Erstellung eines Prüfplans', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_3_2_Revisionen_auf_Basis_des_Leitfadens_IS-Revision.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.3.2.A13', 'DER - Detektion und Reaktion', 'DER.3.2 Revisionen auf Basis des Leitfadens IS-Revision', 'DER.3.2.A13 Sichtung und Prüfung der Dokumente', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_3_2_Revisionen_auf_Basis_des_Leitfadens_IS-Revision.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.3.2.A14', 'DER - Detektion und Reaktion', 'DER.3.2 Revisionen auf Basis des Leitfadens IS-Revision', 'DER.3.2.A14 Auswahl der Zielobjekte und der zu prüfenden Anforderungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_3_2_Revisionen_auf_Basis_des_Leitfadens_IS-Revision.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.3.2.A15', 'DER - Detektion und Reaktion', 'DER.3.2 Revisionen auf Basis des Leitfadens IS-Revision', 'DER.3.2.A15 Auswahl von geeigneten Prüfmethoden', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_3_2_Revisionen_auf_Basis_des_Leitfadens_IS-Revision.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.3.2.A16', 'DER - Detektion und Reaktion', 'DER.3.2 Revisionen auf Basis des Leitfadens IS-Revision', 'DER.3.2.A16 Erstellung eines Ablaufplans für die Vor-Ort-Prüfung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_3_2_Revisionen_auf_Basis_des_Leitfadens_IS-Revision.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.3.2.A17', 'DER - Detektion und Reaktion', 'DER.3.2 Revisionen auf Basis des Leitfadens IS-Revision', 'DER.3.2.A17 Durchführung der Vor-Ort-Prüfung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_3_2_Revisionen_auf_Basis_des_Leitfadens_IS-Revision.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.3.2.A18', 'DER - Detektion und Reaktion', 'DER.3.2 Revisionen auf Basis des Leitfadens IS-Revision', 'DER.3.2.A18 Durchführung von Interviews', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_3_2_Revisionen_auf_Basis_des_Leitfadens_IS-Revision.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.3.2.A19', 'DER - Detektion und Reaktion', 'DER.3.2 Revisionen auf Basis des Leitfadens IS-Revision', 'DER.3.2.A19 Überprüfung der gewählten Risikobehandlungsoptionen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_3_2_Revisionen_auf_Basis_des_Leitfadens_IS-Revision.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.3.2.A2', 'DER - Detektion und Reaktion', 'DER.3.2 Revisionen auf Basis des Leitfadens IS-Revision', 'DER.3.2.A2 Erstellung eines IS-Revisionshandbuches', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_3_2_Revisionen_auf_Basis_des_Leitfadens_IS-Revision.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.3.2.A20', 'DER - Detektion und Reaktion', 'DER.3.2 Revisionen auf Basis des Leitfadens IS-Revision', 'DER.3.2.A20 Nachbereitung der Vor-Ort-Prüfung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_3_2_Revisionen_auf_Basis_des_Leitfadens_IS-Revision.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.3.2.A21', 'DER - Detektion und Reaktion', 'DER.3.2 Revisionen auf Basis des Leitfadens IS-Revision', 'DER.3.2.A21 Erstellung eines IS-Revisionsberichts', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_3_2_Revisionen_auf_Basis_des_Leitfadens_IS-Revision.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.3.2.A22', 'DER - Detektion und Reaktion', 'DER.3.2 Revisionen auf Basis des Leitfadens IS-Revision', 'DER.3.2.A22 Nachbereitung einer IS-Revision', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_3_2_Revisionen_auf_Basis_des_Leitfadens_IS-Revision.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.3.2.A23', 'DER - Detektion und Reaktion', 'DER.3.2 Revisionen auf Basis des Leitfadens IS-Revision', 'DER.3.2.A23 Sicherheitsüberprüfung der IS-Revisoren', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_3_2_Revisionen_auf_Basis_des_Leitfadens_IS-Revision.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.3.2.A3', 'DER - Detektion und Reaktion', 'DER.3.2 Revisionen auf Basis des Leitfadens IS-Revision', 'DER.3.2.A3 Definition der Prüfungsgrundlage', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_3_2_Revisionen_auf_Basis_des_Leitfadens_IS-Revision.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.3.2.A4', 'DER - Detektion und Reaktion', 'DER.3.2 Revisionen auf Basis des Leitfadens IS-Revision', 'DER.3.2.A4 Erstellung einer Planung für die IS-Revision', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_3_2_Revisionen_auf_Basis_des_Leitfadens_IS-Revision.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.3.2.A5', 'DER - Detektion und Reaktion', 'DER.3.2 Revisionen auf Basis des Leitfadens IS-Revision', 'DER.3.2.A5 Auswahl eines geeigneten IS-Revisionsteams', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_3_2_Revisionen_auf_Basis_des_Leitfadens_IS-Revision.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.3.2.A6', 'DER - Detektion und Reaktion', 'DER.3.2 Revisionen auf Basis des Leitfadens IS-Revision', 'DER.3.2.A6 Vorbereitung einer IS-Revision', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_3_2_Revisionen_auf_Basis_des_Leitfadens_IS-Revision.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.3.2.A7', 'DER - Detektion und Reaktion', 'DER.3.2 Revisionen auf Basis des Leitfadens IS-Revision', 'DER.3.2.A7 Durchführung einer IS-Revision', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_3_2_Revisionen_auf_Basis_des_Leitfadens_IS-Revision.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.3.2.A8', 'DER - Detektion und Reaktion', 'DER.3.2 Revisionen auf Basis des Leitfadens IS-Revision', 'DER.3.2.A8 Aufbewahrung von IS-Revisionsberichten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_3_2_Revisionen_auf_Basis_des_Leitfadens_IS-Revision.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.3.2.A9', 'DER - Detektion und Reaktion', 'DER.3.2 Revisionen auf Basis des Leitfadens IS-Revision', 'DER.3.2.A9 Integration in den Informationssicherheitsprozess', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_3_2_Revisionen_auf_Basis_des_Leitfadens_IS-Revision.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.4.A1', 'DER - Detektion und Reaktion', 'DER.4 Notfallmanagement', 'DER.4.A1 Erstellung eines Notfallhandbuchs', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_4_Notfallmanagement.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.4.A10', 'DER - Detektion und Reaktion', 'DER.4 Notfallmanagement', 'DER.4.A10 Tests und Notfallübungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_4_Notfallmanagement.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.4.A11', 'DER - Detektion und Reaktion', 'DER.4 Notfallmanagement', 'DER.4.A11 ENTFALLEN', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_4_Notfallmanagement.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.4.A12', 'DER - Detektion und Reaktion', 'DER.4 Notfallmanagement', 'DER.4.A12 Dokumentation im Notfallmanagement-Prozess', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_4_Notfallmanagement.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.4.A13', 'DER - Detektion und Reaktion', 'DER.4 Notfallmanagement', 'DER.4.A13 Überprüfung und Steuerung des Notfallmanagement-Systems', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_4_Notfallmanagement.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.4.A14', 'DER - Detektion und Reaktion', 'DER.4 Notfallmanagement', 'DER.4.A14 Regelmäßige Überprüfung und Verbesserung der Notfallmaßnahmen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_4_Notfallmanagement.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.4.A15', 'DER - Detektion und Reaktion', 'DER.4 Notfallmanagement', 'DER.4.A15 Bewertung der Leistungsfähigkeit des Notfallmanagementsystems', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_4_Notfallmanagement.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.4.A16', 'DER - Detektion und Reaktion', 'DER.4 Notfallmanagement', 'DER.4.A16 Notfallvorsorge- und Notfallreaktionsplanung für ausgelagerte Komponenten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_4_Notfallmanagement.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.4.A2', 'DER - Detektion und Reaktion', 'DER.4 Notfallmanagement', 'DER.4.A2 Integration von Notfallmanagement und Informationssicherheitsmanagement', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_4_Notfallmanagement.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.4.A3', 'DER - Detektion und Reaktion', 'DER.4 Notfallmanagement', 'DER.4.A3 Festlegung des Geltungsbereichs und der Notfallmanagementstrategie', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_4_Notfallmanagement.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.4.A4', 'DER - Detektion und Reaktion', 'DER.4 Notfallmanagement', 'DER.4.A4 Leitlinie zum Notfallmanagement und Übernahme der Gesamtverantwortung durch die Institutionsleitung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_4_Notfallmanagement.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.4.A5', 'DER - Detektion und Reaktion', 'DER.4 Notfallmanagement', 'DER.4.A5 Aufbau einer geeigneten Organisationsstruktur für das Notfallmanagement', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_4_Notfallmanagement.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.4.A6', 'DER - Detektion und Reaktion', 'DER.4 Notfallmanagement', 'DER.4.A6 Bereitstellung angemessener Ressourcen für das Notfallmanagement', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_4_Notfallmanagement.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.4.A7', 'DER - Detektion und Reaktion', 'DER.4 Notfallmanagement', 'DER.4.A7 Erstellung eines Notfallkonzepts', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_4_Notfallmanagement.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.4.A8', 'DER - Detektion und Reaktion', 'DER.4 Notfallmanagement', 'DER.4.A8 Integration der Mitarbeiter in den Notfallmanagement-Prozess', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_4_Notfallmanagement.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('DER.4.A9', 'DER - Detektion und Reaktion', 'DER.4 Notfallmanagement', 'DER.4.A9 Integration von Notfallmanagement in organisationsweite Abläufe und Prozesse', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/DER/DER_4_Notfallmanagement.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('IND.1.A1', 'IND - Industrielle IT', 'IND.1 Betriebs- und Steuerungstechnik', 'IND.1.A1 Einbindung in die Sicherheitsorganisation', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/IND/IND_1_Betriebs-_und_Steuerungstechnik.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('IND.1.A10', 'IND - Industrielle IT', 'IND.1 Betriebs- und Steuerungstechnik', 'IND.1.A10 Monitoring, Protokollierung und Detektion', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/IND/IND_1_Betriebs-_und_Steuerungstechnik.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('IND.1.A11', 'IND - Industrielle IT', 'IND.1 Betriebs- und Steuerungstechnik', 'IND.1.A11 Sichere Beschaffung und Systementwicklung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/IND/IND_1_Betriebs-_und_Steuerungstechnik.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('IND.1.A12', 'IND - Industrielle IT', 'IND.1 Betriebs- und Steuerungstechnik', 'IND.1.A12 Etablieren eines Schwachstellen-Managements', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/IND/IND_1_Betriebs-_und_Steuerungstechnik.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('IND.1.A13', 'IND - Industrielle IT', 'IND.1 Betriebs- und Steuerungstechnik', 'IND.1.A13 Notfallplanung für OT', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/IND/IND_1_Betriebs-_und_Steuerungstechnik.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('IND.1.A14', 'IND - Industrielle IT', 'IND.1 Betriebs- und Steuerungstechnik', 'IND.1.A14 Starke Authentisierung an OT-Komponenten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/IND/IND_1_Betriebs-_und_Steuerungstechnik.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('IND.1.A15', 'IND - Industrielle IT', 'IND.1 Betriebs- und Steuerungstechnik', 'IND.1.A15 Prüfung und Überwachung von Berechtigungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/IND/IND_1_Betriebs-_und_Steuerungstechnik.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('IND.1.A16', 'IND - Industrielle IT', 'IND.1 Betriebs- und Steuerungstechnik', 'IND.1.A16 Stärkere Abschottung der Zonen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/IND/IND_1_Betriebs-_und_Steuerungstechnik.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('IND.1.A17', 'IND - Industrielle IT', 'IND.1 Betriebs- und Steuerungstechnik', 'IND.1.A17 Regelmäßige Sicherheitsüberprüfung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/IND/IND_1_Betriebs-_und_Steuerungstechnik.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('IND.1.A2', 'IND - Industrielle IT', 'IND.1 Betriebs- und Steuerungstechnik', 'IND.1.A2 Sensibilisierung und Schulung des Personals', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/IND/IND_1_Betriebs-_und_Steuerungstechnik.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('IND.1.A3', 'IND - Industrielle IT', 'IND.1 Betriebs- und Steuerungstechnik', 'IND.1.A3 Schutz vor Schadprogrammen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/IND/IND_1_Betriebs-_und_Steuerungstechnik.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('IND.1.A4', 'IND - Industrielle IT', 'IND.1 Betriebs- und Steuerungstechnik', 'IND.1.A4 Dokumentation der OT-Infrastruktur', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/IND/IND_1_Betriebs-_und_Steuerungstechnik.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('IND.1.A5', 'IND - Industrielle IT', 'IND.1 Betriebs- und Steuerungstechnik', 'IND.1.A5 Entwicklung eines geeigneten Zonenkonzepts', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/IND/IND_1_Betriebs-_und_Steuerungstechnik.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('IND.1.A6', 'IND - Industrielle IT', 'IND.1 Betriebs- und Steuerungstechnik', 'IND.1.A6 Änderungsmanagement im OT-Betrieb', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/IND/IND_1_Betriebs-_und_Steuerungstechnik.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('IND.1.A7', 'IND - Industrielle IT', 'IND.1 Betriebs- und Steuerungstechnik', 'IND.1.A7 Etablieren einer Berechtigungsverwaltung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/IND/IND_1_Betriebs-_und_Steuerungstechnik.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('IND.1.A8', 'IND - Industrielle IT', 'IND.1 Betriebs- und Steuerungstechnik', 'IND.1.A8 Sichere Administration', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/IND/IND_1_Betriebs-_und_Steuerungstechnik.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('IND.1.A9', 'IND - Industrielle IT', 'IND.1 Betriebs- und Steuerungstechnik', 'IND.1.A9 Restriktiver Einsatz von Wechseldatenträgern und mobilen Endgeräten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/IND/IND_1_Betriebs-_und_Steuerungstechnik.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('IND.2.1.A1', 'IND - Industrielle IT', 'IND.2.1 Allgemeine ICS-Komponente', 'IND.2.1.A1 Einschränkung des Zugriffs für Konfigurations- und Wartungsschnittstellen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/IND/IND_2_1_Allgemeine_ICS-Komponente.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('IND.2.1.A10', 'IND - Industrielle IT', 'IND.2.1 Allgemeine ICS-Komponente', 'IND.2.1.A10 Systemdokumentation', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/IND/IND_2_1_Allgemeine_ICS-Komponente.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('IND.2.1.A11', 'IND - Industrielle IT', 'IND.2.1 Allgemeine ICS-Komponente', 'IND.2.1.A11 Wartung der ICS-Komponenten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/IND/IND_2_1_Allgemeine_ICS-Komponente.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('IND.2.1.A12', 'IND - Industrielle IT', 'IND.2.1 Allgemeine ICS-Komponente', 'IND.2.1.A12 Beschaffung von ICS-Komponenten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/IND/IND_2_1_Allgemeine_ICS-Komponente.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('IND.2.1.A13', 'IND - Industrielle IT', 'IND.2.1 Allgemeine ICS-Komponente', 'IND.2.1.A13 Geeignete Inbetriebnahme der ICS-Komponenten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/IND/IND_2_1_Allgemeine_ICS-Komponente.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('IND.2.1.A14', 'IND - Industrielle IT', 'IND.2.1 Allgemeine ICS-Komponente', 'IND.2.1.A14 Aussonderung von ICS-Komponenten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/IND/IND_2_1_Allgemeine_ICS-Komponente.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('IND.2.1.A15', 'IND - Industrielle IT', 'IND.2.1 Allgemeine ICS-Komponente', 'IND.2.1.A15 Zentrale Systemprotokollierung und -überwachung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/IND/IND_2_1_Allgemeine_ICS-Komponente.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('IND.2.1.A16', 'IND - Industrielle IT', 'IND.2.1 Allgemeine ICS-Komponente', 'IND.2.1.A16 Schutz externer Schnittstellen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/IND/IND_2_1_Allgemeine_ICS-Komponente.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('IND.2.1.A17', 'IND - Industrielle IT', 'IND.2.1 Allgemeine ICS-Komponente', 'IND.2.1.A17 Nutzung sicherer Protokolle für die Übertragung von Informationen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/IND/IND_2_1_Allgemeine_ICS-Komponente.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('IND.2.1.A18', 'IND - Industrielle IT', 'IND.2.1 Allgemeine ICS-Komponente', 'IND.2.1.A18 Kommunikation im Störfall', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/IND/IND_2_1_Allgemeine_ICS-Komponente.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('IND.2.1.A19', 'IND - Industrielle IT', 'IND.2.1 Allgemeine ICS-Komponente', 'IND.2.1.A19 Security-Tests', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/IND/IND_2_1_Allgemeine_ICS-Komponente.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('IND.2.1.A2', 'IND - Industrielle IT', 'IND.2.1 Allgemeine ICS-Komponente', 'IND.2.1.A2 Nutzung sicherer Protokolle für die Konfiguration und Wartung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/IND/IND_2_1_Allgemeine_ICS-Komponente.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('IND.2.1.A20', 'IND - Industrielle IT', 'IND.2.1 Allgemeine ICS-Komponente', 'IND.2.1.A20 Vertrauenswürdiger Code', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/IND/IND_2_1_Allgemeine_ICS-Komponente.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('IND.2.1.A3', 'IND - Industrielle IT', 'IND.2.1 Allgemeine ICS-Komponente', 'IND.2.1.A3 Protokollierung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/IND/IND_2_1_Allgemeine_ICS-Komponente.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('IND.2.1.A4', 'IND - Industrielle IT', 'IND.2.1 Allgemeine ICS-Komponente', 'IND.2.1.A4 Deaktivierung nicht genutzter Dienste, Funktionen und Schnittstellen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/IND/IND_2_1_Allgemeine_ICS-Komponente.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('IND.2.1.A5', 'IND - Industrielle IT', 'IND.2.1 Allgemeine ICS-Komponente', 'IND.2.1.A5 Deaktivierung nicht genutzter Benutzerkonten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/IND/IND_2_1_Allgemeine_ICS-Komponente.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('IND.2.1.A6', 'IND - Industrielle IT', 'IND.2.1 Allgemeine ICS-Komponente', 'IND.2.1.A6 Netzsegmentierung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/IND/IND_2_1_Allgemeine_ICS-Komponente.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('IND.2.1.A7', 'IND - Industrielle IT', 'IND.2.1 Allgemeine ICS-Komponente', 'IND.2.1.A7 Backups', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/IND/IND_2_1_Allgemeine_ICS-Komponente.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('IND.2.1.A8', 'IND - Industrielle IT', 'IND.2.1 Allgemeine ICS-Komponente', 'IND.2.1.A8 Schutz vor Schadsoftware', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/IND/IND_2_1_Allgemeine_ICS-Komponente.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('IND.2.1.A9', 'IND - Industrielle IT', 'IND.2.1 Allgemeine ICS-Komponente', 'IND.2.1.A9 Dokumentation der Kommunikationsbeziehungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/IND/IND_2_1_Allgemeine_ICS-Komponente.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('IND.2.2.A1', 'IND - Industrielle IT', 'IND.2.2 Speicherprogrammierbare Steuerung (SPS)', 'IND.2.2.A1 Erweiterte Systemdokumentation für Speicherprogrammierbare Steuerungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/IND/IND_2_2_Speicherprogrammierbare_Steuerung_(SPS).html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('IND.2.2.A2', 'IND - Industrielle IT', 'IND.2.2 Speicherprogrammierbare Steuerung (SPS)', 'IND.2.2.A2 Benutzerkontenkontrolle und restriktive Rechtevergabe', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/IND/IND_2_2_Speicherprogrammierbare_Steuerung_(SPS).html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('IND.2.2.A3', 'IND - Industrielle IT', 'IND.2.2 Speicherprogrammierbare Steuerung (SPS)', 'IND.2.2.A3 Zeitsynchronisation', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/IND/IND_2_2_Speicherprogrammierbare_Steuerung_(SPS).html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('IND.2.3.A1', 'IND - Industrielle IT', 'IND.2.3 Sensoren und Aktoren', 'IND.2.3.A1 Installation von Sensoren', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/IND/IND_2_3_Sensoren_und_Aktoren.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('IND.2.3.A2', 'IND - Industrielle IT', 'IND.2.3 Sensoren und Aktoren', 'IND.2.3.A2 Kalibrierung von Sensoren', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/IND/IND_2_3_Sensoren_und_Aktoren.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('IND.2.3.A3', 'IND - Industrielle IT', 'IND.2.3 Sensoren und Aktoren', 'IND.2.3.A3 Drahtlose Kommunikation', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/IND/IND_2_3_Sensoren_und_Aktoren.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('IND.2.4.A1', 'IND - Industrielle IT', 'IND.2.4 Maschine', 'IND.2.4.A1 Fernwartung durch Maschinen- und Anlagenbauer', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/IND/IND_2_4_Maschine.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('IND.2.4.A2', 'IND - Industrielle IT', 'IND.2.4 Maschine', 'IND.2.4.A2 Betrieb nach Ende der Gewährleistung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/IND/IND_2_4_Maschine.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('IND.2.7.A1', 'IND - Industrielle IT', 'IND.2.7 Safety Instrumented Systems', 'IND.2.7.A1 Erfassung und Dokumentation', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/IND/IND_2_7_Safety_Instrumented_Systems.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('IND.2.7.A10', 'IND - Industrielle IT', 'IND.2.7 Safety Instrumented Systems', 'IND.2.7.A10 Anzeige und Alarmierung von simulierten oder gebrückten Variablen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/IND/IND_2_7_Safety_Instrumented_Systems.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('IND.2.7.A11', 'IND - Industrielle IT', 'IND.2.7 Safety Instrumented Systems', 'IND.2.7.A11 Umgang mit integrierten Systemen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/IND/IND_2_7_Safety_Instrumented_Systems.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('IND.2.7.A12', 'IND - Industrielle IT', 'IND.2.7 Safety Instrumented Systems', 'IND.2.7.A12 Sicherstellen der Integrität und Authentizität von Anwendungsprogrammen und Konfigurationsdaten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/IND/IND_2_7_Safety_Instrumented_Systems.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('IND.2.7.A2', 'IND - Industrielle IT', 'IND.2.7 Safety Instrumented Systems', 'IND.2.7.A2 Zweckgebundene Nutzung der Hard- und Softwarekomponenten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/IND/IND_2_7_Safety_Instrumented_Systems.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('IND.2.7.A3', 'IND - Industrielle IT', 'IND.2.7 Safety Instrumented Systems', 'IND.2.7.A3 Änderung des Anwendungsprogramms auf dem Logiksystem', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/IND/IND_2_7_Safety_Instrumented_Systems.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('IND.2.7.A4', 'IND - Industrielle IT', 'IND.2.7 Safety Instrumented Systems', 'IND.2.7.A4 Verankerung von Informationssicherheit im Functional Safety Management', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/IND/IND_2_7_Safety_Instrumented_Systems.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('IND.2.7.A5', 'IND - Industrielle IT', 'IND.2.7 Safety Instrumented Systems', 'IND.2.7.A5 Notfallmanagement von SIS', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/IND/IND_2_7_Safety_Instrumented_Systems.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('IND.2.7.A6', 'IND - Industrielle IT', 'IND.2.7 Safety Instrumented Systems', 'IND.2.7.A6 Sichere Planung und Spezifikation des SIS', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/IND/IND_2_7_Safety_Instrumented_Systems.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('IND.2.7.A7', 'IND - Industrielle IT', 'IND.2.7 Safety Instrumented Systems', 'IND.2.7.A7 Trennung und Unabhängigkeit des SIS von der Umgebung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/IND/IND_2_7_Safety_Instrumented_Systems.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('IND.2.7.A8', 'IND - Industrielle IT', 'IND.2.7 Safety Instrumented Systems', 'IND.2.7.A8 Sichere Übertragung von Engineering Daten auf SIS', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/IND/IND_2_7_Safety_Instrumented_Systems.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('IND.2.7.A9', 'IND - Industrielle IT', 'IND.2.7 Safety Instrumented Systems', 'IND.2.7.A9 Absicherung der Daten- und Signalverbindungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/IND/IND_2_7_Safety_Instrumented_Systems.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.1.A1', 'INF - Infrastruktur', 'INF.1 Allgemeines Gebäude', 'INF.1.A1 Planung der Gebäudeabsicherung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_1_Allgemeines_Gebäude.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.1.A10', 'INF - Infrastruktur', 'INF.1 Allgemeines Gebäude', 'INF.1.A10 Einhaltung einschlägiger Normen und Vorschriften', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_1_Allgemeines_Gebäude.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.1.A11', 'INF - Infrastruktur', 'INF.1 Allgemeines Gebäude', 'INF.1.A11 Abgeschlossene Türen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_1_Allgemeines_Gebäude.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.1.A12', 'INF - Infrastruktur', 'INF.1 Allgemeines Gebäude', 'INF.1.A12 Schlüsselverwaltung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_1_Allgemeines_Gebäude.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.1.A13', 'INF - Infrastruktur', 'INF.1 Allgemeines Gebäude', 'INF.1.A13 Regelungen für Zutritt zu Verteilern', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_1_Allgemeines_Gebäude.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.1.A14', 'INF - Infrastruktur', 'INF.1 Allgemeines Gebäude', 'INF.1.A14 Blitzschutzeinrichtungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_1_Allgemeines_Gebäude.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.1.A15', 'INF - Infrastruktur', 'INF.1 Allgemeines Gebäude', 'INF.1.A15 Lagepläne der Versorgungsleitungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_1_Allgemeines_Gebäude.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.1.A16', 'INF - Infrastruktur', 'INF.1 Allgemeines Gebäude', 'INF.1.A16 Vermeidung von Lagehinweisen auf schützenswerte Gebäudeteile', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_1_Allgemeines_Gebäude.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.1.A17', 'INF - Infrastruktur', 'INF.1 Allgemeines Gebäude', 'INF.1.A17 Baulicher Rauchschutz', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_1_Allgemeines_Gebäude.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.1.A18', 'INF - Infrastruktur', 'INF.1 Allgemeines Gebäude', 'INF.1.A18 Brandschutzbegehungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_1_Allgemeines_Gebäude.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.1.A19', 'INF - Infrastruktur', 'INF.1 Allgemeines Gebäude', 'INF.1.A19 Frühzeitige Information des Brandschutzbeauftragten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_1_Allgemeines_Gebäude.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.1.A2', 'INF - Infrastruktur', 'INF.1 Allgemeines Gebäude', 'INF.1.A2 Angepasste Aufteilung der Stromkreise', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_1_Allgemeines_Gebäude.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.1.A20', 'INF - Infrastruktur', 'INF.1 Allgemeines Gebäude', 'INF.1.A20 Alarmierungsplan und Brandschutzübungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_1_Allgemeines_Gebäude.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.1.A21', 'INF - Infrastruktur', 'INF.1 Allgemeines Gebäude', 'INF.1.A21 Unabhängige elektrische Versorgungsstränge', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_1_Allgemeines_Gebäude.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.1.A22', 'INF - Infrastruktur', 'INF.1 Allgemeines Gebäude', 'INF.1.A22 Sichere Türen und Fenster', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_1_Allgemeines_Gebäude.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.1.A23', 'INF - Infrastruktur', 'INF.1 Allgemeines Gebäude', 'INF.1.A23 Bildung von Sicherheitszonen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_1_Allgemeines_Gebäude.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.1.A24', 'INF - Infrastruktur', 'INF.1 Allgemeines Gebäude', 'INF.1.A24 Selbsttätige Entwässerung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_1_Allgemeines_Gebäude.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.1.A25', 'INF - Infrastruktur', 'INF.1 Allgemeines Gebäude', 'INF.1.A25 Geeignete Standortauswahl', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_1_Allgemeines_Gebäude.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.1.A26', 'INF - Infrastruktur', 'INF.1 Allgemeines Gebäude', 'INF.1.A26 Pförtner- oder Sicherheitsdienst', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_1_Allgemeines_Gebäude.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.1.A27', 'INF - Infrastruktur', 'INF.1 Allgemeines Gebäude', 'INF.1.A27 Einbruchschutz', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_1_Allgemeines_Gebäude.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.1.A28', 'INF - Infrastruktur', 'INF.1 Allgemeines Gebäude', 'INF.1.A28 Klimatisierung durch raumlufttechnische Anlagen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_1_Allgemeines_Gebäude.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.1.A29', 'INF - Infrastruktur', 'INF.1 Allgemeines Gebäude', 'INF.1.A29 Organisatorische Vorgaben für die Gebäudereinigung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_1_Allgemeines_Gebäude.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.1.A3', 'INF - Infrastruktur', 'INF.1 Allgemeines Gebäude', 'INF.1.A3 Einhaltung von Brandschutzvorschriften', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_1_Allgemeines_Gebäude.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.1.A30', 'INF - Infrastruktur', 'INF.1 Allgemeines Gebäude', 'INF.1.A30 Auswahl eines geeigneten Gebäudes', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_1_Allgemeines_Gebäude.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.1.A31', 'INF - Infrastruktur', 'INF.1 Allgemeines Gebäude', 'INF.1.A31 Auszug aus Gebäuden', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_1_Allgemeines_Gebäude.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.1.A32', 'INF - Infrastruktur', 'INF.1 Allgemeines Gebäude', 'INF.1.A32 Brandschott-Kataster', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_1_Allgemeines_Gebäude.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.1.A33', 'INF - Infrastruktur', 'INF.1 Allgemeines Gebäude', 'INF.1.A33 Anordnung schützenswerter Gebäudeteile', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_1_Allgemeines_Gebäude.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.1.A34', 'INF - Infrastruktur', 'INF.1 Allgemeines Gebäude', 'INF.1.A34 Gefahrenmeldeanlage', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_1_Allgemeines_Gebäude.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.1.A4', 'INF - Infrastruktur', 'INF.1 Allgemeines Gebäude', 'INF.1.A4 Branderkennung in Gebäuden', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_1_Allgemeines_Gebäude.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.1.A5', 'INF - Infrastruktur', 'INF.1 Allgemeines Gebäude', 'INF.1.A5 Handfeuerlöscher', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_1_Allgemeines_Gebäude.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.1.A6', 'INF - Infrastruktur', 'INF.1 Allgemeines Gebäude', 'INF.1.A6 Geschlossene Fenster und Türen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_1_Allgemeines_Gebäude.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.1.A7', 'INF - Infrastruktur', 'INF.1 Allgemeines Gebäude', 'INF.1.A7 Zutrittsregelung und -kontrolle', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_1_Allgemeines_Gebäude.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.1.A8', 'INF - Infrastruktur', 'INF.1 Allgemeines Gebäude', 'INF.1.A8 Rauchverbot', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_1_Allgemeines_Gebäude.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.1.A9', 'INF - Infrastruktur', 'INF.1 Allgemeines Gebäude', 'INF.1.A9 Sicherheitskonzept für die Gebäudenutzung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_1_Allgemeines_Gebäude.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.10.A1', 'INF - Infrastruktur', 'INF.10 Besprechungs-, Veranstaltungs- und Schulungsräume', 'INF.10.A1 Sichere Nutzung von Besprechungs-, Veranstaltungs- und Schulungsräumen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_10_Besprechungs-,_Veranstaltungs-_und_Schulungsräume.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.10.A10', 'INF - Infrastruktur', 'INF.10 Besprechungs-, Veranstaltungs- und Schulungsräume', 'INF.10.A10 Mitführverbot von Mobiltelefonen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_10_Besprechungs-,_Veranstaltungs-_und_Schulungsräume.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.10.A2', 'INF - Infrastruktur', 'INF.10 Besprechungs-, Veranstaltungs- und Schulungsräume', 'INF.10.A2 Beaufsichtigung von Besuchern', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_10_Besprechungs-,_Veranstaltungs-_und_Schulungsräume.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.10.A3', 'INF - Infrastruktur', 'INF.10 Besprechungs-, Veranstaltungs- und Schulungsräume', 'INF.10.A3 Geschlossene Fenster und Türen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_10_Besprechungs-,_Veranstaltungs-_und_Schulungsräume.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.10.A4', 'INF - Infrastruktur', 'INF.10 Besprechungs-, Veranstaltungs- und Schulungsräume', 'INF.10.A4 Planung von Besprechungs-, Veranstaltungs- und Schulungsräumen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_10_Besprechungs-,_Veranstaltungs-_und_Schulungsräume.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.10.A5', 'INF - Infrastruktur', 'INF.10 Besprechungs-, Veranstaltungs- und Schulungsräume', 'INF.10.A5 Fliegende Verkabelung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_10_Besprechungs-,_Veranstaltungs-_und_Schulungsräume.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.10.A6', 'INF - Infrastruktur', 'INF.10 Besprechungs-, Veranstaltungs- und Schulungsräume', 'INF.10.A6 Einrichtung sicherer Netzzugänge', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_10_Besprechungs-,_Veranstaltungs-_und_Schulungsräume.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.10.A7', 'INF - Infrastruktur', 'INF.10 Besprechungs-, Veranstaltungs- und Schulungsräume', 'INF.10.A7 Sichere Konfiguration von Schulungs- und Präsentationsrechnern', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_10_Besprechungs-,_Veranstaltungs-_und_Schulungsräume.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.10.A8', 'INF - Infrastruktur', 'INF.10 Besprechungs-, Veranstaltungs- und Schulungsräume', 'INF.10.A8 Erstellung eines Nutzungsnachweises für Räume', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_10_Besprechungs-,_Veranstaltungs-_und_Schulungsräume.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.10.A9', 'INF - Infrastruktur', 'INF.10 Besprechungs-, Veranstaltungs- und Schulungsräume', 'INF.10.A9 Zurücksetzen von Schulungs- und Präsentationsrechnern', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_10_Besprechungs-,_Veranstaltungs-_und_Schulungsräume.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.2.A1', 'INF - Infrastruktur', 'INF.2 Rechenzentrum sowie Serverraum', 'INF.2.A1 Festlegung von Anforderungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_2_Rechenzentrum_sowie_Serverraum.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.2.A10', 'INF - Infrastruktur', 'INF.2 Rechenzentrum sowie Serverraum', 'INF.2.A10 Inspektion und Wartung der Infrastruktur', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_2_Rechenzentrum_sowie_Serverraum.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.2.A11', 'INF - Infrastruktur', 'INF.2 Rechenzentrum sowie Serverraum', 'INF.2.A11 Automatische Überwachung der Infrastruktur', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_2_Rechenzentrum_sowie_Serverraum.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.2.A12', 'INF - Infrastruktur', 'INF.2 Rechenzentrum sowie Serverraum', 'INF.2.A12 Perimeterschutz für das Rechenzentrum', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_2_Rechenzentrum_sowie_Serverraum.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.2.A13', 'INF - Infrastruktur', 'INF.2 Rechenzentrum sowie Serverraum', 'INF.2.A13 Planung und Installation von Gefahrenmeldeanlagen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_2_Rechenzentrum_sowie_Serverraum.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.2.A14', 'INF - Infrastruktur', 'INF.2 Rechenzentrum sowie Serverraum', 'INF.2.A14 Einsatz einer Netzersatzanlage', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_2_Rechenzentrum_sowie_Serverraum.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.2.A15', 'INF - Infrastruktur', 'INF.2 Rechenzentrum sowie Serverraum', 'INF.2.A15 Überspannungsschutzeinrichtung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_2_Rechenzentrum_sowie_Serverraum.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.2.A16', 'INF - Infrastruktur', 'INF.2 Rechenzentrum sowie Serverraum', 'INF.2.A16 Klimatisierung im Rechenzentrum', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_2_Rechenzentrum_sowie_Serverraum.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.2.A17', 'INF - Infrastruktur', 'INF.2 Rechenzentrum sowie Serverraum', 'INF.2.A17 Brandfrüherkennung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_2_Rechenzentrum_sowie_Serverraum.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.2.A18', 'INF - Infrastruktur', 'INF.2 Rechenzentrum sowie Serverraum', 'INF.2.A18 ENTFALLEN', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_2_Rechenzentrum_sowie_Serverraum.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.2.A19', 'INF - Infrastruktur', 'INF.2 Rechenzentrum sowie Serverraum', 'INF.2.A19 Durchführung von Funktionstests der technischen Infrastruktur', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_2_Rechenzentrum_sowie_Serverraum.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.2.A2', 'INF - Infrastruktur', 'INF.2 Rechenzentrum sowie Serverraum', 'INF.2.A2 Bildung von Brandabschnitten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_2_Rechenzentrum_sowie_Serverraum.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.2.A20', 'INF - Infrastruktur', 'INF.2 Rechenzentrum sowie Serverraum', 'INF.2.A20 Regelmäßige Aktualisierungen der Dokumentation', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_2_Rechenzentrum_sowie_Serverraum.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.2.A21', 'INF - Infrastruktur', 'INF.2 Rechenzentrum sowie Serverraum', 'INF.2.A21 Ausweichrechenzentrum', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_2_Rechenzentrum_sowie_Serverraum.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.2.A22', 'INF - Infrastruktur', 'INF.2 Rechenzentrum sowie Serverraum', 'INF.2.A22 Durchführung von Staubschutzmaßnahmen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_2_Rechenzentrum_sowie_Serverraum.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.2.A23', 'INF - Infrastruktur', 'INF.2 Rechenzentrum sowie Serverraum', 'INF.2.A23 Sicher strukturierte Verkabelung im Rechenzentrum', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_2_Rechenzentrum_sowie_Serverraum.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.2.A24', 'INF - Infrastruktur', 'INF.2 Rechenzentrum sowie Serverraum', 'INF.2.A24 Einsatz von Videoüberwachungsanlagen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_2_Rechenzentrum_sowie_Serverraum.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.2.A25', 'INF - Infrastruktur', 'INF.2 Rechenzentrum sowie Serverraum', 'INF.2.A25 Redundante Auslegung von unterbrechungsfreien Stromversorgungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_2_Rechenzentrum_sowie_Serverraum.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.2.A26', 'INF - Infrastruktur', 'INF.2 Rechenzentrum sowie Serverraum', 'INF.2.A26 Redundante Auslegung von Netzersatzanlagen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_2_Rechenzentrum_sowie_Serverraum.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.2.A27', 'INF - Infrastruktur', 'INF.2 Rechenzentrum sowie Serverraum', 'INF.2.A27 Durchführung von Alarmierungs- und Brandschutzübungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_2_Rechenzentrum_sowie_Serverraum.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.2.A28', 'INF - Infrastruktur', 'INF.2 Rechenzentrum sowie Serverraum', 'INF.2.A28 Einsatz von höherwertigen Gefahrenmeldeanlagen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_2_Rechenzentrum_sowie_Serverraum.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.2.A29', 'INF - Infrastruktur', 'INF.2 Rechenzentrum sowie Serverraum', 'INF.2.A29 Vermeidung und Überwachung nicht erforderlicher Leitungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_2_Rechenzentrum_sowie_Serverraum.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.2.A3', 'INF - Infrastruktur', 'INF.2 Rechenzentrum sowie Serverraum', 'INF.2.A3 Einsatz einer unterbrechungsfreien Stromversorgung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_2_Rechenzentrum_sowie_Serverraum.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.2.A30', 'INF - Infrastruktur', 'INF.2 Rechenzentrum sowie Serverraum', 'INF.2.A30 Anlagen zur Erkennung, Löschung oder Vermeidung von Bränden', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_2_Rechenzentrum_sowie_Serverraum.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.2.A4', 'INF - Infrastruktur', 'INF.2 Rechenzentrum sowie Serverraum', 'INF.2.A4 Notabschaltung der Stromversorgung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_2_Rechenzentrum_sowie_Serverraum.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.2.A5', 'INF - Infrastruktur', 'INF.2 Rechenzentrum sowie Serverraum', 'INF.2.A5 Einhaltung der Lufttemperatur und -feuchtigkeit', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_2_Rechenzentrum_sowie_Serverraum.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.2.A6', 'INF - Infrastruktur', 'INF.2 Rechenzentrum sowie Serverraum', 'INF.2.A6 Zutrittskontrolle', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_2_Rechenzentrum_sowie_Serverraum.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.2.A7', 'INF - Infrastruktur', 'INF.2 Rechenzentrum sowie Serverraum', 'INF.2.A7 Verschließen und Sichern', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_2_Rechenzentrum_sowie_Serverraum.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.2.A8', 'INF - Infrastruktur', 'INF.2 Rechenzentrum sowie Serverraum', 'INF.2.A8 Einsatz einer Brandmeldeanlage', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_2_Rechenzentrum_sowie_Serverraum.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.2.A9', 'INF - Infrastruktur', 'INF.2 Rechenzentrum sowie Serverraum', 'INF.2.A9 Einsatz einer Lösch- oder Brandvermeidungsanlage', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_2_Rechenzentrum_sowie_Serverraum.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.3.A1', 'INF - Infrastruktur', 'INF.3 Elektrotechnische Verkabelung', 'INF.3.A1 Auswahl geeigneter Kabeltypen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_3_Elektrotechnische_Verkabelung.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.3.A10', 'INF - Infrastruktur', 'INF.3 Elektrotechnische Verkabelung', 'INF.3.A10 Neutrale Dokumentation in den Verteilern', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_3_Elektrotechnische_Verkabelung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.3.A11', 'INF - Infrastruktur', 'INF.3 Elektrotechnische Verkabelung', 'INF.3.A11 Kontrolle elektrotechnischer Anlagen und Verbindungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_3_Elektrotechnische_Verkabelung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.3.A12', 'INF - Infrastruktur', 'INF.3 Elektrotechnische Verkabelung', 'INF.3.A12 Vermeidung elektrischer Zündquellen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_3_Elektrotechnische_Verkabelung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.3.A13', 'INF - Infrastruktur', 'INF.3 Elektrotechnische Verkabelung', 'INF.3.A13 Sekundär-Energieversorgung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_3_Elektrotechnische_Verkabelung.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.3.A14', 'INF - Infrastruktur', 'INF.3 Elektrotechnische Verkabelung', 'INF.3.A14 A-B-Versorgung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_3_Elektrotechnische_Verkabelung.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.3.A15', 'INF - Infrastruktur', 'INF.3 Elektrotechnische Verkabelung', 'INF.3.A15 Materielle Sicherung der elektrotechnischen Verkabelung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_3_Elektrotechnische_Verkabelung.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.3.A16', 'INF - Infrastruktur', 'INF.3 Elektrotechnische Verkabelung', 'INF.3.A16 Nutzung von Schranksystemen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_3_Elektrotechnische_Verkabelung.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.3.A17', 'INF - Infrastruktur', 'INF.3 Elektrotechnische Verkabelung', 'INF.3.A17 Brandschott-Kataster', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_3_Elektrotechnische_Verkabelung.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.3.A18', 'INF - Infrastruktur', 'INF.3 Elektrotechnische Verkabelung', 'INF.3.A18 EMV-taugliche Stromversorgung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_3_Elektrotechnische_Verkabelung.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.3.A2', 'INF - Infrastruktur', 'INF.3 Elektrotechnische Verkabelung', 'INF.3.A2 Planung der Kabelführung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_3_Elektrotechnische_Verkabelung.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.3.A3', 'INF - Infrastruktur', 'INF.3 Elektrotechnische Verkabelung', 'INF.3.A3 Fachgerechte Installation', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_3_Elektrotechnische_Verkabelung.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.3.A4', 'INF - Infrastruktur', 'INF.3 Elektrotechnische Verkabelung', 'INF.3.A4 Anforderungsanalyse für die elektrotechnische Verkabelung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_3_Elektrotechnische_Verkabelung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.3.A5', 'INF - Infrastruktur', 'INF.3 Elektrotechnische Verkabelung', 'INF.3.A5 Abnahme der elektrotechnischen Verkabelung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_3_Elektrotechnische_Verkabelung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.3.A6', 'INF - Infrastruktur', 'INF.3 Elektrotechnische Verkabelung', 'INF.3.A6 Überspannungsschutz', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_3_Elektrotechnische_Verkabelung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.3.A7', 'INF - Infrastruktur', 'INF.3 Elektrotechnische Verkabelung', 'INF.3.A7 Entfernen und Deaktivieren nicht mehr benötigter Leitungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_3_Elektrotechnische_Verkabelung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.3.A8', 'INF - Infrastruktur', 'INF.3 Elektrotechnische Verkabelung', 'INF.3.A8 Brandschutz in Trassen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_3_Elektrotechnische_Verkabelung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.3.A9', 'INF - Infrastruktur', 'INF.3 Elektrotechnische Verkabelung', 'INF.3.A9 Dokumentation und Kennzeichnung der elektrotechnischen Verkabelung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_3_Elektrotechnische_Verkabelung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.4.A1', 'INF - Infrastruktur', 'INF.4 IT-Verkabelung', 'INF.4.A1 Auswahl geeigneter Kabeltypen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_4_IT-Verkabelung.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.4.A10', 'INF - Infrastruktur', 'INF.4 IT-Verkabelung', 'INF.4.A10 Neutrale Dokumentation in den Verteilern', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_4_IT-Verkabelung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.4.A11', 'INF - Infrastruktur', 'INF.4 IT-Verkabelung', 'INF.4.A11 Kontrolle bestehender Verbindungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_4_IT-Verkabelung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.4.A12', 'INF - Infrastruktur', 'INF.4 IT-Verkabelung', 'INF.4.A12 Redundanzen für die Verkabelung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_4_IT-Verkabelung.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.4.A13', 'INF - Infrastruktur', 'INF.4 IT-Verkabelung', 'INF.4.A13 Materielle Sicherung der IT-Verkabelung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_4_IT-Verkabelung.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.4.A14', 'INF - Infrastruktur', 'INF.4 IT-Verkabelung', 'INF.4.A14 Vermeidung von Ausgleichsströmen auf Schirmungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_4_IT-Verkabelung.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.4.A15', 'INF - Infrastruktur', 'INF.4 IT-Verkabelung', 'INF.4.A15 Nutzung von Schranksystemen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_4_IT-Verkabelung.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.4.A2', 'INF - Infrastruktur', 'INF.4 IT-Verkabelung', 'INF.4.A2 Planung der Kabelführung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_4_IT-Verkabelung.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.4.A3', 'INF - Infrastruktur', 'INF.4 IT-Verkabelung', 'INF.4.A3 Fachgerechte Installation', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_4_IT-Verkabelung.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.4.A4', 'INF - Infrastruktur', 'INF.4 IT-Verkabelung', 'INF.4.A4 Anforderungsanalyse für die IT-Verkabelung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_4_IT-Verkabelung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.4.A5', 'INF - Infrastruktur', 'INF.4 IT-Verkabelung', 'INF.4.A5 Abnahme der IT-Verkabelung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_4_IT-Verkabelung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.4.A6', 'INF - Infrastruktur', 'INF.4 IT-Verkabelung', 'INF.4.A6 Laufende Fortschreibung und Revision der Netzdokumentation', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_4_IT-Verkabelung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.4.A7', 'INF - Infrastruktur', 'INF.4 IT-Verkabelung', 'INF.4.A7 Entfernen und Deaktivieren nicht mehr benötigter IT-Verkabelung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_4_IT-Verkabelung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.4.A8', 'INF - Infrastruktur', 'INF.4 IT-Verkabelung', 'INF.4.A8 Brandabschottung von Trassen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_4_IT-Verkabelung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.4.A9', 'INF - Infrastruktur', 'INF.4 IT-Verkabelung', 'INF.4.A9 Dokumentation und Kennzeichnung der IT-Verkabelung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_4_IT-Verkabelung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.5.A1', 'INF - Infrastruktur', 'INF.5 Raum sowie Schrank für technische Infrastruktur', 'INF.5.A1 Planung der Raumabsicherung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_5_Raum_sowie_Schrank_für_technische_Infrastruktur.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.5.A10', 'INF - Infrastruktur', 'INF.5 Raum sowie Schrank für technische Infrastruktur', 'INF.5.A10 Einhaltung der Lufttemperatur und -feuchtigkeit', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_5_Raum_sowie_Schrank_für_technische_Infrastruktur.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.5.A11', 'INF - Infrastruktur', 'INF.5 Raum sowie Schrank für technische Infrastruktur', 'INF.5.A11 Vermeidung von Leitungen mit gefährdenden Flüssigkeiten und Gasen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_5_Raum_sowie_Schrank_für_technische_Infrastruktur.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.5.A12', 'INF - Infrastruktur', 'INF.5 Raum sowie Schrank für technische Infrastruktur', 'INF.5.A12 Schutz vor versehentlicher Beschädigung von Zuleitungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_5_Raum_sowie_Schrank_für_technische_Infrastruktur.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.5.A13', 'INF - Infrastruktur', 'INF.5 Raum sowie Schrank für technische Infrastruktur', 'INF.5.A13 Schutz vor Schädigung durch Brand und Rauchgase', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_5_Raum_sowie_Schrank_für_technische_Infrastruktur.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.5.A14', 'INF - Infrastruktur', 'INF.5 Raum sowie Schrank für technische Infrastruktur', 'INF.5.A14 Minimierung von Brandgefahren aus Nachbarbereichen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_5_Raum_sowie_Schrank_für_technische_Infrastruktur.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.5.A15', 'INF - Infrastruktur', 'INF.5 Raum sowie Schrank für technische Infrastruktur', 'INF.5.A15 Blitz- und Überspannungsschutz', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_5_Raum_sowie_Schrank_für_technische_Infrastruktur.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.5.A16', 'INF - Infrastruktur', 'INF.5 Raum sowie Schrank für technische Infrastruktur', 'INF.5.A16 Einsatz einer unterbrechungsfreien Stromversorgung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_5_Raum_sowie_Schrank_für_technische_Infrastruktur.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.5.A17', 'INF - Infrastruktur', 'INF.5 Raum sowie Schrank für technische Infrastruktur', 'INF.5.A17 Inspektion und Wartung der Infrastruktur', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_5_Raum_sowie_Schrank_für_technische_Infrastruktur.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.5.A18', 'INF - Infrastruktur', 'INF.5 Raum sowie Schrank für technische Infrastruktur', 'INF.5.A18 Lage des Raumes für technische Infrastruktur', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_5_Raum_sowie_Schrank_für_technische_Infrastruktur.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.5.A19', 'INF - Infrastruktur', 'INF.5 Raum sowie Schrank für technische Infrastruktur', 'INF.5.A19 Redundanz des Raumes für technische Infrastruktur', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_5_Raum_sowie_Schrank_für_technische_Infrastruktur.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.5.A2', 'INF - Infrastruktur', 'INF.5 Raum sowie Schrank für technische Infrastruktur', 'INF.5.A2 Lage und Größe des Raumes für technische Infrastruktur', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_5_Raum_sowie_Schrank_für_technische_Infrastruktur.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.5.A20', 'INF - Infrastruktur', 'INF.5 Raum sowie Schrank für technische Infrastruktur', 'INF.5.A20 Schutz vor Einbruch und Sabotage', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_5_Raum_sowie_Schrank_für_technische_Infrastruktur.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.5.A21', 'INF - Infrastruktur', 'INF.5 Raum sowie Schrank für technische Infrastruktur', 'INF.5.A21 Redundante Leitungstrassen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_5_Raum_sowie_Schrank_für_technische_Infrastruktur.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.5.A22', 'INF - Infrastruktur', 'INF.5 Raum sowie Schrank für technische Infrastruktur', 'INF.5.A22 Redundante Auslegung der Stromversorgung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_5_Raum_sowie_Schrank_für_technische_Infrastruktur.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.5.A23', 'INF - Infrastruktur', 'INF.5 Raum sowie Schrank für technische Infrastruktur', 'INF.5.A23 Netzersatzanlage', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_5_Raum_sowie_Schrank_für_technische_Infrastruktur.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.5.A24', 'INF - Infrastruktur', 'INF.5 Raum sowie Schrank für technische Infrastruktur', 'INF.5.A24 Lüftung und Kühlung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_5_Raum_sowie_Schrank_für_technische_Infrastruktur.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.5.A25', 'INF - Infrastruktur', 'INF.5 Raum sowie Schrank für technische Infrastruktur', 'INF.5.A25 Erhöhter Schutz vor Schädigung durch Brand und Rauchgase', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_5_Raum_sowie_Schrank_für_technische_Infrastruktur.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.5.A26', 'INF - Infrastruktur', 'INF.5 Raum sowie Schrank für technische Infrastruktur', 'INF.5.A26 Überwachung der Energieversorgung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_5_Raum_sowie_Schrank_für_technische_Infrastruktur.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.5.A3', 'INF - Infrastruktur', 'INF.5 Raum sowie Schrank für technische Infrastruktur', 'INF.5.A3 Zutrittsregelung und -kontrolle', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_5_Raum_sowie_Schrank_für_technische_Infrastruktur.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.5.A4', 'INF - Infrastruktur', 'INF.5 Raum sowie Schrank für technische Infrastruktur', 'INF.5.A4 Schutz vor Einbruch', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_5_Raum_sowie_Schrank_für_technische_Infrastruktur.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.5.A5', 'INF - Infrastruktur', 'INF.5 Raum sowie Schrank für technische Infrastruktur', 'INF.5.A5 Vermeidung sowie Schutz vor elektromagnetischen Störfeldern', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_5_Raum_sowie_Schrank_für_technische_Infrastruktur.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.5.A6', 'INF - Infrastruktur', 'INF.5 Raum sowie Schrank für technische Infrastruktur', 'INF.5.A6 Minimierung von Brandlasten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_5_Raum_sowie_Schrank_für_technische_Infrastruktur.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.5.A7', 'INF - Infrastruktur', 'INF.5 Raum sowie Schrank für technische Infrastruktur', 'INF.5.A7 Verhinderung von Zweckentfremdung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_5_Raum_sowie_Schrank_für_technische_Infrastruktur.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.5.A8', 'INF - Infrastruktur', 'INF.5 Raum sowie Schrank für technische Infrastruktur', 'INF.5.A8 Vermeidung von unkontrollierter elektrostatischer Entladung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_5_Raum_sowie_Schrank_für_technische_Infrastruktur.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.5.A9', 'INF - Infrastruktur', 'INF.5 Raum sowie Schrank für technische Infrastruktur', 'INF.5.A9 Stromversorgung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_5_Raum_sowie_Schrank_für_technische_Infrastruktur.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.6.A1', 'INF - Infrastruktur', 'INF.6 Datenträgerarchiv', 'INF.6.A1 Handfeuerlöscher', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_6_Datenträgerarchiv.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.6.A2', 'INF - Infrastruktur', 'INF.6 Datenträgerarchiv', 'INF.6.A2 Zutrittsregelung und -kontrolle', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_6_Datenträgerarchiv.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.6.A3', 'INF - Infrastruktur', 'INF.6 Datenträgerarchiv', 'INF.6.A3 Schutz vor Staub und anderer Verschmutzung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_6_Datenträgerarchiv.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.6.A4', 'INF - Infrastruktur', 'INF.6 Datenträgerarchiv', 'INF.6.A4 Geschlossene Fenster und abgeschlossene Türen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_6_Datenträgerarchiv.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.6.A5', 'INF - Infrastruktur', 'INF.6 Datenträgerarchiv', 'INF.6.A5 Verwendung von Schutzschränken', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_6_Datenträgerarchiv.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.6.A6', 'INF - Infrastruktur', 'INF.6 Datenträgerarchiv', 'INF.6.A6 Vermeidung von wasserführenden Leitungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_6_Datenträgerarchiv.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.6.A7', 'INF - Infrastruktur', 'INF.6 Datenträgerarchiv', 'INF.6.A7 Einhaltung von klimatischen Bedingungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_6_Datenträgerarchiv.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.6.A8', 'INF - Infrastruktur', 'INF.6 Datenträgerarchiv', 'INF.6.A8 Sichere Türen und Fenster', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_6_Datenträgerarchiv.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.6.A9', 'INF - Infrastruktur', 'INF.6 Datenträgerarchiv', 'INF.6.A9 Gefahrenmeldeanlage', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_6_Datenträgerarchiv.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.7.A1', 'INF - Infrastruktur', 'INF.7 Büroarbeitsplatz', 'INF.7.A1 Geeignete Auswahl und Nutzung eines Büroraumes', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_7_Büroarbeitsplatz.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.7.A2', 'INF - Infrastruktur', 'INF.7 Büroarbeitsplatz', 'INF.7.A2 Geschlossene Fenster und abgeschlossene Türen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_7_Büroarbeitsplatz.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.7.A3', 'INF - Infrastruktur', 'INF.7 Büroarbeitsplatz', 'INF.7.A3 Fliegende Verkabelung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_7_Büroarbeitsplatz.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.7.A4', 'INF - Infrastruktur', 'INF.7 Büroarbeitsplatz', 'INF.7.A4 Zutrittsregelungen und -kontrolle', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_7_Büroarbeitsplatz.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.7.A5', 'INF - Infrastruktur', 'INF.7 Büroarbeitsplatz', 'INF.7.A5 Ergonomischer Arbeitsplatz', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_7_Büroarbeitsplatz.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.7.A6', 'INF - Infrastruktur', 'INF.7 Büroarbeitsplatz', 'INF.7.A6 Aufgeräumter Arbeitsplatz', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_7_Büroarbeitsplatz.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.7.A7', 'INF - Infrastruktur', 'INF.7 Büroarbeitsplatz', 'INF.7.A7 Geeignete Aufbewahrung dienstlicher Unterlagen und Datenträger', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_7_Büroarbeitsplatz.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.7.A8', 'INF - Infrastruktur', 'INF.7 Büroarbeitsplatz', 'INF.7.A8 Einsatz von Diebstahlsicherungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_7_Büroarbeitsplatz.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.8.A1', 'INF - Infrastruktur', 'INF.8 Häuslicher Arbeitsplatz', 'INF.8.A1 Sichern von dienstlichen Unterlagen am häuslichen Arbeitsplatz', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_8_Häuslicher_Arbeitsplatz.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.8.A2', 'INF - Infrastruktur', 'INF.8 Häuslicher Arbeitsplatz', 'INF.8.A2 Transport von Arbeitsmaterial zum häuslichen Arbeitsplatz', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_8_Häuslicher_Arbeitsplatz.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.8.A3', 'INF - Infrastruktur', 'INF.8 Häuslicher Arbeitsplatz', 'INF.8.A3 Schutz vor unbefugtem Zutritt am häuslichen Arbeitsplatz', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_8_Häuslicher_Arbeitsplatz.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.8.A4', 'INF - Infrastruktur', 'INF.8 Häuslicher Arbeitsplatz', 'INF.8.A4 Geeignete Einrichtung des häuslichen Arbeitsplatzes', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_8_Häuslicher_Arbeitsplatz.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.8.A5', 'INF - Infrastruktur', 'INF.8 Häuslicher Arbeitsplatz', 'INF.8.A5 Entsorgung von vertraulichen Informationen am häuslichen Arbeitsplatz', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_8_Häuslicher_Arbeitsplatz.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.8.A6', 'INF - Infrastruktur', 'INF.8 Häuslicher Arbeitsplatz', 'INF.8.A6 Umgang mit dienstlichen Unterlagen bei erhöhtem Schutzbedarf am häuslichen Arbeitsplatz', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_8_Häuslicher_Arbeitsplatz.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.9.A1', 'INF - Infrastruktur', 'INF.9 Mobiler Arbeitsplatz', 'INF.9.A1 Geeignete Auswahl und Nutzung eines mobilen Arbeitsplatzes', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_9_Mobiler_Arbeitsplatz.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.9.A10', 'INF - Infrastruktur', 'INF.9 Mobiler Arbeitsplatz', 'INF.9.A10 Einsatz von Diebstahlsicherungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_9_Mobiler_Arbeitsplatz.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.9.A11', 'INF - Infrastruktur', 'INF.9 Mobiler Arbeitsplatz', 'INF.9.A11 Verbot der Nutzung unsicherer Umgebungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_9_Mobiler_Arbeitsplatz.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.9.A2', 'INF - Infrastruktur', 'INF.9 Mobiler Arbeitsplatz', 'INF.9.A2 Regelungen für mobile Arbeitsplätze', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_9_Mobiler_Arbeitsplatz.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.9.A3', 'INF - Infrastruktur', 'INF.9 Mobiler Arbeitsplatz', 'INF.9.A3 Zutritts- und Zugriffsschutz', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_9_Mobiler_Arbeitsplatz.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.9.A4', 'INF - Infrastruktur', 'INF.9 Mobiler Arbeitsplatz', 'INF.9.A4 Arbeiten mit fremden IT-Systemen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_9_Mobiler_Arbeitsplatz.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.9.A5', 'INF - Infrastruktur', 'INF.9 Mobiler Arbeitsplatz', 'INF.9.A5 Zeitnahe Verlustmeldung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_9_Mobiler_Arbeitsplatz.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.9.A6', 'INF - Infrastruktur', 'INF.9 Mobiler Arbeitsplatz', 'INF.9.A6 Entsorgung von vertraulichen Informationen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_9_Mobiler_Arbeitsplatz.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.9.A7', 'INF - Infrastruktur', 'INF.9 Mobiler Arbeitsplatz', 'INF.9.A7 Rechtliche Rahmenbedingungen für das mobile Arbeiten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_9_Mobiler_Arbeitsplatz.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.9.A8', 'INF - Infrastruktur', 'INF.9 Mobiler Arbeitsplatz', 'INF.9.A8 Sicherheitsrichtlinie für mobile Arbeitsplätze', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_9_Mobiler_Arbeitsplatz.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('INF.9.A9', 'INF - Infrastruktur', 'INF.9 Mobiler Arbeitsplatz', 'INF.9.A9 Verschlüsselung tragbarer IT-Systeme und Datenträger', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/INF/INF_9_Mobiler_Arbeitsplatz.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('ISMS.1.A1', 'ISMS - Sicherheitsmanagement', 'ISMS.1 Sicherheitsmanagement', 'ISMS.1.A1 Übernahme der Gesamtverantwortung für Informationssicherheit durch die Leitungsebene', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/ISMS/ISMS_1_Sicherheitsmanagement.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('ISMS.1.A10', 'ISMS - Sicherheitsmanagement', 'ISMS.1 Sicherheitsmanagement', 'ISMS.1.A10 Erstellung eines Sicherheitskonzepts', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/ISMS/ISMS_1_Sicherheitsmanagement.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('ISMS.1.A11', 'ISMS - Sicherheitsmanagement', 'ISMS.1 Sicherheitsmanagement', 'ISMS.1.A11 Aufrechterhaltung der Informationssicherheit', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/ISMS/ISMS_1_Sicherheitsmanagement.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('ISMS.1.A12', 'ISMS - Sicherheitsmanagement', 'ISMS.1 Sicherheitsmanagement', 'ISMS.1.A12 Management-Berichte zur Informationssicherheit', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/ISMS/ISMS_1_Sicherheitsmanagement.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('ISMS.1.A13', 'ISMS - Sicherheitsmanagement', 'ISMS.1 Sicherheitsmanagement', 'ISMS.1.A13 Dokumentation des Sicherheitsprozesses', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/ISMS/ISMS_1_Sicherheitsmanagement.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('ISMS.1.A14', 'ISMS - Sicherheitsmanagement', 'ISMS.1 Sicherheitsmanagement', 'ISMS.1.A14 Sensibilisierung zur Informationssicherheit', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/ISMS/ISMS_1_Sicherheitsmanagement.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('ISMS.1.A15', 'ISMS - Sicherheitsmanagement', 'ISMS.1 Sicherheitsmanagement', 'ISMS.1.A15 Wirtschaftlicher Einsatz von Ressourcen für Informationssicherheit', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/ISMS/ISMS_1_Sicherheitsmanagement.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('ISMS.1.A16', 'ISMS - Sicherheitsmanagement', 'ISMS.1 Sicherheitsmanagement', 'ISMS.1.A16 Erstellung von zielgruppengerechten Sicherheitsrichtlinien', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/ISMS/ISMS_1_Sicherheitsmanagement.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('ISMS.1.A17', 'ISMS - Sicherheitsmanagement', 'ISMS.1 Sicherheitsmanagement', 'ISMS.1.A17 Abschließen von Versicherungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/ISMS/ISMS_1_Sicherheitsmanagement.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('ISMS.1.A2', 'ISMS - Sicherheitsmanagement', 'ISMS.1 Sicherheitsmanagement', 'ISMS.1.A2 Festlegung der Sicherheitsziele und -strategie', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/ISMS/ISMS_1_Sicherheitsmanagement.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('ISMS.1.A3', 'ISMS - Sicherheitsmanagement', 'ISMS.1 Sicherheitsmanagement', 'ISMS.1.A3 Erstellung einer Leitlinie zur Informationssicherheit', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/ISMS/ISMS_1_Sicherheitsmanagement.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('ISMS.1.A4', 'ISMS - Sicherheitsmanagement', 'ISMS.1 Sicherheitsmanagement', 'ISMS.1.A4 Benennung eines Informationssicherheitsbeauftragten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/ISMS/ISMS_1_Sicherheitsmanagement.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('ISMS.1.A5', 'ISMS - Sicherheitsmanagement', 'ISMS.1 Sicherheitsmanagement', 'ISMS.1.A5 Vertragsgestaltung bei Bestellung eines externen Informationssicherheitsbeauftragten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/ISMS/ISMS_1_Sicherheitsmanagement.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('ISMS.1.A6', 'ISMS - Sicherheitsmanagement', 'ISMS.1 Sicherheitsmanagement', 'ISMS.1.A6 Aufbau einer geeigneten Organisationsstruktur für Informationssicherheit', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/ISMS/ISMS_1_Sicherheitsmanagement.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('ISMS.1.A7', 'ISMS - Sicherheitsmanagement', 'ISMS.1 Sicherheitsmanagement', 'ISMS.1.A7 Festlegung von Sicherheitsmaßnahmen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/ISMS/ISMS_1_Sicherheitsmanagement.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('ISMS.1.A8', 'ISMS - Sicherheitsmanagement', 'ISMS.1 Sicherheitsmanagement', 'ISMS.1.A8 Integration der Mitarbeiter in den Sicherheitsprozess', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/ISMS/ISMS_1_Sicherheitsmanagement.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('ISMS.1.A9', 'ISMS - Sicherheitsmanagement', 'ISMS.1 Sicherheitsmanagement', 'ISMS.1.A9 Integration der Informationssicherheit in organisationsweite Abläufe und Prozesse', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/ISMS/ISMS_1_Sicherheitsmanagement.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.1.1.A1', 'NET - Netze und Kommunikation', 'NET.1.1 Netzarchitektur und -design', 'NET.1.1.A1 Sicherheitsrichtlinie für das Netz', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_1_1_Netzarchitektur_und_-design.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.1.1.A10', 'NET - Netze und Kommunikation', 'NET.1.1 Netzarchitektur und -design', 'NET.1.1.A10 DMZ-Segmentierung für Zugriffe aus dem Internet', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_1_1_Netzarchitektur_und_-design.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.1.1.A11', 'NET - Netze und Kommunikation', 'NET.1.1 Netzarchitektur und -design', 'NET.1.1.A11 Absicherung eingehender Kommunikation vom Internet in das interne Netz', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_1_1_Netzarchitektur_und_-design.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.1.1.A12', 'NET - Netze und Kommunikation', 'NET.1.1 Netzarchitektur und -design', 'NET.1.1.A12 Absicherung ausgehender interner Kommunikation zum Internet', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_1_1_Netzarchitektur_und_-design.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.1.1.A13', 'NET - Netze und Kommunikation', 'NET.1.1 Netzarchitektur und -design', 'NET.1.1.A13 Netzplanung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_1_1_Netzarchitektur_und_-design.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.1.1.A14', 'NET - Netze und Kommunikation', 'NET.1.1 Netzarchitektur und -design', 'NET.1.1.A14 Umsetzung der Netzplanung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_1_1_Netzarchitektur_und_-design.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.1.1.A15', 'NET - Netze und Kommunikation', 'NET.1.1 Netzarchitektur und -design', 'NET.1.1.A15 Regelmäßiger Soll-Ist-Vergleich', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_1_1_Netzarchitektur_und_-design.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.1.1.A16', 'NET - Netze und Kommunikation', 'NET.1.1 Netzarchitektur und -design', 'NET.1.1.A16 Spezifikation der Netzarchitektur', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_1_1_Netzarchitektur_und_-design.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.1.1.A17', 'NET - Netze und Kommunikation', 'NET.1.1 Netzarchitektur und -design', 'NET.1.1.A17 Spezifikation des Netzdesigns', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_1_1_Netzarchitektur_und_-design.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.1.1.A18', 'NET - Netze und Kommunikation', 'NET.1.1 Netzarchitektur und -design', 'NET.1.1.A18 P-A-P-Struktur für die Internet-Anbindung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_1_1_Netzarchitektur_und_-design.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.1.1.A19', 'NET - Netze und Kommunikation', 'NET.1.1 Netzarchitektur und -design', 'NET.1.1.A19 Separierung der Infrastrukturdienste', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_1_1_Netzarchitektur_und_-design.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.1.1.A2', 'NET - Netze und Kommunikation', 'NET.1.1 Netzarchitektur und -design', 'NET.1.1.A2 Dokumentation des Netzes', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_1_1_Netzarchitektur_und_-design.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.1.1.A20', 'NET - Netze und Kommunikation', 'NET.1.1 Netzarchitektur und -design', 'NET.1.1.A20 Zuweisung dedizierter Subnetze für IPv4/IPv6-Endgerätegruppen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_1_1_Netzarchitektur_und_-design.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.1.1.A21', 'NET - Netze und Kommunikation', 'NET.1.1 Netzarchitektur und -design', 'NET.1.1.A21 Separierung des Management-Bereichs', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_1_1_Netzarchitektur_und_-design.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.1.1.A22', 'NET - Netze und Kommunikation', 'NET.1.1 Netzarchitektur und -design', 'NET.1.1.A22 Spezifikation des Segmentierungskonzepts', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_1_1_Netzarchitektur_und_-design.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.1.1.A23', 'NET - Netze und Kommunikation', 'NET.1.1 Netzarchitektur und -design', 'NET.1.1.A23 Trennung von Sicherheitssegmenten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_1_1_Netzarchitektur_und_-design.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.1.1.A24', 'NET - Netze und Kommunikation', 'NET.1.1 Netzarchitektur und -design', 'NET.1.1.A24 Sichere logische Trennung mittels VLAN', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_1_1_Netzarchitektur_und_-design.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.1.1.A25', 'NET - Netze und Kommunikation', 'NET.1.1 Netzarchitektur und -design', 'NET.1.1.A25 Fein- und Umsetzungsplanung von Netzarchitektur und -design', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_1_1_Netzarchitektur_und_-design.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.1.1.A26', 'NET - Netze und Kommunikation', 'NET.1.1 Netzarchitektur und -design', 'NET.1.1.A26 Spezifikation von Betriebsprozessen für das Netz', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_1_1_Netzarchitektur_und_-design.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.1.1.A27', 'NET - Netze und Kommunikation', 'NET.1.1 Netzarchitektur und -design', 'NET.1.1.A27 Einbindung der Netzarchitektur in die Notfallplanung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_1_1_Netzarchitektur_und_-design.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.1.1.A28', 'NET - Netze und Kommunikation', 'NET.1.1 Netzarchitektur und -design', 'NET.1.1.A28 Hochverfügbare Netz- und Sicherheitskomponenten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_1_1_Netzarchitektur_und_-design.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.1.1.A29', 'NET - Netze und Kommunikation', 'NET.1.1 Netzarchitektur und -design', 'NET.1.1.A29 Hochverfügbare Realisierung von Netzanbindungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_1_1_Netzarchitektur_und_-design.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.1.1.A3', 'NET - Netze und Kommunikation', 'NET.1.1 Netzarchitektur und -design', 'NET.1.1.A3 Anforderungsspezifikation für das Netz', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_1_1_Netzarchitektur_und_-design.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.1.1.A30', 'NET - Netze und Kommunikation', 'NET.1.1 Netzarchitektur und -design', 'NET.1.1.A30 Schutz vor Distributed-Denial-of-Service', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_1_1_Netzarchitektur_und_-design.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.1.1.A31', 'NET - Netze und Kommunikation', 'NET.1.1 Netzarchitektur und -design', 'NET.1.1.A31 Physische Trennung von Sicherheitssegmenten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_1_1_Netzarchitektur_und_-design.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.1.1.A32', 'NET - Netze und Kommunikation', 'NET.1.1 Netzarchitektur und -design', 'NET.1.1.A32 Physische Trennung von Management-Segmenten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_1_1_Netzarchitektur_und_-design.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.1.1.A33', 'NET - Netze und Kommunikation', 'NET.1.1 Netzarchitektur und -design', 'NET.1.1.A33 Mikrosegmentierung des Netzes', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_1_1_Netzarchitektur_und_-design.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.1.1.A34', 'NET - Netze und Kommunikation', 'NET.1.1 Netzarchitektur und -design', 'NET.1.1.A34 Einsatz kryptografischer Verfahren auf Netzebene', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_1_1_Netzarchitektur_und_-design.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.1.1.A35', 'NET - Netze und Kommunikation', 'NET.1.1 Netzarchitektur und -design', 'NET.1.1.A35 Einsatz von netzbasiertem DLP', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_1_1_Netzarchitektur_und_-design.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.1.1.A36', 'NET - Netze und Kommunikation', 'NET.1.1 Netzarchitektur und -design', 'NET.1.1.A36 Trennung mittels VLAN bei sehr hohem Schutzbedarf', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_1_1_Netzarchitektur_und_-design.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.1.1.A4', 'NET - Netze und Kommunikation', 'NET.1.1 Netzarchitektur und -design', 'NET.1.1.A4 Netztrennung in Sicherheitszonen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_1_1_Netzarchitektur_und_-design.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.1.1.A5', 'NET - Netze und Kommunikation', 'NET.1.1 Netzarchitektur und -design', 'NET.1.1.A5 Client-Server-Segmentierung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_1_1_Netzarchitektur_und_-design.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.1.1.A6', 'NET - Netze und Kommunikation', 'NET.1.1 Netzarchitektur und -design', 'NET.1.1.A6 Endgeräte-Segmentierung im internen Netz', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_1_1_Netzarchitektur_und_-design.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.1.1.A7', 'NET - Netze und Kommunikation', 'NET.1.1 Netzarchitektur und -design', 'NET.1.1.A7 Absicherung von schützenswerten Informationen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_1_1_Netzarchitektur_und_-design.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.1.1.A8', 'NET - Netze und Kommunikation', 'NET.1.1 Netzarchitektur und -design', 'NET.1.1.A8 Grundlegende Absicherung des Internetzugangs', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_1_1_Netzarchitektur_und_-design.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.1.1.A9', 'NET - Netze und Kommunikation', 'NET.1.1 Netzarchitektur und -design', 'NET.1.1.A9 Grundlegende Absicherung der Kommunikation mit nicht vertrauenswürdigen Netzen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_1_1_Netzarchitektur_und_-design.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.1.2.A1', 'NET - Netze und Kommunikation', 'NET.1.2 Netzmanagement', 'NET.1.2.A1 Planung des Netzmanagements', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_1_2_Netzmanagement.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.1.2.A10', 'NET - Netze und Kommunikation', 'NET.1.2 Netzmanagement', 'NET.1.2.A10 Beschränkung der SNMP-Kommunikation', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_1_2_Netzmanagement.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.1.2.A11', 'NET - Netze und Kommunikation', 'NET.1.2 Netzmanagement', 'NET.1.2.A11 Festlegung einer Sicherheitsrichtlinie für das Netzmanagement', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_1_2_Netzmanagement.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.1.2.A12', 'NET - Netze und Kommunikation', 'NET.1.2 Netzmanagement', 'NET.1.2.A12 Ist-Aufnahme und Dokumentation des Netzmanagements', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_1_2_Netzmanagement.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.1.2.A13', 'NET - Netze und Kommunikation', 'NET.1.2 Netzmanagement', 'NET.1.2.A13 Erstellung eines Netzmanagement-Konzepts', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_1_2_Netzmanagement.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.1.2.A14', 'NET - Netze und Kommunikation', 'NET.1.2 Netzmanagement', 'NET.1.2.A14 Fein- und Umsetzungsplanung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_1_2_Netzmanagement.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.1.2.A15', 'NET - Netze und Kommunikation', 'NET.1.2 Netzmanagement', 'NET.1.2.A15 Konzept für den sicheren Betrieb der Netzmanagement-Infrastruktur', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_1_2_Netzmanagement.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.1.2.A16', 'NET - Netze und Kommunikation', 'NET.1.2 Netzmanagement', 'NET.1.2.A16 Einrichtung und Konfiguration von Netzmanagement-Lösungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_1_2_Netzmanagement.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.1.2.A17', 'NET - Netze und Kommunikation', 'NET.1.2 Netzmanagement', 'NET.1.2.A17 Regelmäßiger Soll-Ist-Vergleich', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_1_2_Netzmanagement.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.1.2.A18', 'NET - Netze und Kommunikation', 'NET.1.2 Netzmanagement', 'NET.1.2.A18 Schulungen für Management-Lösungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_1_2_Netzmanagement.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.1.2.A19', 'NET - Netze und Kommunikation', 'NET.1.2 Netzmanagement', 'NET.1.2.A19 Starke Authentisierung des Management-Zugriffs', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_1_2_Netzmanagement.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.1.2.A2', 'NET - Netze und Kommunikation', 'NET.1.2 Netzmanagement', 'NET.1.2.A2 Anforderungsspezifikation für das Netzmanagement', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_1_2_Netzmanagement.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.1.2.A20', 'NET - Netze und Kommunikation', 'NET.1.2 Netzmanagement', 'NET.1.2.A20 Absicherung des Zugangs zu Netzmanagement-Lösungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_1_2_Netzmanagement.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.1.2.A21', 'NET - Netze und Kommunikation', 'NET.1.2 Netzmanagement', 'NET.1.2.A21 Entkopplung der Netzmanagement-Kommunikation', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_1_2_Netzmanagement.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.1.2.A22', 'NET - Netze und Kommunikation', 'NET.1.2 Netzmanagement', 'NET.1.2.A22 Beschränkung der Management-Funktionen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_1_2_Netzmanagement.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.1.2.A23', 'NET - Netze und Kommunikation', 'NET.1.2 Netzmanagement', 'NET.1.2.A23 Protokollierung der administrativen Zugriffe', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_1_2_Netzmanagement.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.1.2.A24', 'NET - Netze und Kommunikation', 'NET.1.2 Netzmanagement', 'NET.1.2.A24 Zentrale Konfigurationsverwaltung für Netzkomponenten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_1_2_Netzmanagement.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.1.2.A25', 'NET - Netze und Kommunikation', 'NET.1.2 Netzmanagement', 'NET.1.2.A25 Statusüberwachung der Netzkomponenten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_1_2_Netzmanagement.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.1.2.A26', 'NET - Netze und Kommunikation', 'NET.1.2 Netzmanagement', 'NET.1.2.A26 Umfassende Protokollierung, Alarmierung und Logging von Ereignissen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_1_2_Netzmanagement.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.1.2.A27', 'NET - Netze und Kommunikation', 'NET.1.2 Netzmanagement', 'NET.1.2.A27 Einbindung des Netzmanagements in die Notfallplanung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_1_2_Netzmanagement.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.1.2.A28', 'NET - Netze und Kommunikation', 'NET.1.2 Netzmanagement', 'NET.1.2.A28 Platzierung der Management-Clients für das In-Band-Management', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_1_2_Netzmanagement.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.1.2.A29', 'NET - Netze und Kommunikation', 'NET.1.2 Netzmanagement', 'NET.1.2.A29 Einsatz von VLANs in der Management-Zone', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_1_2_Netzmanagement.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.1.2.A3', 'NET - Netze und Kommunikation', 'NET.1.2 Netzmanagement', 'NET.1.2.A3 Rollen- und Berechtigungskonzept für das Netzmanagement', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_1_2_Netzmanagement.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.1.2.A30', 'NET - Netze und Kommunikation', 'NET.1.2 Netzmanagement', 'NET.1.2.A30 Hochverfügbare Realisierung der Management-Lösung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_1_2_Netzmanagement.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.1.2.A31', 'NET - Netze und Kommunikation', 'NET.1.2 Netzmanagement', 'NET.1.2.A31 Grundsätzliche Nutzung von sicheren Protokollen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_1_2_Netzmanagement.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.1.2.A32', 'NET - Netze und Kommunikation', 'NET.1.2 Netzmanagement', 'NET.1.2.A32 Physische Trennung des Managementnetzes', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_1_2_Netzmanagement.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.1.2.A33', 'NET - Netze und Kommunikation', 'NET.1.2 Netzmanagement', 'NET.1.2.A33 Physische Trennung von Management-Segmenten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_1_2_Netzmanagement.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.1.2.A34', 'NET - Netze und Kommunikation', 'NET.1.2 Netzmanagement', 'NET.1.2.A34 Protokollierung von Inhalten administrativer Sitzungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_1_2_Netzmanagement.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.1.2.A35', 'NET - Netze und Kommunikation', 'NET.1.2 Netzmanagement', 'NET.1.2.A35 Festlegungen zur Beweissicherung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_1_2_Netzmanagement.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.1.2.A36', 'NET - Netze und Kommunikation', 'NET.1.2 Netzmanagement', 'NET.1.2.A36 Einbindung der Protokollierung des Netzmanagements in eine SIEM-Lösung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_1_2_Netzmanagement.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.1.2.A37', 'NET - Netze und Kommunikation', 'NET.1.2 Netzmanagement', 'NET.1.2.A37 Standort übergreifende Zeitsynchronisation', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_1_2_Netzmanagement.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.1.2.A38', 'NET - Netze und Kommunikation', 'NET.1.2 Netzmanagement', 'NET.1.2.A38 Festlegung von Notbetriebsformen für die Netzmanagement-Infrastruktur', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_1_2_Netzmanagement.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.1.2.A4', 'NET - Netze und Kommunikation', 'NET.1.2 Netzmanagement', 'NET.1.2.A4 Grundlegende Authentisierung für den Netzmanagement-Zugriff', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_1_2_Netzmanagement.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.1.2.A5', 'NET - Netze und Kommunikation', 'NET.1.2 Netzmanagement', 'NET.1.2.A5 Einspielen von Updates und Patches', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_1_2_Netzmanagement.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.1.2.A6', 'NET - Netze und Kommunikation', 'NET.1.2 Netzmanagement', 'NET.1.2.A6 Regelmäßige Datensicherung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_1_2_Netzmanagement.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.1.2.A7', 'NET - Netze und Kommunikation', 'NET.1.2 Netzmanagement', 'NET.1.2.A7 Grundlegende Protokollierung von Ereignissen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_1_2_Netzmanagement.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.1.2.A8', 'NET - Netze und Kommunikation', 'NET.1.2 Netzmanagement', 'NET.1.2.A8 Zeit-Synchronisation', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_1_2_Netzmanagement.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.1.2.A9', 'NET - Netze und Kommunikation', 'NET.1.2 Netzmanagement', 'NET.1.2.A9 Absicherung der Netzmanagement-Kommunikation', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_1_2_Netzmanagement.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.2.1.A1', 'NET - Netze und Kommunikation', 'NET.2.1 WLAN-Betrieb', 'NET.2.1.A1 Festlegung einer Strategie für den Einsatz von WLANs', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_2_1_WLAN-Betrieb.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.2.1.A10', 'NET - Netze und Kommunikation', 'NET.2.1 WLAN-Betrieb', 'NET.2.1.A10 Erstellung einer Sicherheitsrichtlinie für den Betrieb von WLANs', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_2_1_WLAN-Betrieb.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.2.1.A11', 'NET - Netze und Kommunikation', 'NET.2.1 WLAN-Betrieb', 'NET.2.1.A11 Geeignete Auswahl von WLAN-Komponenten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_2_1_WLAN-Betrieb.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.2.1.A12', 'NET - Netze und Kommunikation', 'NET.2.1 WLAN-Betrieb', 'NET.2.1.A12 Einsatz einer geeigneten WLAN-Management-Lösung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_2_1_WLAN-Betrieb.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.2.1.A13', 'NET - Netze und Kommunikation', 'NET.2.1 WLAN-Betrieb', 'NET.2.1.A13 Regelmäßige Sicherheitschecks in WLANs', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_2_1_WLAN-Betrieb.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.2.1.A14', 'NET - Netze und Kommunikation', 'NET.2.1 WLAN-Betrieb', 'NET.2.1.A14 Regelmäßige Audits der WLAN-Komponenten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_2_1_WLAN-Betrieb.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.2.1.A15', 'NET - Netze und Kommunikation', 'NET.2.1 WLAN-Betrieb', 'NET.2.1.A15 Verwendung eines VPN zur Absicherung von WLANs', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_2_1_WLAN-Betrieb.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.2.1.A16', 'NET - Netze und Kommunikation', 'NET.2.1 WLAN-Betrieb', 'NET.2.1.A16 Zusätzliche Absicherung bei der Anbindung von WLANs an ein LAN', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_2_1_WLAN-Betrieb.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.2.1.A17', 'NET - Netze und Kommunikation', 'NET.2.1 WLAN-Betrieb', 'NET.2.1.A17 Absicherung der Kommunikation zwischen Access Points', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_2_1_WLAN-Betrieb.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.2.1.A18', 'NET - Netze und Kommunikation', 'NET.2.1 WLAN-Betrieb', 'NET.2.1.A18 Einsatz von Wireless Intrusion Detection/Wireless Intrusion Prevention Systemen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_2_1_WLAN-Betrieb.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.2.1.A2', 'NET - Netze und Kommunikation', 'NET.2.1 WLAN-Betrieb', 'NET.2.1.A2 Auswahl eines geeigneten WLAN-Standards', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_2_1_WLAN-Betrieb.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.2.1.A3', 'NET - Netze und Kommunikation', 'NET.2.1 WLAN-Betrieb', 'NET.2.1.A3 Auswahl geeigneter Kryptoverfahren für WLAN', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_2_1_WLAN-Betrieb.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.2.1.A4', 'NET - Netze und Kommunikation', 'NET.2.1 WLAN-Betrieb', 'NET.2.1.A4 Geeignete Aufstellung von Access Points', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_2_1_WLAN-Betrieb.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.2.1.A5', 'NET - Netze und Kommunikation', 'NET.2.1 WLAN-Betrieb', 'NET.2.1.A5 Sichere Basis-Konfiguration der Access Points', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_2_1_WLAN-Betrieb.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.2.1.A6', 'NET - Netze und Kommunikation', 'NET.2.1 WLAN-Betrieb', 'NET.2.1.A6 Sichere Konfiguration der WLAN-Clients', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_2_1_WLAN-Betrieb.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.2.1.A7', 'NET - Netze und Kommunikation', 'NET.2.1 WLAN-Betrieb', 'NET.2.1.A7 Aufbau eines Distribution Systems', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_2_1_WLAN-Betrieb.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.2.1.A8', 'NET - Netze und Kommunikation', 'NET.2.1 WLAN-Betrieb', 'NET.2.1.A8 Verhaltensregeln bei WLAN-Sicherheitsvorfällen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_2_1_WLAN-Betrieb.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.2.1.A9', 'NET - Netze und Kommunikation', 'NET.2.1 WLAN-Betrieb', 'NET.2.1.A9 Sichere Anbindung von WLANs an ein LAN', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_2_1_WLAN-Betrieb.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.2.2.A1', 'NET - Netze und Kommunikation', 'NET.2.2 WLAN-Nutzung', 'NET.2.2.A1 Erstellung einer Benutzerrichtlinie für WLAN', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_2_2_WLAN-Nutzung.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.2.2.A2', 'NET - Netze und Kommunikation', 'NET.2.2 WLAN-Nutzung', 'NET.2.2.A2 Sensibilisierung und Schulung der WLAN-Benutzer', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_2_2_WLAN-Nutzung.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.2.2.A3', 'NET - Netze und Kommunikation', 'NET.2.2 WLAN-Nutzung', 'NET.2.2.A3 Absicherung der WLAN-Nutzung in unsicheren Umgebungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_2_2_WLAN-Nutzung.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.2.2.A4', 'NET - Netze und Kommunikation', 'NET.2.2 WLAN-Nutzung', 'NET.2.2.A4 Verhaltensregeln bei WLAN-Sicherheitsvorfällen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_2_2_WLAN-Nutzung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.3.1.A1', 'NET - Netze und Kommunikation', 'NET.3.1 Router und Switches', 'NET.3.1.A1 Sichere Grundkonfiguration eines Routers oder Switches', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_3_1_Router_und_Switches.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.3.1.A10', 'NET - Netze und Kommunikation', 'NET.3.1 Router und Switches', 'NET.3.1.A10 Erstellung einer Sicherheitsrichtlinie', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_3_1_Router_und_Switches.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.3.1.A11', 'NET - Netze und Kommunikation', 'NET.3.1 Router und Switches', 'NET.3.1.A11 Beschaffung eines Routers oder Switches', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_3_1_Router_und_Switches.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.3.1.A12', 'NET - Netze und Kommunikation', 'NET.3.1 Router und Switches', 'NET.3.1.A12 Erstellung einer Konfigurations-Checkliste für Router und Switches', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_3_1_Router_und_Switches.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.3.1.A13', 'NET - Netze und Kommunikation', 'NET.3.1 Router und Switches', 'NET.3.1.A13 Administration über ein gesondertes Managementnetz', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_3_1_Router_und_Switches.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.3.1.A14', 'NET - Netze und Kommunikation', 'NET.3.1 Router und Switches', 'NET.3.1.A14 Schutz vor Missbrauch von ICMP-Nachrichten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_3_1_Router_und_Switches.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.3.1.A15', 'NET - Netze und Kommunikation', 'NET.3.1 Router und Switches', 'NET.3.1.A15 Bogon- und Spoofing-Filterung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_3_1_Router_und_Switches.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.3.1.A16', 'NET - Netze und Kommunikation', 'NET.3.1 Router und Switches', 'NET.3.1.A16 Schutz vor „IPv6 Routing Header Type-0“-Angriffen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_3_1_Router_und_Switches.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.3.1.A17', 'NET - Netze und Kommunikation', 'NET.3.1 Router und Switches', 'NET.3.1.A17 Schutz vor DoS- und DDoS-Angriffen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_3_1_Router_und_Switches.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.3.1.A18', 'NET - Netze und Kommunikation', 'NET.3.1 Router und Switches', 'NET.3.1.A18 Einrichtung von Access Control Lists', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_3_1_Router_und_Switches.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.3.1.A19', 'NET - Netze und Kommunikation', 'NET.3.1 Router und Switches', 'NET.3.1.A19 Sicherung von Switch-Ports', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_3_1_Router_und_Switches.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.3.1.A2', 'NET - Netze und Kommunikation', 'NET.3.1 Router und Switches', 'NET.3.1.A2 Einspielen von Updates und Patches', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_3_1_Router_und_Switches.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.3.1.A20', 'NET - Netze und Kommunikation', 'NET.3.1 Router und Switches', 'NET.3.1.A20 Sicherheitsaspekte von Routing-Protokollen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_3_1_Router_und_Switches.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.3.1.A21', 'NET - Netze und Kommunikation', 'NET.3.1 Router und Switches', 'NET.3.1.A21 Identitäts- und Berechtigungsmanagement in der Netzinfrastruktur', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_3_1_Router_und_Switches.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.3.1.A22', 'NET - Netze und Kommunikation', 'NET.3.1 Router und Switches', 'NET.3.1.A22 Notfallvorsorge bei Routern und Switches', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_3_1_Router_und_Switches.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.3.1.A23', 'NET - Netze und Kommunikation', 'NET.3.1 Router und Switches', 'NET.3.1.A23 Revision und Penetrationstests', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_3_1_Router_und_Switches.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.3.1.A24', 'NET - Netze und Kommunikation', 'NET.3.1 Router und Switches', 'NET.3.1.A24 Einsatz von Netzzugangskontrollen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_3_1_Router_und_Switches.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.3.1.A25', 'NET - Netze und Kommunikation', 'NET.3.1 Router und Switches', 'NET.3.1.A25 Erweiterter Integritätsschutz für die Konfigurationsdateien', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_3_1_Router_und_Switches.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.3.1.A26', 'NET - Netze und Kommunikation', 'NET.3.1 Router und Switches', 'NET.3.1.A26 Hochverfügbarkeit', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_3_1_Router_und_Switches.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.3.1.A27', 'NET - Netze und Kommunikation', 'NET.3.1 Router und Switches', 'NET.3.1.A27 Bandbreitenmanagement für kritische Anwendungen und Dienste', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_3_1_Router_und_Switches.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.3.1.A28', 'NET - Netze und Kommunikation', 'NET.3.1 Router und Switches', 'NET.3.1.A28 Einsatz von zertifizierten Produkten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_3_1_Router_und_Switches.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.3.1.A3', 'NET - Netze und Kommunikation', 'NET.3.1 Router und Switches', 'NET.3.1.A3 Restriktive Rechtevergabe', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_3_1_Router_und_Switches.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.3.1.A4', 'NET - Netze und Kommunikation', 'NET.3.1 Router und Switches', 'NET.3.1.A4 Schutz der Administrationsschnittstellen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_3_1_Router_und_Switches.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.3.1.A5', 'NET - Netze und Kommunikation', 'NET.3.1 Router und Switches', 'NET.3.1.A5 Schutz vor Fragmentierungsangriffen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_3_1_Router_und_Switches.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.3.1.A6', 'NET - Netze und Kommunikation', 'NET.3.1 Router und Switches', 'NET.3.1.A6 Notfallzugriff auf Router und Switches', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_3_1_Router_und_Switches.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.3.1.A7', 'NET - Netze und Kommunikation', 'NET.3.1 Router und Switches', 'NET.3.1.A7 Protokollierung bei Routern und Switches', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_3_1_Router_und_Switches.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.3.1.A8', 'NET - Netze und Kommunikation', 'NET.3.1 Router und Switches', 'NET.3.1.A8 Regelmäßige Datensicherung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_3_1_Router_und_Switches.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.3.1.A9', 'NET - Netze und Kommunikation', 'NET.3.1 Router und Switches', 'NET.3.1.A9 Betriebsdokumentationen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_3_1_Router_und_Switches.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.3.2.A1', 'NET - Netze und Kommunikation', 'NET.3.2 Firewall', 'NET.3.2.A1 Erstellung einer Sicherheitsrichtlinie', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_3_2_Firewall.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.3.2.A10', 'NET - Netze und Kommunikation', 'NET.3.2 Firewall', 'NET.3.2.A10 Abwehr von Fragmentierungsangriffen am Paketfilter', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_3_2_Firewall.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.3.2.A11', 'NET - Netze und Kommunikation', 'NET.3.2 Firewall', 'NET.3.2.A11 Einspielen von Updates und Patches', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_3_2_Firewall.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.3.2.A12', 'NET - Netze und Kommunikation', 'NET.3.2 Firewall', 'NET.3.2.A12 Vorgehen bei Sicherheitsvorfällen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_3_2_Firewall.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.3.2.A13', 'NET - Netze und Kommunikation', 'NET.3.2 Firewall', 'NET.3.2.A13 Regelmäßige Datensicherung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_3_2_Firewall.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.3.2.A14', 'NET - Netze und Kommunikation', 'NET.3.2 Firewall', 'NET.3.2.A14 Betriebsdokumentationen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_3_2_Firewall.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.3.2.A15', 'NET - Netze und Kommunikation', 'NET.3.2 Firewall', 'NET.3.2.A15 Beschaffung einer Firewall', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_3_2_Firewall.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.3.2.A16', 'NET - Netze und Kommunikation', 'NET.3.2 Firewall', 'NET.3.2.A16 Aufbau einer „P-A-P“-Struktur', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_3_2_Firewall.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.3.2.A17', 'NET - Netze und Kommunikation', 'NET.3.2 Firewall', 'NET.3.2.A17 Deaktivierung von IPv4 oder IPv6', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_3_2_Firewall.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.3.2.A18', 'NET - Netze und Kommunikation', 'NET.3.2 Firewall', 'NET.3.2.A18 Administration über ein gesondertes Managementnetz', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_3_2_Firewall.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.3.2.A19', 'NET - Netze und Kommunikation', 'NET.3.2 Firewall', 'NET.3.2.A19 Schutz vor TCP SYN Flooding, UDP Paket Storm und Sequence Number Guessing am Paketfilter', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_3_2_Firewall.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.3.2.A2', 'NET - Netze und Kommunikation', 'NET.3.2 Firewall', 'NET.3.2.A2 Festlegen der Firewall-Regeln', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_3_2_Firewall.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.3.2.A20', 'NET - Netze und Kommunikation', 'NET.3.2 Firewall', 'NET.3.2.A20 Absicherung von grundlegenden Internetprotokollen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_3_2_Firewall.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.3.2.A21', 'NET - Netze und Kommunikation', 'NET.3.2 Firewall', 'NET.3.2.A21 Temporäre Entschlüsselung des Datenverkehrs', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_3_2_Firewall.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.3.2.A22', 'NET - Netze und Kommunikation', 'NET.3.2 Firewall', 'NET.3.2.A22 Sichere Zeitsynchronisation', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_3_2_Firewall.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.3.2.A23', 'NET - Netze und Kommunikation', 'NET.3.2 Firewall', 'NET.3.2.A23 Systemüberwachung und -Auswertung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_3_2_Firewall.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.3.2.A24', 'NET - Netze und Kommunikation', 'NET.3.2 Firewall', 'NET.3.2.A24 Revision und Penetrationstests', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_3_2_Firewall.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.3.2.A25', 'NET - Netze und Kommunikation', 'NET.3.2 Firewall', 'NET.3.2.A25 Erweiterter Integritätsschutz für die Konfigurationsdateien', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_3_2_Firewall.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.3.2.A26', 'NET - Netze und Kommunikation', 'NET.3.2 Firewall', 'NET.3.2.A26 Auslagerung von funktionalen Erweiterungen auf dedizierte Hardware', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_3_2_Firewall.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.3.2.A27', 'NET - Netze und Kommunikation', 'NET.3.2 Firewall', 'NET.3.2.A27 Einsatz verschiedener Firewall-Betriebssysteme und -Produkte in einer mehrstufigen Firewall-Architektur', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_3_2_Firewall.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.3.2.A28', 'NET - Netze und Kommunikation', 'NET.3.2 Firewall', 'NET.3.2.A28 Zentrale Filterung von aktiven Inhalten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_3_2_Firewall.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.3.2.A29', 'NET - Netze und Kommunikation', 'NET.3.2 Firewall', 'NET.3.2.A29 Einsatz von Hochverfügbarkeitslösungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_3_2_Firewall.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.3.2.A3', 'NET - Netze und Kommunikation', 'NET.3.2 Firewall', 'NET.3.2.A3 Einrichten geeigneter Filterregeln am Paketfilter', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_3_2_Firewall.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.3.2.A30', 'NET - Netze und Kommunikation', 'NET.3.2 Firewall', 'NET.3.2.A30 Bandbreitenmanagement für kritische Anwendungen und Dienste', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_3_2_Firewall.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.3.2.A31', 'NET - Netze und Kommunikation', 'NET.3.2 Firewall', 'NET.3.2.A31 Einsatz von zertifizierten Produkten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_3_2_Firewall.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.3.2.A4', 'NET - Netze und Kommunikation', 'NET.3.2 Firewall', 'NET.3.2.A4 Sichere Konfiguration der Firewall', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_3_2_Firewall.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.3.2.A5', 'NET - Netze und Kommunikation', 'NET.3.2 Firewall', 'NET.3.2.A5 Restriktive Rechtevergabe', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_3_2_Firewall.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.3.2.A6', 'NET - Netze und Kommunikation', 'NET.3.2 Firewall', 'NET.3.2.A6 Schutz der Administrationsschnittstellen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_3_2_Firewall.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.3.2.A7', 'NET - Netze und Kommunikation', 'NET.3.2 Firewall', 'NET.3.2.A7 Notfallzugriff auf die Firewall', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_3_2_Firewall.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.3.2.A8', 'NET - Netze und Kommunikation', 'NET.3.2 Firewall', 'NET.3.2.A8 Unterbindung von dynamischem Routing', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_3_2_Firewall.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.3.2.A9', 'NET - Netze und Kommunikation', 'NET.3.2 Firewall', 'NET.3.2.A9 Protokollierung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_3_2_Firewall.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.3.3.A1', 'NET - Netze und Kommunikation', 'NET.3.3 VPN', 'NET.3.3.A1 Planung des VPN-Einsatzes', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_3_3_VPN.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.3.3.A10', 'NET - Netze und Kommunikation', 'NET.3.3 VPN', 'NET.3.3.A10 Sicherer Betrieb eines VPN', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_3_3_VPN.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.3.3.A11', 'NET - Netze und Kommunikation', 'NET.3.3 VPN', 'NET.3.3.A11 Sichere Anbindung eines externen Netzes', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_3_3_VPN.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.3.3.A12', 'NET - Netze und Kommunikation', 'NET.3.3 VPN', 'NET.3.3.A12 Benutzer- und Zugriffsverwaltung bei Fernzugriff-VPNs', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_3_3_VPN.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.3.3.A13', 'NET - Netze und Kommunikation', 'NET.3.3 VPN', 'NET.3.3.A13 Integration von VPN-Komponenten in eine Firewall', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_3_3_VPN.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.3.3.A2', 'NET - Netze und Kommunikation', 'NET.3.3 VPN', 'NET.3.3.A2 Auswahl eines VPN-Dienstleisters', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_3_3_VPN.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.3.3.A3', 'NET - Netze und Kommunikation', 'NET.3.3 VPN', 'NET.3.3.A3 Sichere Installation von VPN-Endgeräten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_3_3_VPN.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.3.3.A4', 'NET - Netze und Kommunikation', 'NET.3.3 VPN', 'NET.3.3.A4 Sichere Konfiguration eines VPN', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_3_3_VPN.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.3.3.A5', 'NET - Netze und Kommunikation', 'NET.3.3 VPN', 'NET.3.3.A5 Sperrung nicht mehr benötigter VPN-Zugänge', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_3_3_VPN.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.3.3.A6', 'NET - Netze und Kommunikation', 'NET.3.3 VPN', 'NET.3.3.A6 Durchführung einer VPN-Anforderungsanalyse', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_3_3_VPN.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.3.3.A7', 'NET - Netze und Kommunikation', 'NET.3.3 VPN', 'NET.3.3.A7 Planung der technischen VPN-Realisierung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_3_3_VPN.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.3.3.A8', 'NET - Netze und Kommunikation', 'NET.3.3 VPN', 'NET.3.3.A8 Erstellung einer Sicherheitsrichtlinie zur VPN-Nutzung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_3_3_VPN.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.3.3.A9', 'NET - Netze und Kommunikation', 'NET.3.3 VPN', 'NET.3.3.A9 Geeignete Auswahl von VPN-Produkten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_3_3_VPN.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.4.1.A1', 'NET - Netze und Kommunikation', 'NET.4.1 TK-Anlagen', 'NET.4.1.A1 Anforderungsanalyse und Planung für TK-Anlagen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_4_1_TK-Anlagen.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.4.1.A10', 'NET - Netze und Kommunikation', 'NET.4.1 TK-Anlagen', 'NET.4.1.A10 Dokumentation und Revision der TK-Anlagenkonfiguration', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_4_1_TK-Anlagen.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.4.1.A11', 'NET - Netze und Kommunikation', 'NET.4.1 TK-Anlagen', 'NET.4.1.A11 Außerbetriebnahme von TK-Anlagen und -geräten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_4_1_TK-Anlagen.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.4.1.A12', 'NET - Netze und Kommunikation', 'NET.4.1 TK-Anlagen', 'NET.4.1.A12 Datensicherung der Konfigurationsdateien', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_4_1_TK-Anlagen.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.4.1.A13', 'NET - Netze und Kommunikation', 'NET.4.1 TK-Anlagen', 'NET.4.1.A13 Beschaffung von TK-Anlagen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_4_1_TK-Anlagen.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.4.1.A14', 'NET - Netze und Kommunikation', 'NET.4.1 TK-Anlagen', 'NET.4.1.A14 Notfallvorsorge für TK-Anlagen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_4_1_TK-Anlagen.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.4.1.A15', 'NET - Netze und Kommunikation', 'NET.4.1 TK-Anlagen', 'NET.4.1.A15 Notrufe bei einem Ausfall der TK-Anlage', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_4_1_TK-Anlagen.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.4.1.A16', 'NET - Netze und Kommunikation', 'NET.4.1 TK-Anlagen', 'NET.4.1.A16 Sicherung von Telefonie-Endgeräten in frei zugänglichen Räumen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_4_1_TK-Anlagen.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.4.1.A17', 'NET - Netze und Kommunikation', 'NET.4.1 TK-Anlagen', 'NET.4.1.A17 Wartung von TK-Anlagen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_4_1_TK-Anlagen.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.4.1.A18', 'NET - Netze und Kommunikation', 'NET.4.1 TK-Anlagen', 'NET.4.1.A18 Erhöhter Zugangsschutz', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_4_1_TK-Anlagen.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.4.1.A19', 'NET - Netze und Kommunikation', 'NET.4.1 TK-Anlagen', 'NET.4.1.A19 Redundanter Anschluss', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_4_1_TK-Anlagen.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.4.1.A2', 'NET - Netze und Kommunikation', 'NET.4.1 TK-Anlagen', 'NET.4.1.A2 Auswahl von TK-Diensteanbietern', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_4_1_TK-Anlagen.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.4.1.A3', 'NET - Netze und Kommunikation', 'NET.4.1 TK-Anlagen', 'NET.4.1.A3 Änderung voreingestellter Passwörter', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_4_1_TK-Anlagen.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.4.1.A4', 'NET - Netze und Kommunikation', 'NET.4.1 TK-Anlagen', 'NET.4.1.A4 Absicherung von Remote-Zugängen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_4_1_TK-Anlagen.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.4.1.A5', 'NET - Netze und Kommunikation', 'NET.4.1 TK-Anlagen', 'NET.4.1.A5 Protokollierung bei TK-Anlagen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_4_1_TK-Anlagen.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.4.1.A6', 'NET - Netze und Kommunikation', 'NET.4.1 TK-Anlagen', 'NET.4.1.A6 Erstellung einer Sicherheitsrichtlinie für TK-Anlagen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_4_1_TK-Anlagen.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.4.1.A7', 'NET - Netze und Kommunikation', 'NET.4.1 TK-Anlagen', 'NET.4.1.A7 Aufstellung der TK-Anlage', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_4_1_TK-Anlagen.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.4.1.A8', 'NET - Netze und Kommunikation', 'NET.4.1 TK-Anlagen', 'NET.4.1.A8 Einschränkung und Sperrung nicht benötigter oder sicherheitskritischer Leistungsmerkmale', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_4_1_TK-Anlagen.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.4.1.A9', 'NET - Netze und Kommunikation', 'NET.4.1 TK-Anlagen', 'NET.4.1.A9 Schulung zur sicheren Nutzung von TK-Anlagen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_4_1_TK-Anlagen.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.4.2.A1', 'NET - Netze und Kommunikation', 'NET.4.2 VoIP', 'NET.4.2.A1 Planung des VoIP-Einsatzes', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_4_2_VoIP.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.4.2.A10', 'NET - Netze und Kommunikation', 'NET.4.2 VoIP', 'NET.4.2.A10 Schulung der Administratoren für die Nutzung von VoIP', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_4_2_VoIP.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.4.2.A11', 'NET - Netze und Kommunikation', 'NET.4.2 VoIP', 'NET.4.2.A11 Sicherer Umgang mit VoIP-Endgeräten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_4_2_VoIP.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.4.2.A12', 'NET - Netze und Kommunikation', 'NET.4.2 VoIP', 'NET.4.2.A12 Sichere Außerbetriebnahme von VoIP-Komponenten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_4_2_VoIP.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.4.2.A13', 'NET - Netze und Kommunikation', 'NET.4.2 VoIP', 'NET.4.2.A13 Anforderungen an eine Firewall für den Einsatz von VoIP', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_4_2_VoIP.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.4.2.A14', 'NET - Netze und Kommunikation', 'NET.4.2 VoIP', 'NET.4.2.A14 Verschlüsselung der Signalisierung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_4_2_VoIP.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.4.2.A15', 'NET - Netze und Kommunikation', 'NET.4.2 VoIP', 'NET.4.2.A15 Sicherer Medientransport mit SRTP', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_4_2_VoIP.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.4.2.A16', 'NET - Netze und Kommunikation', 'NET.4.2 VoIP', 'NET.4.2.A16 Trennung des Daten- und VoIP-Netzes', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_4_2_VoIP.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.4.2.A2', 'NET - Netze und Kommunikation', 'NET.4.2 VoIP', 'NET.4.2.A2 Sichere Administration der VoIP-Middleware', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_4_2_VoIP.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.4.2.A3', 'NET - Netze und Kommunikation', 'NET.4.2 VoIP', 'NET.4.2.A3 Sichere Administration und Konfiguration von VoIP-Endgeräten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_4_2_VoIP.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.4.2.A4', 'NET - Netze und Kommunikation', 'NET.4.2 VoIP', 'NET.4.2.A4 Einschränkung der Erreichbarkeit über VoIP', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_4_2_VoIP.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.4.2.A5', 'NET - Netze und Kommunikation', 'NET.4.2 VoIP', 'NET.4.2.A5 Sichere Konfiguration der VoIP-Middleware', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_4_2_VoIP.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.4.2.A6', 'NET - Netze und Kommunikation', 'NET.4.2 VoIP', 'NET.4.2.A6 Protokollierung bei VoIP', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_4_2_VoIP.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.4.2.A7', 'NET - Netze und Kommunikation', 'NET.4.2 VoIP', 'NET.4.2.A7 Erstellung einer Sicherheitsrichtlinie für VoIP', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_4_2_VoIP.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.4.2.A8', 'NET - Netze und Kommunikation', 'NET.4.2 VoIP', 'NET.4.2.A8 Verschlüsselung von VoIP', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_4_2_VoIP.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.4.2.A9', 'NET - Netze und Kommunikation', 'NET.4.2 VoIP', 'NET.4.2.A9 Geeignete Auswahl von VoIP-Komponenten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_4_2_VoIP.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.4.3.A1', 'NET - Netze und Kommunikation', 'NET.4.3 Faxgeräte und Faxserver', 'NET.4.3.A1 Geeignete Aufstellung eines Faxgerätes', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_4_3_Faxgeräte_und_Faxserver.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.4.3.A10', 'NET - Netze und Kommunikation', 'NET.4.3 Faxgeräte und Faxserver', 'NET.4.3.A10 Kontrolle programmierbarer Zieladressen, Protokolle und Verteilerlisten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_4_3_Faxgeräte_und_Faxserver.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.4.3.A11', 'NET - Netze und Kommunikation', 'NET.4.3 Faxgeräte und Faxserver', 'NET.4.3.A11 Schutz vor Überlastung des Faxgerätes', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_4_3_Faxgeräte_und_Faxserver.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.4.3.A12', 'NET - Netze und Kommunikation', 'NET.4.3 Faxgeräte und Faxserver', 'NET.4.3.A12 Sperren bestimmter Empfänger- und Absender-Faxnummern', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_4_3_Faxgeräte_und_Faxserver.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.4.3.A13', 'NET - Netze und Kommunikation', 'NET.4.3 Faxgeräte und Faxserver', 'NET.4.3.A13 Festlegung berechtigter Faxbediener', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_4_3_Faxgeräte_und_Faxserver.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.4.3.A14', 'NET - Netze und Kommunikation', 'NET.4.3 Faxgeräte und Faxserver', 'NET.4.3.A14 Fertigung von Kopien eingehender Faxsendungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_4_3_Faxgeräte_und_Faxserver.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.4.3.A15', 'NET - Netze und Kommunikation', 'NET.4.3 Faxgeräte und Faxserver', 'NET.4.3.A15 Ankündigung und Rückversicherung im Umgang mit Faxsendungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_4_3_Faxgeräte_und_Faxserver.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.4.3.A2', 'NET - Netze und Kommunikation', 'NET.4.3 Faxgeräte und Faxserver', 'NET.4.3.A2 Informationen für Mitarbeiter über die Faxnutzung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_4_3_Faxgeräte_und_Faxserver.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.4.3.A3', 'NET - Netze und Kommunikation', 'NET.4.3 Faxgeräte und Faxserver', 'NET.4.3.A3 Sicherer Betrieb eines Faxservers', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_4_3_Faxgeräte_und_Faxserver.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.4.3.A4', 'NET - Netze und Kommunikation', 'NET.4.3 Faxgeräte und Faxserver', 'NET.4.3.A4 Erstellung einer Sicherheitsrichtlinie für die Faxnutzung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_4_3_Faxgeräte_und_Faxserver.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.4.3.A5', 'NET - Netze und Kommunikation', 'NET.4.3 Faxgeräte und Faxserver', 'NET.4.3.A5 ENTFALLEN', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_4_3_Faxgeräte_und_Faxserver.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.4.3.A6', 'NET - Netze und Kommunikation', 'NET.4.3 Faxgeräte und Faxserver', 'NET.4.3.A6 Beschaffung geeigneter Faxgeräte und Faxserver', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_4_3_Faxgeräte_und_Faxserver.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.4.3.A7', 'NET - Netze und Kommunikation', 'NET.4.3 Faxgeräte und Faxserver', 'NET.4.3.A7 Geeignete Kennzeichnung ausgehender Faxsendungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_4_3_Faxgeräte_und_Faxserver.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.4.3.A8', 'NET - Netze und Kommunikation', 'NET.4.3 Faxgeräte und Faxserver', 'NET.4.3.A8 Geeignete Entsorgung von Fax-Verbrauchsgütern und -Ersatzteilen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_4_3_Faxgeräte_und_Faxserver.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('NET.4.3.A9', 'NET - Netze und Kommunikation', 'NET.4.3 Faxgeräte und Faxserver', 'NET.4.3.A9 Nutzung von Sende- und Empfangsprotokollen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/NET/NET_4_3_Faxgeräte_und_Faxserver.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.1.2.A1', 'OPS - Betrieb', 'OPS.1.1.2 Ordnungsgemäße IT-Administration', 'OPS.1.1.2.A1 Personalauswahl für administrative Tätigkeiten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_1_2_Ordnungsgemäße_IT-Administration.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.1.2.A10', 'OPS - Betrieb', 'OPS.1.1.2 Ordnungsgemäße IT-Administration', 'OPS.1.1.2.A10 Fortbildung und Information', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_1_2_Ordnungsgemäße_IT-Administration.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.1.2.A11', 'OPS - Betrieb', 'OPS.1.1.2 Ordnungsgemäße IT-Administration', 'OPS.1.1.2.A11 Dokumentation von IT-Administrationstätigkeiten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_1_2_Ordnungsgemäße_IT-Administration.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.1.2.A12', 'OPS - Betrieb', 'OPS.1.1.2 Ordnungsgemäße IT-Administration', 'OPS.1.1.2.A12 Regelungen für Wartungs- und Reparaturarbeiten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_1_2_Ordnungsgemäße_IT-Administration.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.1.2.A13', 'OPS - Betrieb', 'OPS.1.1.2 Ordnungsgemäße IT-Administration', 'OPS.1.1.2.A13 ENTFALLEN', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_1_2_Ordnungsgemäße_IT-Administration.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.1.2.A14', 'OPS - Betrieb', 'OPS.1.1.2 Ordnungsgemäße IT-Administration', 'OPS.1.1.2.A14 Sicherheitsüberprüfung von Administratoren', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_1_2_Ordnungsgemäße_IT-Administration.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.1.2.A15', 'OPS - Betrieb', 'OPS.1.1.2 Ordnungsgemäße IT-Administration', 'OPS.1.1.2.A15 Aufteilung von Administrationstätigkeiten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_1_2_Ordnungsgemäße_IT-Administration.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.1.2.A16', 'OPS - Betrieb', 'OPS.1.1.2 Ordnungsgemäße IT-Administration', 'OPS.1.1.2.A16 Zugangsbeschränkungen für administrative Zugänge', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_1_2_Ordnungsgemäße_IT-Administration.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.1.2.A17', 'OPS - Betrieb', 'OPS.1.1.2 Ordnungsgemäße IT-Administration', 'OPS.1.1.2.A17 IT-Administration im Vier-Augen-Prinzip', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_1_2_Ordnungsgemäße_IT-Administration.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.1.2.A18', 'OPS - Betrieb', 'OPS.1.1.2 Ordnungsgemäße IT-Administration', 'OPS.1.1.2.A18 Durchgängige Protokollierung administrativer Tätigkeiten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_1_2_Ordnungsgemäße_IT-Administration.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.1.2.A19', 'OPS - Betrieb', 'OPS.1.1.2 Ordnungsgemäße IT-Administration', 'OPS.1.1.2.A19 Berücksichtigung von Hochverfügbarkeitsanforderungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_1_2_Ordnungsgemäße_IT-Administration.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.1.2.A2', 'OPS - Betrieb', 'OPS.1.1.2 Ordnungsgemäße IT-Administration', 'OPS.1.1.2.A2 Vertretungsregelungen und Notfallvorsorge', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_1_2_Ordnungsgemäße_IT-Administration.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.1.2.A3', 'OPS - Betrieb', 'OPS.1.1.2 Ordnungsgemäße IT-Administration', 'OPS.1.1.2.A3 Geregelte Einstellung von IT-Administratoren', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_1_2_Ordnungsgemäße_IT-Administration.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.1.2.A4', 'OPS - Betrieb', 'OPS.1.1.2 Ordnungsgemäße IT-Administration', 'OPS.1.1.2.A4 Beendigung der Tätigkeit als IT-Administrator', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_1_2_Ordnungsgemäße_IT-Administration.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.1.2.A5', 'OPS - Betrieb', 'OPS.1.1.2 Ordnungsgemäße IT-Administration', 'OPS.1.1.2.A5 Nachweisbarkeit von administrativen Tätigkeiten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_1_2_Ordnungsgemäße_IT-Administration.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.1.2.A6', 'OPS - Betrieb', 'OPS.1.1.2 Ordnungsgemäße IT-Administration', 'OPS.1.1.2.A6 Schutz administrativer Tätigkeiten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_1_2_Ordnungsgemäße_IT-Administration.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.1.2.A7', 'OPS - Betrieb', 'OPS.1.1.2 Ordnungsgemäße IT-Administration', 'OPS.1.1.2.A7 Regelung der IT-Administrationstätigkeit', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_1_2_Ordnungsgemäße_IT-Administration.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.1.2.A8', 'OPS - Betrieb', 'OPS.1.1.2 Ordnungsgemäße IT-Administration', 'OPS.1.1.2.A8 Administration von Fachanwendungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_1_2_Ordnungsgemäße_IT-Administration.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.1.2.A9', 'OPS - Betrieb', 'OPS.1.1.2 Ordnungsgemäße IT-Administration', 'OPS.1.1.2.A9 Ausreichende Ressourcen für den IT-Betrieb', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_1_2_Ordnungsgemäße_IT-Administration.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.1.3.A1', 'OPS - Betrieb', 'OPS.1.1.3 Patch- und Änderungsmanagement', 'OPS.1.1.3.A1 Konzept für das Patch- und Änderungsmanagement', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_1_3_Patch-_und_Änderungsmanagement.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.1.3.A10', 'OPS - Betrieb', 'OPS.1.1.3 Patch- und Änderungsmanagement', 'OPS.1.1.3.A10 Sicherstellung der Integrität und Authentizität von Softwarepaketen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_1_3_Patch-_und_Änderungsmanagement.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.1.3.A11', 'OPS - Betrieb', 'OPS.1.1.3 Patch- und Änderungsmanagement', 'OPS.1.1.3.A11 Kontinuierliche Dokumentation der Informationsverarbeitung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_1_3_Patch-_und_Änderungsmanagement.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.1.3.A12', 'OPS - Betrieb', 'OPS.1.1.3 Patch- und Änderungsmanagement', 'OPS.1.1.3.A12 Skalierbarkeit beim Änderungsmanagement', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_1_3_Patch-_und_Änderungsmanagement.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.1.3.A13', 'OPS - Betrieb', 'OPS.1.1.3 Patch- und Änderungsmanagement', 'OPS.1.1.3.A13 Erfolgsmessung von Änderungsanforderungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_1_3_Patch-_und_Änderungsmanagement.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.1.3.A14', 'OPS - Betrieb', 'OPS.1.1.3 Patch- und Änderungsmanagement', 'OPS.1.1.3.A14 Synchronisierung innerhalb des Änderungsmanagements', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_1_3_Patch-_und_Änderungsmanagement.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.1.3.A2', 'OPS - Betrieb', 'OPS.1.1.3 Patch- und Änderungsmanagement', 'OPS.1.1.3.A2 Festlegung der Verantwortlichkeiten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_1_3_Patch-_und_Änderungsmanagement.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.1.3.A3', 'OPS - Betrieb', 'OPS.1.1.3 Patch- und Änderungsmanagement', 'OPS.1.1.3.A3 Konfiguration von Autoupdate-Mechanismen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_1_3_Patch-_und_Änderungsmanagement.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.1.3.A4', 'OPS - Betrieb', 'OPS.1.1.3 Patch- und Änderungsmanagement', 'OPS.1.1.3.A4 Planung des Änderungsmanagementprozesses', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_1_3_Patch-_und_Änderungsmanagement.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.1.3.A5', 'OPS - Betrieb', 'OPS.1.1.3 Patch- und Änderungsmanagement', 'OPS.1.1.3.A5 Umgang mit Änderungsanforderungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_1_3_Patch-_und_Änderungsmanagement.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.1.3.A6', 'OPS - Betrieb', 'OPS.1.1.3 Patch- und Änderungsmanagement', 'OPS.1.1.3.A6 Abstimmung von Änderungsanforderungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_1_3_Patch-_und_Änderungsmanagement.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.1.3.A7', 'OPS - Betrieb', 'OPS.1.1.3 Patch- und Änderungsmanagement', 'OPS.1.1.3.A7 Integration des Änderungsmanagements in die Geschäftsprozesse', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_1_3_Patch-_und_Änderungsmanagement.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.1.3.A8', 'OPS - Betrieb', 'OPS.1.1.3 Patch- und Änderungsmanagement', 'OPS.1.1.3.A8 Sicherer Einsatz von Werkzeugen für das Patch- und Änderungsmanagement', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_1_3_Patch-_und_Änderungsmanagement.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.1.3.A9', 'OPS - Betrieb', 'OPS.1.1.3 Patch- und Änderungsmanagement', 'OPS.1.1.3.A9 Test- und Abnahmeverfahren für neue Hard- und Software', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_1_3_Patch-_und_Änderungsmanagement.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.1.4.A1', 'OPS - Betrieb', 'OPS.1.1.4 Schutz vor Schadprogrammen', 'OPS.1.1.4.A1 Erstellung eines Konzepts für den Schutz vor Schadprogrammen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_1_4_Schutz_vor_Schadprogrammen.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.1.4.A10', 'OPS - Betrieb', 'OPS.1.1.4 Schutz vor Schadprogrammen', 'OPS.1.1.4.A10 Nutzung spezieller Analyseumgebungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_1_4_Schutz_vor_Schadprogrammen.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.1.4.A11', 'OPS - Betrieb', 'OPS.1.1.4 Schutz vor Schadprogrammen', 'OPS.1.1.4.A11 Einsatz mehrerer Scan-Engines', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_1_4_Schutz_vor_Schadprogrammen.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.1.4.A12', 'OPS - Betrieb', 'OPS.1.1.4 Schutz vor Schadprogrammen', 'OPS.1.1.4.A12 Einsatz von Datenträgerschleusen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_1_4_Schutz_vor_Schadprogrammen.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.1.4.A13', 'OPS - Betrieb', 'OPS.1.1.4 Schutz vor Schadprogrammen', 'OPS.1.1.4.A13 Umgang mit nicht vertrauenswürdigen Dateien', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_1_4_Schutz_vor_Schadprogrammen.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.1.4.A14', 'OPS - Betrieb', 'OPS.1.1.4 Schutz vor Schadprogrammen', 'OPS.1.1.4.A14 Auswahl und Einsatz von Cyber-Sicherheitsprodukten gegen gezielte Angriffe', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_1_4_Schutz_vor_Schadprogrammen.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.1.4.A15', 'OPS - Betrieb', 'OPS.1.1.4 Schutz vor Schadprogrammen', 'OPS.1.1.4.A15 Externe Beratung zum Schutz vor Schadprogrammen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_1_4_Schutz_vor_Schadprogrammen.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.1.4.A2', 'OPS - Betrieb', 'OPS.1.1.4 Schutz vor Schadprogrammen', 'OPS.1.1.4.A2 Nutzung systemspezifischer Schutzmechanismen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_1_4_Schutz_vor_Schadprogrammen.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.1.4.A3', 'OPS - Betrieb', 'OPS.1.1.4 Schutz vor Schadprogrammen', 'OPS.1.1.4.A3 Auswahl eines Virenschutzprogrammes für Endgeräte', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_1_4_Schutz_vor_Schadprogrammen.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.1.4.A4', 'OPS - Betrieb', 'OPS.1.1.4 Schutz vor Schadprogrammen', 'OPS.1.1.4.A4 Auswahl eines Virenschutzprogrammes für Gateways und IT-Systeme zum Datenaustausch', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_1_4_Schutz_vor_Schadprogrammen.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.1.4.A5', 'OPS - Betrieb', 'OPS.1.1.4 Schutz vor Schadprogrammen', 'OPS.1.1.4.A5 Betrieb und Konfiguration von Virenschutzprogrammen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_1_4_Schutz_vor_Schadprogrammen.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.1.4.A6', 'OPS - Betrieb', 'OPS.1.1.4 Schutz vor Schadprogrammen', 'OPS.1.1.4.A6 Regelmäßige Aktualisierung der eingesetzten Virenschutzprogramme und Signaturen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_1_4_Schutz_vor_Schadprogrammen.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.1.4.A7', 'OPS - Betrieb', 'OPS.1.1.4 Schutz vor Schadprogrammen', 'OPS.1.1.4.A7 Sensibilisierung und Verpflichtung der Benutzer', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_1_4_Schutz_vor_Schadprogrammen.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.1.4.A8', 'OPS - Betrieb', 'OPS.1.1.4 Schutz vor Schadprogrammen', 'OPS.1.1.4.A8 Nutzung von Cloud-Diensten zur Detektionsverbesserung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_1_4_Schutz_vor_Schadprogrammen.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.1.4.A9', 'OPS - Betrieb', 'OPS.1.1.4 Schutz vor Schadprogrammen', 'OPS.1.1.4.A9 Meldung von Infektionen mit Schadprogrammen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_1_4_Schutz_vor_Schadprogrammen.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.1.5.A1', 'OPS - Betrieb', 'OPS.1.1.5 Protokollierung', 'OPS.1.1.5.A1 Erstellung einer Sicherheitsrichtlinie für die Protokollierung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_1_5_Protokollierung.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.1.5.A10', 'OPS - Betrieb', 'OPS.1.1.5 Protokollierung', 'OPS.1.1.5.A10 Zugriffsschutz für Protokollierungsdaten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_1_5_Protokollierung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.1.5.A11', 'OPS - Betrieb', 'OPS.1.1.5 Protokollierung', 'OPS.1.1.5.A11 Steigerung des Protokollierungsumfangs', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_1_5_Protokollierung.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.1.5.A12', 'OPS - Betrieb', 'OPS.1.1.5 Protokollierung', 'OPS.1.1.5.A12 Verschlüsselung der Protokollierungsdaten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_1_5_Protokollierung.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.1.5.A13', 'OPS - Betrieb', 'OPS.1.1.5 Protokollierung', 'OPS.1.1.5.A13 Hochverfügbare Protokollierungssysteme', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_1_5_Protokollierung.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.1.5.A2', 'OPS - Betrieb', 'OPS.1.1.5 Protokollierung', 'OPS.1.1.5.A2 Festlegung von Rollen und Verantwortlichkeiten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_1_5_Protokollierung.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.1.5.A3', 'OPS - Betrieb', 'OPS.1.1.5 Protokollierung', 'OPS.1.1.5.A3 Konfiguration der Protokollierung auf System- und Netzebene', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_1_5_Protokollierung.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.1.5.A4', 'OPS - Betrieb', 'OPS.1.1.5 Protokollierung', 'OPS.1.1.5.A4 Zeitsynchronisation der IT-Systeme', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_1_5_Protokollierung.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.1.5.A5', 'OPS - Betrieb', 'OPS.1.1.5 Protokollierung', 'OPS.1.1.5.A5 Einhaltung rechtlicher Rahmenbedingungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_1_5_Protokollierung.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.1.5.A6', 'OPS - Betrieb', 'OPS.1.1.5 Protokollierung', 'OPS.1.1.5.A6 Aufbau einer zentralen Protokollierungsinfrastruktur', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_1_5_Protokollierung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.1.5.A7', 'OPS - Betrieb', 'OPS.1.1.5 Protokollierung', 'OPS.1.1.5.A7 Sichere Administration von Protokollierungsservern', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_1_5_Protokollierung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.1.5.A8', 'OPS - Betrieb', 'OPS.1.1.5 Protokollierung', 'OPS.1.1.5.A8 Archivierung von Protokollierungsdaten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_1_5_Protokollierung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.1.5.A9', 'OPS - Betrieb', 'OPS.1.1.5 Protokollierung', 'OPS.1.1.5.A9 Bereitstellung von Protokollierungsdaten für die Auswertung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_1_5_Protokollierung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.1.6.A1', 'OPS - Betrieb', 'OPS.1.1.6 Software-Tests und -Freigaben', 'OPS.1.1.6.A1 Planung der Software-Tests', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_1_6_Software-Tests_und_-Freigaben.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.1.6.A10', 'OPS - Betrieb', 'OPS.1.1.6 Software-Tests und -Freigaben', 'OPS.1.1.6.A10 Erstellung eines Abnahmeplans', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_1_6_Software-Tests_und_-Freigaben.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.1.6.A11', 'OPS - Betrieb', 'OPS.1.1.6 Software-Tests und -Freigaben', 'OPS.1.1.6.A11 Verwendung von anonymisierten oder pseudonymisierten Testdaten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_1_6_Software-Tests_und_-Freigaben.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.1.6.A12', 'OPS - Betrieb', 'OPS.1.1.6 Software-Tests und -Freigaben', 'OPS.1.1.6.A12 Durchführung von Regressionstests', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_1_6_Software-Tests_und_-Freigaben.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.1.6.A13', 'OPS - Betrieb', 'OPS.1.1.6 Software-Tests und -Freigaben', 'OPS.1.1.6.A13 Trennung von Test- und Qualitätsmanagement-Umgebung von der Produktivumgebung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_1_6_Software-Tests_und_-Freigaben.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.1.6.A14', 'OPS - Betrieb', 'OPS.1.1.6 Software-Tests und -Freigaben', 'OPS.1.1.6.A14 Durchführung von Penetrationstests', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_1_6_Software-Tests_und_-Freigaben.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.1.6.A2', 'OPS - Betrieb', 'OPS.1.1.6 Software-Tests und -Freigaben', 'OPS.1.1.6.A2 Durchführung von funktionalen Software-Tests', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_1_6_Software-Tests_und_-Freigaben.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.1.6.A3', 'OPS - Betrieb', 'OPS.1.1.6 Software-Tests und -Freigaben', 'OPS.1.1.6.A3 Auswertung der Testergebnisse', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_1_6_Software-Tests_und_-Freigaben.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.1.6.A4', 'OPS - Betrieb', 'OPS.1.1.6 Software-Tests und -Freigaben', 'OPS.1.1.6.A4 Freigabe der Software', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_1_6_Software-Tests_und_-Freigaben.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.1.6.A5', 'OPS - Betrieb', 'OPS.1.1.6 Software-Tests und -Freigaben', 'OPS.1.1.6.A5 Durchführung nicht-funktionaler Software-Tests', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_1_6_Software-Tests_und_-Freigaben.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.1.6.A6', 'OPS - Betrieb', 'OPS.1.1.6 Software-Tests und -Freigaben', 'OPS.1.1.6.A6 Geordnete Einweisung der Software-Tester', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_1_6_Software-Tests_und_-Freigaben.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.1.6.A7', 'OPS - Betrieb', 'OPS.1.1.6 Software-Tests und -Freigaben', 'OPS.1.1.6.A7 Personalauswahl der Software-Tester', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_1_6_Software-Tests_und_-Freigaben.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.1.6.A8', 'OPS - Betrieb', 'OPS.1.1.6 Software-Tests und -Freigaben', 'OPS.1.1.6.A8 Fort- und Weiterbildung der Software-Tester', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_1_6_Software-Tests_und_-Freigaben.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.1.6.A9', 'OPS - Betrieb', 'OPS.1.1.6 Software-Tests und -Freigaben', 'OPS.1.1.6.A9 Beschaffung von Test-Software', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_1_6_Software-Tests_und_-Freigaben.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.2.2.A1', 'OPS - Betrieb', 'OPS.1.2.2 Archivierung', 'OPS.1.2.2.A1 Ermittlung von Einflussfaktoren für die elektronische Archivierung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_2_2_Archivierung.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.2.2.A10', 'OPS - Betrieb', 'OPS.1.2.2 Archivierung', 'OPS.1.2.2.A10 Erstellung einer Richtlinie für die Nutzung von Archivsystemen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_2_2_Archivierung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.2.2.A11', 'OPS - Betrieb', 'OPS.1.2.2 Archivierung', 'OPS.1.2.2.A11 Einweisung in die Administration und Bedienung des Archivsystems', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_2_2_Archivierung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.2.2.A12', 'OPS - Betrieb', 'OPS.1.2.2 Archivierung', 'OPS.1.2.2.A12 Überwachung der Speicherressourcen von Archivmedien', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_2_2_Archivierung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.2.2.A13', 'OPS - Betrieb', 'OPS.1.2.2 Archivierung', 'OPS.1.2.2.A13 Regelmäßige Revision der Archivierungsprozesse', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_2_2_Archivierung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.2.2.A14', 'OPS - Betrieb', 'OPS.1.2.2 Archivierung', 'OPS.1.2.2.A14 Regelmäßige Beobachtung des Marktes für Archivsysteme', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_2_2_Archivierung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.2.2.A15', 'OPS - Betrieb', 'OPS.1.2.2 Archivierung', 'OPS.1.2.2.A15 Regelmäßige Aufbereitung von kryptografisch gesicherten Daten bei der Archivierung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_2_2_Archivierung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.2.2.A16', 'OPS - Betrieb', 'OPS.1.2.2 Archivierung', 'OPS.1.2.2.A16 Regelmäßige Erneuerung technischer Archivsystem-Komponenten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_2_2_Archivierung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.2.2.A17', 'OPS - Betrieb', 'OPS.1.2.2 Archivierung', 'OPS.1.2.2.A17 Auswahl eines geeigneten Archivsystems', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_2_2_Archivierung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.2.2.A18', 'OPS - Betrieb', 'OPS.1.2.2 Archivierung', 'OPS.1.2.2.A18 Verwendung geeigneter Archivmedien', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_2_2_Archivierung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.2.2.A19', 'OPS - Betrieb', 'OPS.1.2.2 Archivierung', 'OPS.1.2.2.A19 Regelmäßige Funktions- und Recoverytests bei der Archivierung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_2_2_Archivierung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.2.2.A2', 'OPS - Betrieb', 'OPS.1.2.2 Archivierung', 'OPS.1.2.2.A2 Entwicklung eines Archivierungskonzepts', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_2_2_Archivierung.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.2.2.A20', 'OPS - Betrieb', 'OPS.1.2.2 Archivierung', 'OPS.1.2.2.A20 Geeigneter Einsatz kryptografischer Verfahren bei der Archivierung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_2_2_Archivierung.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.2.2.A21', 'OPS - Betrieb', 'OPS.1.2.2 Archivierung', 'OPS.1.2.2.A21 Übertragung von Papierdaten in elektronische Archive', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_2_2_Archivierung.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.2.2.A3', 'OPS - Betrieb', 'OPS.1.2.2 Archivierung', 'OPS.1.2.2.A3 Geeignete Aufstellung von Archivsystemen und Lagerung von Archivmedien', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_2_2_Archivierung.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.2.2.A4', 'OPS - Betrieb', 'OPS.1.2.2 Archivierung', 'OPS.1.2.2.A4 Konsistente Indizierung von Daten bei der Archivierung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_2_2_Archivierung.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.2.2.A5', 'OPS - Betrieb', 'OPS.1.2.2 Archivierung', 'OPS.1.2.2.A5 Regelmäßige Aufbereitung von archivierten Datenbeständen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_2_2_Archivierung.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.2.2.A6', 'OPS - Betrieb', 'OPS.1.2.2 Archivierung', 'OPS.1.2.2.A6 Schutz der Integrität der Indexdatenbank von Archivsystemen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_2_2_Archivierung.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.2.2.A7', 'OPS - Betrieb', 'OPS.1.2.2 Archivierung', 'OPS.1.2.2.A7 Regelmäßige Datensicherung der System- und Archivdaten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_2_2_Archivierung.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.2.2.A8', 'OPS - Betrieb', 'OPS.1.2.2 Archivierung', 'OPS.1.2.2.A8 Protokollierung der Archivzugriffe', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_2_2_Archivierung.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.2.2.A9', 'OPS - Betrieb', 'OPS.1.2.2 Archivierung', 'OPS.1.2.2.A9 Auswahl geeigneter Datenformate für die Archivierung von Dokumenten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_2_2_Archivierung.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.2.4.A1', 'OPS - Betrieb', 'OPS.1.2.4 Telearbeit', 'OPS.1.2.4.A1 Regelungen für Telearbeit', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_2_4_Telearbeit.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.2.4.A10', 'OPS - Betrieb', 'OPS.1.2.4 Telearbeit', 'OPS.1.2.4.A10 Durchführung einer Anforderungsanalyse für den Telearbeitsplatz', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_2_4_Telearbeit.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.2.4.A2', 'OPS - Betrieb', 'OPS.1.2.4 Telearbeit', 'OPS.1.2.4.A2 Sicherheitstechnische Anforderungen an den Telearbeitsrechner', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_2_4_Telearbeit.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.2.4.A3', 'OPS - Betrieb', 'OPS.1.2.4 Telearbeit', 'OPS.1.2.4.A3 Sicherheitstechnische Anforderungen an die Kommunikationsverbindung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_2_4_Telearbeit.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.2.4.A4', 'OPS - Betrieb', 'OPS.1.2.4 Telearbeit', 'OPS.1.2.4.A4 Datensicherung bei der Telearbeit', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_2_4_Telearbeit.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.2.4.A5', 'OPS - Betrieb', 'OPS.1.2.4 Telearbeit', 'OPS.1.2.4.A5 Sensibilisierung und Schulung der Telearbeiter', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_2_4_Telearbeit.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.2.4.A6', 'OPS - Betrieb', 'OPS.1.2.4 Telearbeit', 'OPS.1.2.4.A6 Erstellen eines Sicherheitskonzeptes für Telearbeit', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_2_4_Telearbeit.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.2.4.A7', 'OPS - Betrieb', 'OPS.1.2.4 Telearbeit', 'OPS.1.2.4.A7 Regelung der Nutzung von Kommunikationsmöglichkeiten bei Telearbeit', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_2_4_Telearbeit.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.2.4.A8', 'OPS - Betrieb', 'OPS.1.2.4 Telearbeit', 'OPS.1.2.4.A8 Informationsfluss zwischen Telearbeiter und Institution', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_2_4_Telearbeit.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.2.4.A9', 'OPS - Betrieb', 'OPS.1.2.4 Telearbeit', 'OPS.1.2.4.A9 Betreuungs- und Wartungskonzept für Telearbeitsplätze', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_2_4_Telearbeit.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.2.5.A1', 'OPS - Betrieb', 'OPS.1.2.5 Fernwartung', 'OPS.1.2.5.A1 Planung des Einsatzes der Fernwartung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_2_5_Fernwartung.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.2.5.A10', 'OPS - Betrieb', 'OPS.1.2.5 Fernwartung', 'OPS.1.2.5.A10 Verwaltung der Fernwartungswerkzeuge', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_2_5_Fernwartung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.2.5.A11', 'OPS - Betrieb', 'OPS.1.2.5 Fernwartung', 'OPS.1.2.5.A11 ENTFALLEN', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_2_5_Fernwartung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.2.5.A12', 'OPS - Betrieb', 'OPS.1.2.5 Fernwartung', 'OPS.1.2.5.A12 ENTFALLEN', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_2_5_Fernwartung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.2.5.A13', 'OPS - Betrieb', 'OPS.1.2.5 Fernwartung', 'OPS.1.2.5.A13 ENTFALLEN', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_2_5_Fernwartung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.2.5.A14', 'OPS - Betrieb', 'OPS.1.2.5 Fernwartung', 'OPS.1.2.5.A14 Dedizierte Systeme bei der Fernwartung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_2_5_Fernwartung.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.2.5.A15', 'OPS - Betrieb', 'OPS.1.2.5 Fernwartung', 'OPS.1.2.5.A15 ENTFALLEN', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_2_5_Fernwartung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.2.5.A16', 'OPS - Betrieb', 'OPS.1.2.5 Fernwartung', 'OPS.1.2.5.A16 ENTFALLEN', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_2_5_Fernwartung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.2.5.A17', 'OPS - Betrieb', 'OPS.1.2.5 Fernwartung', 'OPS.1.2.5.A17 Authentisierungsmechanismen bei der Fernwartung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_2_5_Fernwartung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.2.5.A18', 'OPS - Betrieb', 'OPS.1.2.5 Fernwartung', 'OPS.1.2.5.A18 ENTFALLEN', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_2_5_Fernwartung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.2.5.A19', 'OPS - Betrieb', 'OPS.1.2.5 Fernwartung', 'OPS.1.2.5.A19 Fernwartung durch Dritte', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_2_5_Fernwartung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.2.5.A2', 'OPS - Betrieb', 'OPS.1.2.5 Fernwartung', 'OPS.1.2.5.A2 Sicherer Verbindungsaufbau bei der Fernwartung von Clients', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_2_5_Fernwartung.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.2.5.A20', 'OPS - Betrieb', 'OPS.1.2.5 Fernwartung', 'OPS.1.2.5.A20 Betrieb der Fernwartung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_2_5_Fernwartung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.2.5.A21', 'OPS - Betrieb', 'OPS.1.2.5 Fernwartung', 'OPS.1.2.5.A21 Erstellung eines Notfallplans für den Ausfall der Fernwartung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_2_5_Fernwartung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.2.5.A22', 'OPS - Betrieb', 'OPS.1.2.5 Fernwartung', 'OPS.1.2.5.A22 Redundante Kommunikationsverbindungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_2_5_Fernwartung.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.2.5.A23', 'OPS - Betrieb', 'OPS.1.2.5 Fernwartung', 'OPS.1.2.5.A23 ENTFALLEN', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_2_5_Fernwartung.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.2.5.A24', 'OPS - Betrieb', 'OPS.1.2.5 Fernwartung', 'OPS.1.2.5.A24 Absicherung integrierter Fernwartungssysteme', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_2_5_Fernwartung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.2.5.A3', 'OPS - Betrieb', 'OPS.1.2.5 Fernwartung', 'OPS.1.2.5.A3 Absicherung der Schnittstellen zur Fernwartung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_2_5_Fernwartung.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.2.5.A4', 'OPS - Betrieb', 'OPS.1.2.5 Fernwartung', 'OPS.1.2.5.A4 Regelungen zu Kommunikationsverbindungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_2_5_Fernwartung.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.2.5.A5', 'OPS - Betrieb', 'OPS.1.2.5 Fernwartung', 'OPS.1.2.5.A5 Einsatz von Online-Diensten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_2_5_Fernwartung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.2.5.A6', 'OPS - Betrieb', 'OPS.1.2.5 Fernwartung', 'OPS.1.2.5.A6 Erstellung einer Richtlinie für die Fernwartung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_2_5_Fernwartung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.2.5.A7', 'OPS - Betrieb', 'OPS.1.2.5 Fernwartung', 'OPS.1.2.5.A7 Dokumentation bei der Fernwartung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_2_5_Fernwartung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.2.5.A8', 'OPS - Betrieb', 'OPS.1.2.5 Fernwartung', 'OPS.1.2.5.A8 Sichere Protokolle bei der Fernwartung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_2_5_Fernwartung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.1.2.5.A9', 'OPS - Betrieb', 'OPS.1.2.5 Fernwartung', 'OPS.1.2.5.A9 Auswahl und Beschaffung geeigneter Fernwartungswerkzeuge', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_1_2_5_Fernwartung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.2.1.A1', 'OPS - Betrieb', 'OPS.2.1 Outsourcing für Kunden', 'OPS.2.1.A1 Festlegung der Sicherheitsanforderungen für Outsourcing-Vorhaben', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_2_1_Outsourcing_für_Kunden.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.2.1.A10', 'OPS - Betrieb', 'OPS.2.1 Outsourcing für Kunden', 'OPS.2.1.A10 Vereinbarung über Datenaustausch zwischen den Outsourcing-Partnern', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_2_1_Outsourcing_für_Kunden.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.2.1.A11', 'OPS - Betrieb', 'OPS.2.1 Outsourcing für Kunden', 'OPS.2.1.A11 Planung und Aufrechterhaltung der Informationssicherheit im laufenden Outsourcing-Betrieb', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_2_1_Outsourcing_für_Kunden.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.2.1.A12', 'OPS - Betrieb', 'OPS.2.1 Outsourcing für Kunden', 'OPS.2.1.A12 Änderungsmanagement', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_2_1_Outsourcing_für_Kunden.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.2.1.A13', 'OPS - Betrieb', 'OPS.2.1 Outsourcing für Kunden', 'OPS.2.1.A13 Sichere Migration bei Outsourcing-Vorhaben', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_2_1_Outsourcing_für_Kunden.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.2.1.A14', 'OPS - Betrieb', 'OPS.2.1 Outsourcing für Kunden', 'OPS.2.1.A14 Notfallvorsorge beim Outsourcing', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_2_1_Outsourcing_für_Kunden.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.2.1.A15', 'OPS - Betrieb', 'OPS.2.1 Outsourcing für Kunden', 'OPS.2.1.A15 Geordnete Beendigung eines Outsourcing-Verhältnisses', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_2_1_Outsourcing_für_Kunden.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.2.1.A16', 'OPS - Betrieb', 'OPS.2.1 Outsourcing für Kunden', 'OPS.2.1.A16 Sicherheitsüberprüfung von Mitarbeitern', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_2_1_Outsourcing_für_Kunden.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.2.1.A2', 'OPS - Betrieb', 'OPS.2.1 Outsourcing für Kunden', 'OPS.2.1.A2 Rechtzeitige Beteiligung der Personalvertretung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_2_1_Outsourcing_für_Kunden.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.2.1.A3', 'OPS - Betrieb', 'OPS.2.1 Outsourcing für Kunden', 'OPS.2.1.A3 Auswahl eines geeigneten Outsourcing-Dienstleisters', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_2_1_Outsourcing_für_Kunden.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.2.1.A4', 'OPS - Betrieb', 'OPS.2.1 Outsourcing für Kunden', 'OPS.2.1.A4 Vertragsgestaltung mit dem Outsourcing-Dienstleister', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_2_1_Outsourcing_für_Kunden.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.2.1.A5', 'OPS - Betrieb', 'OPS.2.1 Outsourcing für Kunden', 'OPS.2.1.A5 Festlegung einer Strategie zum Outsourcing', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_2_1_Outsourcing_für_Kunden.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.2.1.A6', 'OPS - Betrieb', 'OPS.2.1 Outsourcing für Kunden', 'OPS.2.1.A6 Erstellung eines Sicherheitskonzepts für das Outsourcing-Vorhaben', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_2_1_Outsourcing_für_Kunden.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.2.1.A7', 'OPS - Betrieb', 'OPS.2.1 Outsourcing für Kunden', 'OPS.2.1.A7 Festlegung der möglichen Kommunikationspartner', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_2_1_Outsourcing_für_Kunden.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.2.1.A8', 'OPS - Betrieb', 'OPS.2.1 Outsourcing für Kunden', 'OPS.2.1.A8 Regelungen für den Einsatz des Personals des Outsourcing-Dienstleiters', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_2_1_Outsourcing_für_Kunden.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.2.1.A9', 'OPS - Betrieb', 'OPS.2.1 Outsourcing für Kunden', 'OPS.2.1.A9 Vereinbarung über die Anbindung an Netze der Outsourcing-Partner', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_2_1_Outsourcing_für_Kunden.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.2.2.A1', 'OPS - Betrieb', 'OPS.2.2 Cloud-Nutzung', 'OPS.2.2.A1 Erstellung einer Cloud-Nutzungs-Strategie', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_2_2_Cloud-Nutzung.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.2.2.A10', 'OPS - Betrieb', 'OPS.2.2 Cloud-Nutzung', 'OPS.2.2.A10 Sichere Migration zu einem Cloud-Dienst', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_2_2_Cloud-Nutzung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.2.2.A11', 'OPS - Betrieb', 'OPS.2.2 Cloud-Nutzung', 'OPS.2.2.A11 Erstellung eines Notfallkonzeptes für einen Cloud-Dienst', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_2_2_Cloud-Nutzung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.2.2.A12', 'OPS - Betrieb', 'OPS.2.2 Cloud-Nutzung', 'OPS.2.2.A12 Aufrechterhaltung der Informationssicherheit im laufenden Cloud-Nutzungs-Betrieb', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_2_2_Cloud-Nutzung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.2.2.A13', 'OPS - Betrieb', 'OPS.2.2 Cloud-Nutzung', 'OPS.2.2.A13 Nachweis einer ausreichenden Informationssicherheit bei der Cloud-Nutzung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_2_2_Cloud-Nutzung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.2.2.A14', 'OPS - Betrieb', 'OPS.2.2 Cloud-Nutzung', 'OPS.2.2.A14 Geordnete Beendigung eines Cloud-Nutzungs-Verhältnisses', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_2_2_Cloud-Nutzung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.2.2.A15', 'OPS - Betrieb', 'OPS.2.2 Cloud-Nutzung', 'OPS.2.2.A15 Sicherstellung der Portabilität von Cloud-Diensten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_2_2_Cloud-Nutzung.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.2.2.A16', 'OPS - Betrieb', 'OPS.2.2 Cloud-Nutzung', 'OPS.2.2.A16 Durchführung eigener Datensicherungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_2_2_Cloud-Nutzung.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.2.2.A17', 'OPS - Betrieb', 'OPS.2.2 Cloud-Nutzung', 'OPS.2.2.A17 Einsatz von Verschlüsselung bei Cloud-Nutzung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_2_2_Cloud-Nutzung.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.2.2.A18', 'OPS - Betrieb', 'OPS.2.2 Cloud-Nutzung', 'OPS.2.2.A18 Einsatz von Verbunddiensten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_2_2_Cloud-Nutzung.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.2.2.A19', 'OPS - Betrieb', 'OPS.2.2 Cloud-Nutzung', 'OPS.2.2.A19 Sicherheitsüberprüfung von Mitarbeitern', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_2_2_Cloud-Nutzung.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.2.2.A2', 'OPS - Betrieb', 'OPS.2.2 Cloud-Nutzung', 'OPS.2.2.A2 Erstellung einer Sicherheitsrichtlinie für die Cloud-Nutzung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_2_2_Cloud-Nutzung.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.2.2.A3', 'OPS - Betrieb', 'OPS.2.2 Cloud-Nutzung', 'OPS.2.2.A3 Service-Definition für Cloud-Dienste durch den Cloud-Kunden', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_2_2_Cloud-Nutzung.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.2.2.A4', 'OPS - Betrieb', 'OPS.2.2 Cloud-Nutzung', 'OPS.2.2.A4 Festlegung von Verantwortungsbereichen und Schnittstellen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_2_2_Cloud-Nutzung.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.2.2.A5', 'OPS - Betrieb', 'OPS.2.2 Cloud-Nutzung', 'OPS.2.2.A5 Planung der sicheren Migration zu einem Cloud-Dienst', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_2_2_Cloud-Nutzung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.2.2.A6', 'OPS - Betrieb', 'OPS.2.2 Cloud-Nutzung', 'OPS.2.2.A6 Planung der sicheren Einbindung von Cloud-Diensten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_2_2_Cloud-Nutzung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.2.2.A7', 'OPS - Betrieb', 'OPS.2.2 Cloud-Nutzung', 'OPS.2.2.A7 Erstellung eines Sicherheitskonzeptes für die Cloud-Nutzung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_2_2_Cloud-Nutzung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.2.2.A8', 'OPS - Betrieb', 'OPS.2.2 Cloud-Nutzung', 'OPS.2.2.A8 Sorgfältige Auswahl eines Cloud-Diensteanbieters', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_2_2_Cloud-Nutzung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.2.2.A9', 'OPS - Betrieb', 'OPS.2.2 Cloud-Nutzung', 'OPS.2.2.A9 Vertragsgestaltung mit dem Cloud-Diensteanbieter', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_2_2_Cloud-Nutzung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.3.1.A1', 'OPS - Betrieb', 'OPS.3.1 Outsourcing für Dienstleister', 'OPS.3.1.A1 Erstellung eines Grobkonzeptes für die Outsourcing-Dienstleistung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_3_1_Outsourcing_für_Dienstleister.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.3.1.A10', 'OPS - Betrieb', 'OPS.3.1 Outsourcing für Dienstleister', 'OPS.3.1.A10 Planung und Aufrechterhaltung der Informationssicherheit im laufenden Outsourcing-Betrieb', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_3_1_Outsourcing_für_Dienstleister.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.3.1.A11', 'OPS - Betrieb', 'OPS.3.1 Outsourcing für Dienstleister', 'OPS.3.1.A11 Zutritts-, Zugangs- und Zugriffskontrolle', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_3_1_Outsourcing_für_Dienstleister.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.3.1.A12', 'OPS - Betrieb', 'OPS.3.1 Outsourcing für Dienstleister', 'OPS.3.1.A12 Änderungsmanagement', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_3_1_Outsourcing_für_Dienstleister.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.3.1.A13', 'OPS - Betrieb', 'OPS.3.1 Outsourcing für Dienstleister', 'OPS.3.1.A13 Sichere Migration bei Outsourcing-Vorhaben', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_3_1_Outsourcing_für_Dienstleister.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.3.1.A14', 'OPS - Betrieb', 'OPS.3.1 Outsourcing für Dienstleister', 'OPS.3.1.A14 Notfallvorsorge beim Outsourcing', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_3_1_Outsourcing_für_Dienstleister.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.3.1.A15', 'OPS - Betrieb', 'OPS.3.1 Outsourcing für Dienstleister', 'OPS.3.1.A15 Geordnete Beendigung eines Outsourcing-Verhältnisses', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_3_1_Outsourcing_für_Dienstleister.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.3.1.A16', 'OPS - Betrieb', 'OPS.3.1 Outsourcing für Dienstleister', 'OPS.3.1.A16 Sicherheitsüberprüfung von Mitarbeitern', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_3_1_Outsourcing_für_Dienstleister.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.3.1.A2', 'OPS - Betrieb', 'OPS.3.1 Outsourcing für Dienstleister', 'OPS.3.1.A2 Vertragsgestaltung mit den Outsourcing-Kunden', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_3_1_Outsourcing_für_Dienstleister.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.3.1.A3', 'OPS - Betrieb', 'OPS.3.1 Outsourcing für Dienstleister', 'OPS.3.1.A3 Erstellung eines Sicherheitskonzepts für das Outsourcing-Vorhaben', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_3_1_Outsourcing_für_Dienstleister.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.3.1.A4', 'OPS - Betrieb', 'OPS.3.1 Outsourcing für Dienstleister', 'OPS.3.1.A4 Festlegung der möglichen Kommunikationspartner', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_3_1_Outsourcing_für_Dienstleister.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.3.1.A5', 'OPS - Betrieb', 'OPS.3.1 Outsourcing für Dienstleister', 'OPS.3.1.A5 Regelungen für den Einsatz des Personals des Outsourcing-Dienstleisters', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_3_1_Outsourcing_für_Dienstleister.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.3.1.A6', 'OPS - Betrieb', 'OPS.3.1 Outsourcing für Dienstleister', 'OPS.3.1.A6 Regelungen für den Einsatz von Fremdpersonal', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_3_1_Outsourcing_für_Dienstleister.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.3.1.A7', 'OPS - Betrieb', 'OPS.3.1 Outsourcing für Dienstleister', 'OPS.3.1.A7 Erstellung eines Mandantentrennungskonzeptes durch den Outsourcing-Dienstleister', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_3_1_Outsourcing_für_Dienstleister.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.3.1.A8', 'OPS - Betrieb', 'OPS.3.1 Outsourcing für Dienstleister', 'OPS.3.1.A8 Vereinbarung über die Anbindung an Netze der Outsourcing-Partner', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_3_1_Outsourcing_für_Dienstleister.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('OPS.3.1.A9', 'OPS - Betrieb', 'OPS.3.1 Outsourcing für Dienstleister', 'OPS.3.1.A9 Vereinbarung über Datenaustausch zwischen den Outsourcing-Partnern', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/OPS/OPS_3_1_Outsourcing_für_Dienstleister.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('ORP.1.A1', 'ORP - Organisation und Personal', 'ORP.1 Organisation', 'ORP.1.A1 Festlegung von Verantwortlichkeiten und Regelungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/ORP/ORP_1_Organisation.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('ORP.1.A10', 'ORP - Organisation und Personal', 'ORP.1 Organisation', 'ORP.1.A10 Reaktion auf Verletzungen der Sicherheitsvorgaben', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/ORP/ORP_1_Organisation.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('ORP.1.A11', 'ORP - Organisation und Personal', 'ORP.1 Organisation', 'ORP.1.A11 Rechtzeitige Beteiligung der Personalvertretung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/ORP/ORP_1_Organisation.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('ORP.1.A12', 'ORP - Organisation und Personal', 'ORP.1 Organisation', 'ORP.1.A12 Regelungen für Wartungs- und Reparaturarbeiten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/ORP/ORP_1_Organisation.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('ORP.1.A13', 'ORP - Organisation und Personal', 'ORP.1 Organisation', 'ORP.1.A13 Sicherheit bei Umzügen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/ORP/ORP_1_Organisation.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('ORP.1.A14', 'ORP - Organisation und Personal', 'ORP.1 Organisation', 'ORP.1.A14 Kontrollgänge', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/ORP/ORP_1_Organisation.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('ORP.1.A2', 'ORP - Organisation und Personal', 'ORP.1 Organisation', 'ORP.1.A2 Zuweisung der Verantwortung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/ORP/ORP_1_Organisation.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('ORP.1.A3', 'ORP - Organisation und Personal', 'ORP.1 Organisation', 'ORP.1.A3 Beaufsichtigung oder Begleitung von Fremdpersonen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/ORP/ORP_1_Organisation.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('ORP.1.A4', 'ORP - Organisation und Personal', 'ORP.1 Organisation', 'ORP.1.A4 Funktionstrennung zwischen unvereinbaren Aufgaben', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/ORP/ORP_1_Organisation.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('ORP.1.A5', 'ORP - Organisation und Personal', 'ORP.1 Organisation', 'ORP.1.A5 Vergabe von Berechtigungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/ORP/ORP_1_Organisation.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('ORP.1.A6', 'ORP - Organisation und Personal', 'ORP.1 Organisation', 'ORP.1.A6 Schutz von sensiblen Informationen am Arbeitsplatz', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/ORP/ORP_1_Organisation.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('ORP.1.A7', 'ORP - Organisation und Personal', 'ORP.1 Organisation', 'ORP.1.A7 Geräteverwaltung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/ORP/ORP_1_Organisation.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('ORP.1.A8', 'ORP - Organisation und Personal', 'ORP.1 Organisation', 'ORP.1.A8 Betriebsmittelverwaltung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/ORP/ORP_1_Organisation.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('ORP.1.A9', 'ORP - Organisation und Personal', 'ORP.1 Organisation', 'ORP.1.A9 ENTFALLEN', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/ORP/ORP_1_Organisation.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('ORP.2.A1', 'ORP - Organisation und Personal', 'ORP.2 Personal', 'ORP.2.A1 Geregelte Einarbeitung neuer Mitarbeiter', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/ORP/ORP_2_Personal.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('ORP.2.A10', 'ORP - Organisation und Personal', 'ORP.2 Personal', 'ORP.2.A10 Vermeidung von Störungen des Betriebsklimas', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/ORP/ORP_2_Personal.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('ORP.2.A11', 'ORP - Organisation und Personal', 'ORP.2 Personal', 'ORP.2.A11 Analyse der Sicherheitskultur', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/ORP/ORP_2_Personal.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('ORP.2.A12', 'ORP - Organisation und Personal', 'ORP.2 Personal', 'ORP.2.A12 Benennung einer Vertrauensperson', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/ORP/ORP_2_Personal.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('ORP.2.A13', 'ORP - Organisation und Personal', 'ORP.2 Personal', 'ORP.2.A13 Sicherheitsüberprüfung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/ORP/ORP_2_Personal.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('ORP.2.A2', 'ORP - Organisation und Personal', 'ORP.2 Personal', 'ORP.2.A2 Geregelte Verfahrensweise beim Weggang von Mitarbeitern', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/ORP/ORP_2_Personal.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('ORP.2.A3', 'ORP - Organisation und Personal', 'ORP.2 Personal', 'ORP.2.A3 Festlegung von Vertretungsregelungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/ORP/ORP_2_Personal.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('ORP.2.A4', 'ORP - Organisation und Personal', 'ORP.2 Personal', 'ORP.2.A4 Festlegung von Regelungen für den Einsatz von Fremdpersonal', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/ORP/ORP_2_Personal.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('ORP.2.A5', 'ORP - Organisation und Personal', 'ORP.2 Personal', 'ORP.2.A5 Vertraulichkeitsvereinbarungen für den Einsatz von Fremdpersonal', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/ORP/ORP_2_Personal.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('ORP.2.A6', 'ORP - Organisation und Personal', 'ORP.2 Personal', 'ORP.2.A6 Überprüfung von Kandidaten bei der Auswahl von Personal', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/ORP/ORP_2_Personal.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('ORP.2.A7', 'ORP - Organisation und Personal', 'ORP.2 Personal', 'ORP.2.A7 Überprüfung der Vertrauenswürdigkeit von Mitarbeitern', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/ORP/ORP_2_Personal.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('ORP.2.A8', 'ORP - Organisation und Personal', 'ORP.2 Personal', 'ORP.2.A8 Aufgaben und Zuständigkeiten von Mitarbeitern', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/ORP/ORP_2_Personal.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('ORP.2.A9', 'ORP - Organisation und Personal', 'ORP.2 Personal', 'ORP.2.A9 Schulung von Mitarbeitern', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/ORP/ORP_2_Personal.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('ORP.3.A1', 'ORP - Organisation und Personal', 'ORP.3 Sensibilisierung und Schulung', 'ORP.3.A1 Sensibilisierung der Institutionsleitung für Informationssicherheit', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/ORP/ORP_3_Sensibilisierung_und_Schulung.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('ORP.3.A2', 'ORP - Organisation und Personal', 'ORP.3 Sensibilisierung und Schulung', 'ORP.3.A2 Ansprechpartner zu Sicherheitsfragen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/ORP/ORP_3_Sensibilisierung_und_Schulung.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('ORP.3.A3', 'ORP - Organisation und Personal', 'ORP.3 Sensibilisierung und Schulung', 'ORP.3.A3 Einweisung des Personals in den sicheren Umgang mit IT', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/ORP/ORP_3_Sensibilisierung_und_Schulung.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('ORP.3.A4', 'ORP - Organisation und Personal', 'ORP.3 Sensibilisierung und Schulung', 'ORP.3.A4 Konzeption eines Sensibilisierungs- und Schulungsprogramms zur Informationssicherheit', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/ORP/ORP_3_Sensibilisierung_und_Schulung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('ORP.3.A5', 'ORP - Organisation und Personal', 'ORP.3 Sensibilisierung und Schulung', 'ORP.3.A5 Analyse der Zielgruppen für Sensibilisierungs- und Schulungsprogramme', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/ORP/ORP_3_Sensibilisierung_und_Schulung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('ORP.3.A6', 'ORP - Organisation und Personal', 'ORP.3 Sensibilisierung und Schulung', 'ORP.3.A6 Planung und Durchführung von Sensibilisierungen und Schulungen zur Informationssicherheit', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/ORP/ORP_3_Sensibilisierung_und_Schulung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('ORP.3.A7', 'ORP - Organisation und Personal', 'ORP.3 Sensibilisierung und Schulung', 'ORP.3.A7 Schulung zur Vorgehensweise nach IT-Grundschutz', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/ORP/ORP_3_Sensibilisierung_und_Schulung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('ORP.3.A8', 'ORP - Organisation und Personal', 'ORP.3 Sensibilisierung und Schulung', 'ORP.3.A8 Messung und Auswertung des Lernerfolgs', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/ORP/ORP_3_Sensibilisierung_und_Schulung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('ORP.3.A9', 'ORP - Organisation und Personal', 'ORP.3 Sensibilisierung und Schulung', 'ORP.3.A9 Spezielle Schulung von exponierten Personen und Institutionen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/ORP/ORP_3_Sensibilisierung_und_Schulung.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('ORP.4.A1', 'ORP - Organisation und Personal', 'ORP.4 Identitäts- und Berechtigungsmanagement', 'ORP.4.A1 Regelung für die Einrichtung und Löschung von Benutzern und Benutzergruppen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/ORP/ORP_4_Identitäts-_und_Berechtigungsmanagement.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('ORP.4.A10', 'ORP - Organisation und Personal', 'ORP.4 Identitäts- und Berechtigungsmanagement', 'ORP.4.A10 Schutz von Benutzerkennungen mit weitreichenden Berechtigungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/ORP/ORP_4_Identitäts-_und_Berechtigungsmanagement.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('ORP.4.A11', 'ORP - Organisation und Personal', 'ORP.4 Identitäts- und Berechtigungsmanagement', 'ORP.4.A11 Zurücksetzen von Passwörtern', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/ORP/ORP_4_Identitäts-_und_Berechtigungsmanagement.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('ORP.4.A12', 'ORP - Organisation und Personal', 'ORP.4 Identitäts- und Berechtigungsmanagement', 'ORP.4.A12 Entwicklung eines Authentisierungskonzeptes für IT-Systeme und Anwendungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/ORP/ORP_4_Identitäts-_und_Berechtigungsmanagement.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('ORP.4.A13', 'ORP - Organisation und Personal', 'ORP.4 Identitäts- und Berechtigungsmanagement', 'ORP.4.A13 Geeignete Auswahl von Authentisierungsmechanismen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/ORP/ORP_4_Identitäts-_und_Berechtigungsmanagement.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('ORP.4.A14', 'ORP - Organisation und Personal', 'ORP.4 Identitäts- und Berechtigungsmanagement', 'ORP.4.A14 Kontrolle der Wirksamkeit der Benutzertrennung am IT-System bzw. Anwendung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/ORP/ORP_4_Identitäts-_und_Berechtigungsmanagement.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('ORP.4.A15', 'ORP - Organisation und Personal', 'ORP.4 Identitäts- und Berechtigungsmanagement', 'ORP.4.A15 Vorgehensweise und Konzeption der Prozesse beim Identitäts- und Berechtigungsmanagement', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/ORP/ORP_4_Identitäts-_und_Berechtigungsmanagement.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('ORP.4.A16', 'ORP - Organisation und Personal', 'ORP.4 Identitäts- und Berechtigungsmanagement', 'ORP.4.A16 Richtlinien für die Zugriffs- und Zugangskontrolle', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/ORP/ORP_4_Identitäts-_und_Berechtigungsmanagement.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('ORP.4.A17', 'ORP - Organisation und Personal', 'ORP.4 Identitäts- und Berechtigungsmanagement', 'ORP.4.A17 Geeignete Auswahl von Identitäts- und Berechtigungsmanagement-Systemen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/ORP/ORP_4_Identitäts-_und_Berechtigungsmanagement.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('ORP.4.A18', 'ORP - Organisation und Personal', 'ORP.4 Identitäts- und Berechtigungsmanagement', 'ORP.4.A18 Einsatz eines zentralen Authentisierungsdienstes', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/ORP/ORP_4_Identitäts-_und_Berechtigungsmanagement.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('ORP.4.A19', 'ORP - Organisation und Personal', 'ORP.4 Identitäts- und Berechtigungsmanagement', 'ORP.4.A19 Einweisung aller Mitarbeiter in den Umgang mit Authentisierungsverfahren und -mechanismen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/ORP/ORP_4_Identitäts-_und_Berechtigungsmanagement.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('ORP.4.A2', 'ORP - Organisation und Personal', 'ORP.4 Identitäts- und Berechtigungsmanagement', 'ORP.4.A2 Regelung für Einrichtung, Änderung und Entzug von Berechtigungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/ORP/ORP_4_Identitäts-_und_Berechtigungsmanagement.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('ORP.4.A20', 'ORP - Organisation und Personal', 'ORP.4 Identitäts- und Berechtigungsmanagement', 'ORP.4.A20 Notfallvorsorge für das Identitäts- und Berechtigungsmanagement-System', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/ORP/ORP_4_Identitäts-_und_Berechtigungsmanagement.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('ORP.4.A21', 'ORP - Organisation und Personal', 'ORP.4 Identitäts- und Berechtigungsmanagement', 'ORP.4.A21 Mehr-Faktor-Authentisierung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/ORP/ORP_4_Identitäts-_und_Berechtigungsmanagement.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('ORP.4.A22', 'ORP - Organisation und Personal', 'ORP.4 Identitäts- und Berechtigungsmanagement', 'ORP.4.A22 Regelung zur Passwortqualität', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/ORP/ORP_4_Identitäts-_und_Berechtigungsmanagement.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('ORP.4.A23', 'ORP - Organisation und Personal', 'ORP.4 Identitäts- und Berechtigungsmanagement', 'ORP.4.A23 Regelung für Passwort-verarbeitende Anwendungen und IT-Systeme', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/ORP/ORP_4_Identitäts-_und_Berechtigungsmanagement.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('ORP.4.A3', 'ORP - Organisation und Personal', 'ORP.4 Identitäts- und Berechtigungsmanagement', 'ORP.4.A3 Dokumentation der Benutzerkennungen und Rechteprofile', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/ORP/ORP_4_Identitäts-_und_Berechtigungsmanagement.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('ORP.4.A4', 'ORP - Organisation und Personal', 'ORP.4 Identitäts- und Berechtigungsmanagement', 'ORP.4.A4 Aufgabenverteilung und Funktionstrennung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/ORP/ORP_4_Identitäts-_und_Berechtigungsmanagement.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('ORP.4.A5', 'ORP - Organisation und Personal', 'ORP.4 Identitäts- und Berechtigungsmanagement', 'ORP.4.A5 Vergabe von Zutrittsberechtigungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/ORP/ORP_4_Identitäts-_und_Berechtigungsmanagement.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('ORP.4.A6', 'ORP - Organisation und Personal', 'ORP.4 Identitäts- und Berechtigungsmanagement', 'ORP.4.A6 Vergabe von Zugangsberechtigungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/ORP/ORP_4_Identitäts-_und_Berechtigungsmanagement.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('ORP.4.A7', 'ORP - Organisation und Personal', 'ORP.4 Identitäts- und Berechtigungsmanagement', 'ORP.4.A7 Vergabe von Zugriffsrechten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/ORP/ORP_4_Identitäts-_und_Berechtigungsmanagement.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('ORP.4.A8', 'ORP - Organisation und Personal', 'ORP.4 Identitäts- und Berechtigungsmanagement', 'ORP.4.A8 Regelung des Passwortgebrauchs', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/ORP/ORP_4_Identitäts-_und_Berechtigungsmanagement.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('ORP.4.A9', 'ORP - Organisation und Personal', 'ORP.4 Identitäts- und Berechtigungsmanagement', 'ORP.4.A9 Identifikation und Authentisierung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/ORP/ORP_4_Identitäts-_und_Berechtigungsmanagement.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('ORP.5.A1', 'ORP - Organisation und Personal', 'ORP.5 Compliance Management (Anforderungsmanagement)', 'ORP.5.A1 Identifikation der rechtlichen Rahmenbedingungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/ORP/ORP_5_Compliance_Management_(Anforderungsmanagement).html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('ORP.5.A10', 'ORP - Organisation und Personal', 'ORP.5 Compliance Management (Anforderungsmanagement)', 'ORP.5.A10 ENTFALLEN', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/ORP/ORP_5_Compliance_Management_(Anforderungsmanagement).html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('ORP.5.A11', 'ORP - Organisation und Personal', 'ORP.5 Compliance Management (Anforderungsmanagement)', 'ORP.5.A11 ENTFALLEN', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/ORP/ORP_5_Compliance_Management_(Anforderungsmanagement).html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('ORP.5.A2', 'ORP - Organisation und Personal', 'ORP.5 Compliance Management (Anforderungsmanagement)', 'ORP.5.A2 Beachtung rechtlicher Rahmenbedingungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/ORP/ORP_5_Compliance_Management_(Anforderungsmanagement).html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('ORP.5.A3', 'ORP - Organisation und Personal', 'ORP.5 Compliance Management (Anforderungsmanagement)', 'ORP.5.A3 Verpflichtung der Mitarbeiter auf Einhaltung einschlägiger Gesetze, Vorschriften und Regelungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/ORP/ORP_5_Compliance_Management_(Anforderungsmanagement).html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('ORP.5.A4', 'ORP - Organisation und Personal', 'ORP.5 Compliance Management (Anforderungsmanagement)', 'ORP.5.A4 Konzeption und Organisation des Compliance Managements', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/ORP/ORP_5_Compliance_Management_(Anforderungsmanagement).html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('ORP.5.A5', 'ORP - Organisation und Personal', 'ORP.5 Compliance Management (Anforderungsmanagement)', 'ORP.5.A5 Ausnahmegenehmigungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/ORP/ORP_5_Compliance_Management_(Anforderungsmanagement).html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('ORP.5.A6', 'ORP - Organisation und Personal', 'ORP.5 Compliance Management (Anforderungsmanagement)', 'ORP.5.A6 Einweisung des Personals in den sicheren Umgang mit IT', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/ORP/ORP_5_Compliance_Management_(Anforderungsmanagement).html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('ORP.5.A7', 'ORP - Organisation und Personal', 'ORP.5 Compliance Management (Anforderungsmanagement)', 'ORP.5.A7 ENTFALLEN', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/ORP/ORP_5_Compliance_Management_(Anforderungsmanagement).html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('ORP.5.A8', 'ORP - Organisation und Personal', 'ORP.5 Compliance Management (Anforderungsmanagement)', 'ORP.5.A8 Regelmäßige Überprüfungen des Compliance Managements', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/ORP/ORP_5_Compliance_Management_(Anforderungsmanagement).html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('ORP.5.A9', 'ORP - Organisation und Personal', 'ORP.5 Compliance Management (Anforderungsmanagement)', 'ORP.5.A9 ENTFALLEN', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/ORP/ORP_5_Compliance_Management_(Anforderungsmanagement).html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.1.A1', 'SYS - IT-Systeme', 'SYS.1.1 Allgemeiner Server', 'SYS.1.1.A1 Geeignete Aufstellung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_1_Allgemeiner_Server.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.1.A10', 'SYS - IT-Systeme', 'SYS.1.1 Allgemeiner Server', 'SYS.1.1.A10 Protokollierung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_1_Allgemeiner_Server.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.1.A11', 'SYS - IT-Systeme', 'SYS.1.1 Allgemeiner Server', 'SYS.1.1.A11 Festlegung einer Sicherheitsrichtlinie für Server', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_1_Allgemeiner_Server.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.1.A12', 'SYS - IT-Systeme', 'SYS.1.1 Allgemeiner Server', 'SYS.1.1.A12 Planung des Server-Einsatzes', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_1_Allgemeiner_Server.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.1.A13', 'SYS - IT-Systeme', 'SYS.1.1 Allgemeiner Server', 'SYS.1.1.A13 Beschaffung von Servern', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_1_Allgemeiner_Server.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.1.A14', 'SYS - IT-Systeme', 'SYS.1.1 Allgemeiner Server', 'SYS.1.1.A14 Erstellung eines Benutzer- und Administrationskonzepts', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_1_Allgemeiner_Server.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.1.A15', 'SYS - IT-Systeme', 'SYS.1.1 Allgemeiner Server', 'SYS.1.1.A15 Unterbrechungsfreie und stabile Stromversorgung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_1_Allgemeiner_Server.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.1.A16', 'SYS - IT-Systeme', 'SYS.1.1 Allgemeiner Server', 'SYS.1.1.A16 Sichere Installation und Grundkonfiguration von Servern', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_1_Allgemeiner_Server.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.1.A17', 'SYS - IT-Systeme', 'SYS.1.1 Allgemeiner Server', 'SYS.1.1.A17 Einsatzfreigabe für Server', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_1_Allgemeiner_Server.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.1.A18', 'SYS - IT-Systeme', 'SYS.1.1 Allgemeiner Server', 'SYS.1.1.A18 Verschlüsselung der Kommunikationsverbindungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_1_Allgemeiner_Server.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.1.A19', 'SYS - IT-Systeme', 'SYS.1.1 Allgemeiner Server', 'SYS.1.1.A19 Einrichtung lokaler Paketfilter', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_1_Allgemeiner_Server.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.1.A2', 'SYS - IT-Systeme', 'SYS.1.1 Allgemeiner Server', 'SYS.1.1.A2 Benutzerauthentisierung an Servern', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_1_Allgemeiner_Server.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.1.A20', 'SYS - IT-Systeme', 'SYS.1.1 Allgemeiner Server', 'SYS.1.1.A20 Beschränkung des Zugangs über Netze', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_1_Allgemeiner_Server.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.1.A21', 'SYS - IT-Systeme', 'SYS.1.1 Allgemeiner Server', 'SYS.1.1.A21 Betriebsdokumentation für Server', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_1_Allgemeiner_Server.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.1.A22', 'SYS - IT-Systeme', 'SYS.1.1 Allgemeiner Server', 'SYS.1.1.A22 Einbindung in die Notfallplanung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_1_Allgemeiner_Server.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.1.A23', 'SYS - IT-Systeme', 'SYS.1.1 Allgemeiner Server', 'SYS.1.1.A23 Systemüberwachung und Monitoring von Servern', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_1_Allgemeiner_Server.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.1.A24', 'SYS - IT-Systeme', 'SYS.1.1 Allgemeiner Server', 'SYS.1.1.A24 Sicherheitsprüfungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_1_Allgemeiner_Server.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.1.A25', 'SYS - IT-Systeme', 'SYS.1.1 Allgemeiner Server', 'SYS.1.1.A25 Geregelte Außerbetriebnahme eines Servers', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_1_Allgemeiner_Server.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.1.A26', 'SYS - IT-Systeme', 'SYS.1.1 Allgemeiner Server', 'SYS.1.1.A26 Verwendung von Mehr-Faktor-Authentisierung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_1_Allgemeiner_Server.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.1.A27', 'SYS - IT-Systeme', 'SYS.1.1 Allgemeiner Server', 'SYS.1.1.A27 Hostbasierte Angriffserkennung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_1_Allgemeiner_Server.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.1.A28', 'SYS - IT-Systeme', 'SYS.1.1 Allgemeiner Server', 'SYS.1.1.A28 Steigerung der Verfügbarkeit durch Redundanz', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_1_Allgemeiner_Server.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.1.A29', 'SYS - IT-Systeme', 'SYS.1.1 Allgemeiner Server', 'SYS.1.1.A29 Einrichtung einer Testumgebung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_1_Allgemeiner_Server.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.1.A3', 'SYS - IT-Systeme', 'SYS.1.1 Allgemeiner Server', 'SYS.1.1.A3 Restriktive Rechtevergabe', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_1_Allgemeiner_Server.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.1.A30', 'SYS - IT-Systeme', 'SYS.1.1 Allgemeiner Server', 'SYS.1.1.A30 Ein Dienst pro Server', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_1_Allgemeiner_Server.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.1.A31', 'SYS - IT-Systeme', 'SYS.1.1 Allgemeiner Server', 'SYS.1.1.A31 Application Whitelisting', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_1_Allgemeiner_Server.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.1.A32', 'SYS - IT-Systeme', 'SYS.1.1 Allgemeiner Server', 'SYS.1.1.A32 Zusätzlicher Schutz von privilegierten Anmeldeinformationen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_1_Allgemeiner_Server.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.1.A33', 'SYS - IT-Systeme', 'SYS.1.1 Allgemeiner Server', 'SYS.1.1.A33 Aktive Verwaltung der Wurzelzertifikate', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_1_Allgemeiner_Server.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.1.A34', 'SYS - IT-Systeme', 'SYS.1.1 Allgemeiner Server', 'SYS.1.1.A34 Festplattenverschlüsselung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_1_Allgemeiner_Server.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.1.A4', 'SYS - IT-Systeme', 'SYS.1.1 Allgemeiner Server', 'SYS.1.1.A4 Rollentrennung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_1_Allgemeiner_Server.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.1.A5', 'SYS - IT-Systeme', 'SYS.1.1 Allgemeiner Server', 'SYS.1.1.A5 Schutz der Administrationsschnittstellen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_1_Allgemeiner_Server.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.1.A6', 'SYS - IT-Systeme', 'SYS.1.1 Allgemeiner Server', 'SYS.1.1.A6 Deaktivierung nicht benötigter Dienste und Kennungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_1_Allgemeiner_Server.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.1.A7', 'SYS - IT-Systeme', 'SYS.1.1 Allgemeiner Server', 'SYS.1.1.A7 Updates und Patches für Firmware, Betriebssystem und Anwendungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_1_Allgemeiner_Server.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.1.A8', 'SYS - IT-Systeme', 'SYS.1.1 Allgemeiner Server', 'SYS.1.1.A8 Regelmäßige Datensicherung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_1_Allgemeiner_Server.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.1.A9', 'SYS - IT-Systeme', 'SYS.1.1 Allgemeiner Server', 'SYS.1.1.A9 Einsatz von Virenschutz-Programmen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_1_Allgemeiner_Server.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.2.2.A1', 'SYS - IT-Systeme', 'SYS.1.2.2 Windows Server 2012', 'SYS.1.2.2.A1 Planung von Windows Server 2012', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_2_2_Windows_Server_2012.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.2.2.A10', 'SYS - IT-Systeme', 'SYS.1.2.2 Windows Server 2012', 'SYS.1.2.2.A10 Festplattenverschlüsselung bei Windows Server 2012', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_2_2_Windows_Server_2012.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.2.2.A11', 'SYS - IT-Systeme', 'SYS.1.2.2 Windows Server 2012', 'SYS.1.2.2.A11 Angriffserkennung bei Windows Server 2012', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_2_2_Windows_Server_2012.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.2.2.A12', 'SYS - IT-Systeme', 'SYS.1.2.2 Windows Server 2012', 'SYS.1.2.2.A12 Redundanz und Hochverfügbarkeit bei Windows Server 2012', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_2_2_Windows_Server_2012.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.2.2.A13', 'SYS - IT-Systeme', 'SYS.1.2.2 Windows Server 2012', 'SYS.1.2.2.A13 Starke Authentifizierung bei Windows Server 2012', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_2_2_Windows_Server_2012.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.2.2.A14', 'SYS - IT-Systeme', 'SYS.1.2.2 Windows Server 2012', 'SYS.1.2.2.A14 Herunterfahren verschlüsselter Server und virtueller Maschinen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_2_2_Windows_Server_2012.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.2.2.A2', 'SYS - IT-Systeme', 'SYS.1.2.2 Windows Server 2012', 'SYS.1.2.2.A2 Sichere Installation von Windows Server 2012', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_2_2_Windows_Server_2012.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.2.2.A3', 'SYS - IT-Systeme', 'SYS.1.2.2 Windows Server 2012', 'SYS.1.2.2.A3 Sichere Administration von Windows Server 2012', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_2_2_Windows_Server_2012.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.2.2.A4', 'SYS - IT-Systeme', 'SYS.1.2.2 Windows Server 2012', 'SYS.1.2.2.A4 Sichere Konfiguration von Windows Server 2012', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_2_2_Windows_Server_2012.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.2.2.A5', 'SYS - IT-Systeme', 'SYS.1.2.2 Windows Server 2012', 'SYS.1.2.2.A5 Schutz vor Schadsoftware auf Windows Server 2012', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_2_2_Windows_Server_2012.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.2.2.A6', 'SYS - IT-Systeme', 'SYS.1.2.2 Windows Server 2012', 'SYS.1.2.2.A6 Sichere Authentisierung und Autorisierung in Windows Server 2012', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_2_2_Windows_Server_2012.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.2.2.A7', 'SYS - IT-Systeme', 'SYS.1.2.2 Windows Server 2012', 'SYS.1.2.2.A7 Prüfung der Sicherheitskonfiguration von Windows Server 2012', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_2_2_Windows_Server_2012.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.2.2.A8', 'SYS - IT-Systeme', 'SYS.1.2.2 Windows Server 2012', 'SYS.1.2.2.A8 Schutz der Systemintegrität', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_2_2_Windows_Server_2012.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.2.2.A9', 'SYS - IT-Systeme', 'SYS.1.2.2 Windows Server 2012', 'SYS.1.2.2.A9 Lokale Kommunikationsfilterung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_2_2_Windows_Server_2012.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.3.A1', 'SYS - IT-Systeme', 'SYS.1.3 Server unter Linux und Unix', 'SYS.1.3.A1 Authentisierung von Administratoren und Benutzern', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_3_Server_unter_Linux_und_Unix.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.3.A10', 'SYS - IT-Systeme', 'SYS.1.3 Server unter Linux und Unix', 'SYS.1.3.A10 Verhinderung der Ausbreitung bei der Ausnutzung von Schwachstellen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_3_Server_unter_Linux_und_Unix.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.3.A11', 'SYS - IT-Systeme', 'SYS.1.3 Server unter Linux und Unix', 'SYS.1.3.A11 Einsatz der Sicherheitsmechanismen von NFS', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_3_Server_unter_Linux_und_Unix.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.3.A12', 'SYS - IT-Systeme', 'SYS.1.3 Server unter Linux und Unix', 'SYS.1.3.A12 Einsatz der Sicherheitsmechanismen von NIS', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_3_Server_unter_Linux_und_Unix.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.3.A13', 'SYS - IT-Systeme', 'SYS.1.3 Server unter Linux und Unix', 'SYS.1.3.A13 ENTFALLEN', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_3_Server_unter_Linux_und_Unix.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.3.A14', 'SYS - IT-Systeme', 'SYS.1.3 Server unter Linux und Unix', 'SYS.1.3.A14 Verhinderung des Ausspähens von System- und Benutzerinformationen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_3_Server_unter_Linux_und_Unix.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.3.A15', 'SYS - IT-Systeme', 'SYS.1.3 Server unter Linux und Unix', 'SYS.1.3.A15 Zusätzliche Absicherung des Bootvorgangs', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_3_Server_unter_Linux_und_Unix.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.3.A16', 'SYS - IT-Systeme', 'SYS.1.3 Server unter Linux und Unix', 'SYS.1.3.A16 Zusätzliche Verhinderung der Ausbreitung bei der Ausnutzung von Schwachstellen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_3_Server_unter_Linux_und_Unix.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.3.A17', 'SYS - IT-Systeme', 'SYS.1.3 Server unter Linux und Unix', 'SYS.1.3.A17 Zusätzlicher Schutz des Kernels', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_3_Server_unter_Linux_und_Unix.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.3.A2', 'SYS - IT-Systeme', 'SYS.1.3 Server unter Linux und Unix', 'SYS.1.3.A2 Sorgfältige Vergabe von IDs', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_3_Server_unter_Linux_und_Unix.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.3.A3', 'SYS - IT-Systeme', 'SYS.1.3 Server unter Linux und Unix', 'SYS.1.3.A3 Kein automatisches Einbinden von Wechsellaufwerken', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_3_Server_unter_Linux_und_Unix.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.3.A4', 'SYS - IT-Systeme', 'SYS.1.3 Server unter Linux und Unix', 'SYS.1.3.A4 Schutz vor Ausnutzung von Schwachstellen in Anwendungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_3_Server_unter_Linux_und_Unix.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.3.A5', 'SYS - IT-Systeme', 'SYS.1.3 Server unter Linux und Unix', 'SYS.1.3.A5 Sichere Installation von Software-Paketen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_3_Server_unter_Linux_und_Unix.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.3.A6', 'SYS - IT-Systeme', 'SYS.1.3 Server unter Linux und Unix', 'SYS.1.3.A6 Verwaltung von Benutzern und Gruppen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_3_Server_unter_Linux_und_Unix.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.3.A7', 'SYS - IT-Systeme', 'SYS.1.3 Server unter Linux und Unix', 'SYS.1.3.A7 ENTFALLEN', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_3_Server_unter_Linux_und_Unix.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.3.A8', 'SYS - IT-Systeme', 'SYS.1.3 Server unter Linux und Unix', 'SYS.1.3.A8 Verschlüsselter Zugriff über Secure Shell', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_3_Server_unter_Linux_und_Unix.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.3.A9', 'SYS - IT-Systeme', 'SYS.1.3 Server unter Linux und Unix', 'SYS.1.3.A9 Absicherung des Bootvorgangs', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_3_Server_unter_Linux_und_Unix.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.5.A1', 'SYS - IT-Systeme', 'SYS.1.5 Virtualisierung', 'SYS.1.5.A1 Einspielen von Aktualisierungen und Sicherheitsupdates', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_5_Virtualisierung.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.5.A10', 'SYS - IT-Systeme', 'SYS.1.5 Virtualisierung', 'SYS.1.5.A10 Einführung von Verwaltungsprozessen für virtuelle IT-Systeme', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_5_Virtualisierung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.5.A11', 'SYS - IT-Systeme', 'SYS.1.5 Virtualisierung', 'SYS.1.5.A11 Administration der Virtualisierungsinfrastruktur über ein gesondertes Managementnetz', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_5_Virtualisierung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.5.A12', 'SYS - IT-Systeme', 'SYS.1.5 Virtualisierung', 'SYS.1.5.A12 Rechte- und Rollenkonzept für die Administration einer virtuellen Infrastruktur', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_5_Virtualisierung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.5.A13', 'SYS - IT-Systeme', 'SYS.1.5 Virtualisierung', 'SYS.1.5.A13 Auswahl geeigneter Hardware für Virtualisierungsumgebungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_5_Virtualisierung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.5.A14', 'SYS - IT-Systeme', 'SYS.1.5 Virtualisierung', 'SYS.1.5.A14 Einheitliche Konfigurationsstandards für virtuelle IT-Systeme', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_5_Virtualisierung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.5.A15', 'SYS - IT-Systeme', 'SYS.1.5 Virtualisierung', 'SYS.1.5.A15 Betrieb von Gast-Betriebssystemen mit unterschiedlichem Schutzbedarf', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_5_Virtualisierung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.5.A16', 'SYS - IT-Systeme', 'SYS.1.5 Virtualisierung', 'SYS.1.5.A16 Kapselung der virtuellen Maschinen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_5_Virtualisierung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.5.A17', 'SYS - IT-Systeme', 'SYS.1.5 Virtualisierung', 'SYS.1.5.A17 Überwachung des Betriebszustands und der Konfiguration der virtuellen Infrastruktur', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_5_Virtualisierung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.5.A18', 'SYS - IT-Systeme', 'SYS.1.5 Virtualisierung', 'SYS.1.5.A18 Schulung der Administratoren virtueller Umgebungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_5_Virtualisierung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.5.A19', 'SYS - IT-Systeme', 'SYS.1.5 Virtualisierung', 'SYS.1.5.A19 Regelmäßige Audits der Virtualisierungsinfrastruktur', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_5_Virtualisierung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.5.A2', 'SYS - IT-Systeme', 'SYS.1.5 Virtualisierung', 'SYS.1.5.A2 Sicherer Einsatz virtueller IT-Systeme', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_5_Virtualisierung.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.5.A20', 'SYS - IT-Systeme', 'SYS.1.5 Virtualisierung', 'SYS.1.5.A20 Verwendung von hochverfügbaren Architekturen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_5_Virtualisierung.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.5.A21', 'SYS - IT-Systeme', 'SYS.1.5 Virtualisierung', 'SYS.1.5.A21 Sichere Konfiguration virtueller IT-Systeme bei erhöhtem Schutzbedarf', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_5_Virtualisierung.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.5.A22', 'SYS - IT-Systeme', 'SYS.1.5 Virtualisierung', 'SYS.1.5.A22 Härtung des Virtualisierungsservers', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_5_Virtualisierung.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.5.A23', 'SYS - IT-Systeme', 'SYS.1.5 Virtualisierung', 'SYS.1.5.A23 Rechte-Einschränkung der virtuellen Maschinen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_5_Virtualisierung.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.5.A24', 'SYS - IT-Systeme', 'SYS.1.5 Virtualisierung', 'SYS.1.5.A24 Deaktivierung von Snapshots virtueller IT-Systeme', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_5_Virtualisierung.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.5.A25', 'SYS - IT-Systeme', 'SYS.1.5 Virtualisierung', 'SYS.1.5.A25 Minimale Nutzung von Konsolenzugriffen auf virtuelle IT-Systeme', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_5_Virtualisierung.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.5.A26', 'SYS - IT-Systeme', 'SYS.1.5 Virtualisierung', 'SYS.1.5.A26 Einsatz einer PKI', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_5_Virtualisierung.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.5.A27', 'SYS - IT-Systeme', 'SYS.1.5 Virtualisierung', 'SYS.1.5.A27 Einsatz zertifizierter Virtualisierungssoftware', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_5_Virtualisierung.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.5.A28', 'SYS - IT-Systeme', 'SYS.1.5 Virtualisierung', 'SYS.1.5.A28 Verschlüsselung von virtuellen IT-Systemen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_5_Virtualisierung.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.5.A3', 'SYS - IT-Systeme', 'SYS.1.5 Virtualisierung', 'SYS.1.5.A3 Sichere Konfiguration virtueller IT-Systeme', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_5_Virtualisierung.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.5.A4', 'SYS - IT-Systeme', 'SYS.1.5 Virtualisierung', 'SYS.1.5.A4 Sichere Konfiguration eines Netzes für virtuelle Infrastrukturen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_5_Virtualisierung.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.5.A5', 'SYS - IT-Systeme', 'SYS.1.5 Virtualisierung', 'SYS.1.5.A5 Schutz der Administrationsschnittstellen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_5_Virtualisierung.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.5.A6', 'SYS - IT-Systeme', 'SYS.1.5 Virtualisierung', 'SYS.1.5.A6 Protokollierung in der virtuellen Infrastruktur', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_5_Virtualisierung.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.5.A7', 'SYS - IT-Systeme', 'SYS.1.5 Virtualisierung', 'SYS.1.5.A7 Zeitsynchronisation in virtuellen IT-Systemen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_5_Virtualisierung.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.5.A8', 'SYS - IT-Systeme', 'SYS.1.5 Virtualisierung', 'SYS.1.5.A8 Planung einer virtuellen Infrastruktur', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_5_Virtualisierung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.5.A9', 'SYS - IT-Systeme', 'SYS.1.5 Virtualisierung', 'SYS.1.5.A9 Netzplanung für virtuelle Infrastrukturen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_5_Virtualisierung.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.7.A1', 'SYS - IT-Systeme', 'SYS.1.7 IBM Z-System', 'SYS.1.7.A1 Einsatz restriktiver z/OS-Kennungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_7_IBM_Z-System.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.7.A10', 'SYS - IT-Systeme', 'SYS.1.7 IBM Z-System', 'SYS.1.7.A10 Absichern des Login-Vorgangs unter z/OS', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_7_IBM_Z-System.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.7.A11', 'SYS - IT-Systeme', 'SYS.1.7 IBM Z-System', 'SYS.1.7.A11 Schutz der Session-Daten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_7_IBM_Z-System.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.7.A12', 'SYS - IT-Systeme', 'SYS.1.7 IBM Z-System', 'SYS.1.7.A12 Planung von Z-Systemen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_7_IBM_Z-System.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.7.A13', 'SYS - IT-Systeme', 'SYS.1.7 IBM Z-System', 'SYS.1.7.A13 Erstellung von Sicherheitsrichtlinien für z/OS-Systeme', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_7_IBM_Z-System.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.7.A14', 'SYS - IT-Systeme', 'SYS.1.7 IBM Z-System', 'SYS.1.7.A14 Berichtswesen zum sicheren Betrieb von z/OS', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_7_IBM_Z-System.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.7.A15', 'SYS - IT-Systeme', 'SYS.1.7 IBM Z-System', 'SYS.1.7.A15 Überprüfungen zum sicheren Betrieb von z/OS', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_7_IBM_Z-System.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.7.A16', 'SYS - IT-Systeme', 'SYS.1.7 IBM Z-System', 'SYS.1.7.A16 Überwachung von z/OS-Systemen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_7_IBM_Z-System.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.7.A17', 'SYS - IT-Systeme', 'SYS.1.7 IBM Z-System', 'SYS.1.7.A17 Synchronisierung von z/OS-Passwörtern und RACF-Kommandos', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_7_IBM_Z-System.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.7.A18', 'SYS - IT-Systeme', 'SYS.1.7 IBM Z-System', 'SYS.1.7.A18 Rollenkonzept für z/OS-Systeme', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_7_IBM_Z-System.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.7.A19', 'SYS - IT-Systeme', 'SYS.1.7 IBM Z-System', 'SYS.1.7.A19 Absicherung von z/OS-Transaktionsmonitoren', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_7_IBM_Z-System.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.7.A2', 'SYS - IT-Systeme', 'SYS.1.7 IBM Z-System', 'SYS.1.7.A2 Absicherung sicherheitskritischer z/OS-Dienstprogramme', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_7_IBM_Z-System.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.7.A20', 'SYS - IT-Systeme', 'SYS.1.7 IBM Z-System', 'SYS.1.7.A20 Stilllegung von z/OS-Systemen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_7_IBM_Z-System.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.7.A21', 'SYS - IT-Systeme', 'SYS.1.7 IBM Z-System', 'SYS.1.7.A21 Absicherung des Startvorgangs von z/OS-Systemen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_7_IBM_Z-System.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.7.A22', 'SYS - IT-Systeme', 'SYS.1.7 IBM Z-System', 'SYS.1.7.A22 Absicherung der Betriebsfunktionen von z/OS', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_7_IBM_Z-System.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.7.A23', 'SYS - IT-Systeme', 'SYS.1.7 IBM Z-System', 'SYS.1.7.A23 Absicherung von z/VM', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_7_IBM_Z-System.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.7.A24', 'SYS - IT-Systeme', 'SYS.1.7 IBM Z-System', 'SYS.1.7.A24 Datenträgerverwaltung unter z/OS-Systemen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_7_IBM_Z-System.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.7.A25', 'SYS - IT-Systeme', 'SYS.1.7 IBM Z-System', 'SYS.1.7.A25 Festlegung der Systemdimensionierung von z/OS', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_7_IBM_Z-System.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.7.A26', 'SYS - IT-Systeme', 'SYS.1.7 IBM Z-System', 'SYS.1.7.A26 WorkLoad Management für z/OS-Systeme', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_7_IBM_Z-System.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.7.A27', 'SYS - IT-Systeme', 'SYS.1.7 IBM Z-System', 'SYS.1.7.A27 Zeichensatzkonvertierung bei z/OS-Systemen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_7_IBM_Z-System.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.7.A28', 'SYS - IT-Systeme', 'SYS.1.7 IBM Z-System', 'SYS.1.7.A28 Lizenzschlüssel-Management für z/OS-Software', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_7_IBM_Z-System.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.7.A29', 'SYS - IT-Systeme', 'SYS.1.7 IBM Z-System', 'SYS.1.7.A29 Absicherung von Unix System Services bei z/OS-Systemen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_7_IBM_Z-System.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.7.A3', 'SYS - IT-Systeme', 'SYS.1.7 IBM Z-System', 'SYS.1.7.A3 Wartung von Z-Systemen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_7_IBM_Z-System.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.7.A30', 'SYS - IT-Systeme', 'SYS.1.7 IBM Z-System', 'SYS.1.7.A30 Absicherung der z/OS-Trace-Funktionen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_7_IBM_Z-System.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.7.A31', 'SYS - IT-Systeme', 'SYS.1.7 IBM Z-System', 'SYS.1.7.A31 Notfallvorsorge für z/OS-Systeme', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_7_IBM_Z-System.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.7.A32', 'SYS - IT-Systeme', 'SYS.1.7 IBM Z-System', 'SYS.1.7.A32 Festlegung von Standards für z/OS-Systemdefinitionen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_7_IBM_Z-System.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.7.A33', 'SYS - IT-Systeme', 'SYS.1.7 IBM Z-System', 'SYS.1.7.A33 Trennung von Test- und Produktionssystemen unter z/OS', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_7_IBM_Z-System.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.7.A34', 'SYS - IT-Systeme', 'SYS.1.7 IBM Z-System', 'SYS.1.7.A34 Batch-Job-Planung für z/OS-Systeme', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_7_IBM_Z-System.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.7.A35', 'SYS - IT-Systeme', 'SYS.1.7 IBM Z-System', 'SYS.1.7.A35 Einsatz von RACF-Exits', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_7_IBM_Z-System.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.7.A36', 'SYS - IT-Systeme', 'SYS.1.7 IBM Z-System', 'SYS.1.7.A36 Interne Kommunikation von Betriebssystemen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_7_IBM_Z-System.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.7.A37', 'SYS - IT-Systeme', 'SYS.1.7 IBM Z-System', 'SYS.1.7.A37 Parallel Sysplex unter z/OS', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_7_IBM_Z-System.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.7.A38', 'SYS - IT-Systeme', 'SYS.1.7 IBM Z-System', 'SYS.1.7.A38 Einsatz des VTAM Session Management Exit unter z/OS', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_7_IBM_Z-System.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.7.A4', 'SYS - IT-Systeme', 'SYS.1.7 IBM Z-System', 'SYS.1.7.A4 Schulung des z/OS-Bedienungspersonals', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_7_IBM_Z-System.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.7.A5', 'SYS - IT-Systeme', 'SYS.1.7 IBM Z-System', 'SYS.1.7.A5 Einsatz und Sicherung systemnaher z/OS-Terminals', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_7_IBM_Z-System.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.7.A6', 'SYS - IT-Systeme', 'SYS.1.7 IBM Z-System', 'SYS.1.7.A6 Einsatz und Sicherung der Remote Support Facility', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_7_IBM_Z-System.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.7.A7', 'SYS - IT-Systeme', 'SYS.1.7 IBM Z-System', 'SYS.1.7.A7 Restriktive Autorisierung unter z/OS', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_7_IBM_Z-System.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.7.A8', 'SYS - IT-Systeme', 'SYS.1.7 IBM Z-System', 'SYS.1.7.A8 Einsatz des z/OS-Sicherheitssystems RACF', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_7_IBM_Z-System.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.7.A9', 'SYS - IT-Systeme', 'SYS.1.7 IBM Z-System', 'SYS.1.7.A9 Mandantenfähigkeit unter z/OS', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_7_IBM_Z-System.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.8.A1', 'SYS - IT-Systeme', 'SYS.1.8 Speicherlösungen', 'SYS.1.8.A1 Geeignete Aufstellung von Speichersystemen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_8_Speicherlösungen.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.8.A10', 'SYS - IT-Systeme', 'SYS.1.8 Speicherlösungen', 'SYS.1.8.A10 Erstellung und Pflege eines Betriebshandbuchs', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_8_Speicherlösungen.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.8.A11', 'SYS - IT-Systeme', 'SYS.1.8 Speicherlösungen', 'SYS.1.8.A11 Sicherer Betrieb einer Speicherlösung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_8_Speicherlösungen.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.8.A12', 'SYS - IT-Systeme', 'SYS.1.8 Speicherlösungen', 'SYS.1.8.A12 Schulung der Administratoren', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_8_Speicherlösungen.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.8.A13', 'SYS - IT-Systeme', 'SYS.1.8 Speicherlösungen', 'SYS.1.8.A13 Überwachung und Verwaltung von Speicherlösungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_8_Speicherlösungen.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.8.A14', 'SYS - IT-Systeme', 'SYS.1.8 Speicherlösungen', 'SYS.1.8.A14 Absicherung eines SANs durch Segmentierung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_8_Speicherlösungen.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.8.A15', 'SYS - IT-Systeme', 'SYS.1.8 Speicherlösungen', 'SYS.1.8.A15 Sichere Trennung von Mandanten in Speicherlösungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_8_Speicherlösungen.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.8.A16', 'SYS - IT-Systeme', 'SYS.1.8 Speicherlösungen', 'SYS.1.8.A16 Sicheres Löschen in SAN-Umgebungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_8_Speicherlösungen.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.8.A17', 'SYS - IT-Systeme', 'SYS.1.8 Speicherlösungen', 'SYS.1.8.A17 Dokumentation der Systemeinstellungen von Speichersystemen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_8_Speicherlösungen.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.8.A18', 'SYS - IT-Systeme', 'SYS.1.8 Speicherlösungen', 'SYS.1.8.A18 Sicherheitsaudits und Berichtswesen bei Speichersystemen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_8_Speicherlösungen.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.8.A19', 'SYS - IT-Systeme', 'SYS.1.8 Speicherlösungen', 'SYS.1.8.A19 Aussonderung von Speicherlösungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_8_Speicherlösungen.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.8.A2', 'SYS - IT-Systeme', 'SYS.1.8 Speicherlösungen', 'SYS.1.8.A2 Sichere Grundkonfiguration von Speicherlösungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_8_Speicherlösungen.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.8.A20', 'SYS - IT-Systeme', 'SYS.1.8 Speicherlösungen', 'SYS.1.8.A20 Notfallvorsorge und Notfallreaktion für Speicherlösungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_8_Speicherlösungen.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.8.A21', 'SYS - IT-Systeme', 'SYS.1.8 Speicherlösungen', 'SYS.1.8.A21 Einsatz von Speicherpools zur Mandantentrennung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_8_Speicherlösungen.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.8.A22', 'SYS - IT-Systeme', 'SYS.1.8 Speicherlösungen', 'SYS.1.8.A22 Einsatz einer hochverfügbaren SAN-Lösung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_8_Speicherlösungen.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.8.A23', 'SYS - IT-Systeme', 'SYS.1.8 Speicherlösungen', 'SYS.1.8.A23 Einsatz von Verschlüsselung für Speicherlösungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_8_Speicherlösungen.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.8.A24', 'SYS - IT-Systeme', 'SYS.1.8 Speicherlösungen', 'SYS.1.8.A24 Sicherstellung der Integrität der SAN-Fabric', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_8_Speicherlösungen.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.8.A25', 'SYS - IT-Systeme', 'SYS.1.8 Speicherlösungen', 'SYS.1.8.A25 Mehrfaches Überschreiben der Daten einer LUN', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_8_Speicherlösungen.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.8.A26', 'SYS - IT-Systeme', 'SYS.1.8 Speicherlösungen', 'SYS.1.8.A26 Absicherung eines SANs durch Hard-Zoning', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_8_Speicherlösungen.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.8.A3', 'SYS - IT-Systeme', 'SYS.1.8 Speicherlösungen', 'SYS.1.8.A3 Restriktive Rechtevergabe', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_8_Speicherlösungen.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.8.A4', 'SYS - IT-Systeme', 'SYS.1.8 Speicherlösungen', 'SYS.1.8.A4 Schutz der Administrationsschnittstellen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_8_Speicherlösungen.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.8.A5', 'SYS - IT-Systeme', 'SYS.1.8 Speicherlösungen', 'SYS.1.8.A5 Protokollierung bei Speichersystemen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_8_Speicherlösungen.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.8.A6', 'SYS - IT-Systeme', 'SYS.1.8 Speicherlösungen', 'SYS.1.8.A6 Erstellung einer Sicherheitsrichtlinie für Speicherlösungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_8_Speicherlösungen.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.8.A7', 'SYS - IT-Systeme', 'SYS.1.8 Speicherlösungen', 'SYS.1.8.A7 Planung von Speicherlösungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_8_Speicherlösungen.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.8.A8', 'SYS - IT-Systeme', 'SYS.1.8 Speicherlösungen', 'SYS.1.8.A8 Auswahl einer geeigneten Speicherlösung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_8_Speicherlösungen.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.1.8.A9', 'SYS - IT-Systeme', 'SYS.1.8 Speicherlösungen', 'SYS.1.8.A9 Auswahl von Lieferanten für eine Speicherlösung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_1_8_Speicherlösungen.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.1.A1', 'SYS - IT-Systeme', 'SYS.2.1 Allgemeiner Client', 'SYS.2.1.A1 Sichere Benutzerauthentisierung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_1_Allgemeiner_Client.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.1.A10', 'SYS - IT-Systeme', 'SYS.2.1 Allgemeiner Client', 'SYS.2.1.A10 Planung des Einsatzes von Clients', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_1_Allgemeiner_Client.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.1.A11', 'SYS - IT-Systeme', 'SYS.2.1 Allgemeiner Client', 'SYS.2.1.A11 Beschaffung von Clients', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_1_Allgemeiner_Client.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.1.A12', 'SYS - IT-Systeme', 'SYS.2.1 Allgemeiner Client', 'SYS.2.1.A12 Kompatibilitätsprüfung von Software', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_1_Allgemeiner_Client.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.1.A13', 'SYS - IT-Systeme', 'SYS.2.1 Allgemeiner Client', 'SYS.2.1.A13 Zugriff auf Ausführungsumgebungen mit unbeobachtbarer Codeausführung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_1_Allgemeiner_Client.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.1.A14', 'SYS - IT-Systeme', 'SYS.2.1 Allgemeiner Client', 'SYS.2.1.A14 Updates und Patches für Firmware, Betriebssystem und Anwendungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_1_Allgemeiner_Client.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.1.A15', 'SYS - IT-Systeme', 'SYS.2.1 Allgemeiner Client', 'SYS.2.1.A15 Sichere Installation und Konfiguration von Clients', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_1_Allgemeiner_Client.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.1.A16', 'SYS - IT-Systeme', 'SYS.2.1 Allgemeiner Client', 'SYS.2.1.A16 Deaktivierung und Deinstallation nicht benötigter Komponenten und Kennungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_1_Allgemeiner_Client.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.1.A17', 'SYS - IT-Systeme', 'SYS.2.1 Allgemeiner Client', 'SYS.2.1.A17 Einsatzfreigabe für Clients', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_1_Allgemeiner_Client.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.1.A18', 'SYS - IT-Systeme', 'SYS.2.1 Allgemeiner Client', 'SYS.2.1.A18 Nutzung von TLS', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_1_Allgemeiner_Client.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.1.A19', 'SYS - IT-Systeme', 'SYS.2.1 Allgemeiner Client', 'SYS.2.1.A19 Restriktive Rechtevergabe', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_1_Allgemeiner_Client.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.1.A2', 'SYS - IT-Systeme', 'SYS.2.1 Allgemeiner Client', 'SYS.2.1.A2 Rollentrennung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_1_Allgemeiner_Client.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.1.A20', 'SYS - IT-Systeme', 'SYS.2.1 Allgemeiner Client', 'SYS.2.1.A20 Schutz der Administrationsschnittstellen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_1_Allgemeiner_Client.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.1.A21', 'SYS - IT-Systeme', 'SYS.2.1 Allgemeiner Client', 'SYS.2.1.A21 Verhinderung der unautorisierten Nutzung von Rechnermikrofonen und Kameras', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_1_Allgemeiner_Client.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.1.A22', 'SYS - IT-Systeme', 'SYS.2.1 Allgemeiner Client', 'SYS.2.1.A22 Abmelden nach Aufgabenerfüllung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_1_Allgemeiner_Client.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.1.A23', 'SYS - IT-Systeme', 'SYS.2.1 Allgemeiner Client', 'SYS.2.1.A23 Bevorzugung von Client-Server-Diensten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_1_Allgemeiner_Client.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.1.A24', 'SYS - IT-Systeme', 'SYS.2.1 Allgemeiner Client', 'SYS.2.1.A24 Umgang mit externen Medien und Wechseldatenträgern', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_1_Allgemeiner_Client.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.1.A25', 'SYS - IT-Systeme', 'SYS.2.1 Allgemeiner Client', 'SYS.2.1.A25 Mitarbeiterrichtlinie zur sicheren IT-Nutzung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_1_Allgemeiner_Client.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.1.A26', 'SYS - IT-Systeme', 'SYS.2.1 Allgemeiner Client', 'SYS.2.1.A26 Schutz vor Ausnutzung von Schwachstellen in Anwendungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_1_Allgemeiner_Client.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.1.A27', 'SYS - IT-Systeme', 'SYS.2.1 Allgemeiner Client', 'SYS.2.1.A27 Geregelte Außerbetriebnahme eines Clients', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_1_Allgemeiner_Client.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.1.A28', 'SYS - IT-Systeme', 'SYS.2.1 Allgemeiner Client', 'SYS.2.1.A28 Verschlüsselung der Clients', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_1_Allgemeiner_Client.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.1.A29', 'SYS - IT-Systeme', 'SYS.2.1 Allgemeiner Client', 'SYS.2.1.A29 Systemüberwachung und Monitoring der Clients', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_1_Allgemeiner_Client.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.1.A3', 'SYS - IT-Systeme', 'SYS.2.1 Allgemeiner Client', 'SYS.2.1.A3 Aktivieren von Autoupdate-Mechanismen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_1_Allgemeiner_Client.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.1.A30', 'SYS - IT-Systeme', 'SYS.2.1 Allgemeiner Client', 'SYS.2.1.A30 Einrichten einer Referenzinstallation für Clients', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_1_Allgemeiner_Client.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.1.A31', 'SYS - IT-Systeme', 'SYS.2.1 Allgemeiner Client', 'SYS.2.1.A31 Einrichtung lokaler Paketfilter', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_1_Allgemeiner_Client.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.1.A32', 'SYS - IT-Systeme', 'SYS.2.1 Allgemeiner Client', 'SYS.2.1.A32 Einsatz zusätzlicher Maßnahmen zum Schutz vor Exploits', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_1_Allgemeiner_Client.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.1.A33', 'SYS - IT-Systeme', 'SYS.2.1 Allgemeiner Client', 'SYS.2.1.A33 Application Whitelisting', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_1_Allgemeiner_Client.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.1.A34', 'SYS - IT-Systeme', 'SYS.2.1 Allgemeiner Client', 'SYS.2.1.A34 Einsatz von Anwendungsisolation', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_1_Allgemeiner_Client.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.1.A35', 'SYS - IT-Systeme', 'SYS.2.1 Allgemeiner Client', 'SYS.2.1.A35 Aktive Verwaltung der Wurzelzertifikate', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_1_Allgemeiner_Client.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.1.A36', 'SYS - IT-Systeme', 'SYS.2.1 Allgemeiner Client', 'SYS.2.1.A36 Selbstverwalteter Einsatz von SecureBoot und TPM', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_1_Allgemeiner_Client.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.1.A37', 'SYS - IT-Systeme', 'SYS.2.1 Allgemeiner Client', 'SYS.2.1.A37 Verwendung von Mehr-Faktor-Authentisierung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_1_Allgemeiner_Client.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.1.A38', 'SYS - IT-Systeme', 'SYS.2.1 Allgemeiner Client', 'SYS.2.1.A38 Einbindung in die Notfallplanung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_1_Allgemeiner_Client.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.1.A39', 'SYS - IT-Systeme', 'SYS.2.1 Allgemeiner Client', 'SYS.2.1.A39 Unterbrechungsfreie und stabile Stromversorgung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_1_Allgemeiner_Client.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.1.A4', 'SYS - IT-Systeme', 'SYS.2.1 Allgemeiner Client', 'SYS.2.1.A4 Regelmäßige Datensicherung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_1_Allgemeiner_Client.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.1.A40', 'SYS - IT-Systeme', 'SYS.2.1 Allgemeiner Client', 'SYS.2.1.A40 Betriebsdokumentation', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_1_Allgemeiner_Client.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.1.A41', 'SYS - IT-Systeme', 'SYS.2.1 Allgemeiner Client', 'SYS.2.1.A41 Verhinderung der Überlastung der lokalen Festplatte', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_1_Allgemeiner_Client.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.1.A5', 'SYS - IT-Systeme', 'SYS.2.1 Allgemeiner Client', 'SYS.2.1.A5 Verwendung einer Bildschirmsperre', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_1_Allgemeiner_Client.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.1.A6', 'SYS - IT-Systeme', 'SYS.2.1 Allgemeiner Client', 'SYS.2.1.A6 Einsatz von Viren-Schutzprogrammen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_1_Allgemeiner_Client.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.1.A7', 'SYS - IT-Systeme', 'SYS.2.1 Allgemeiner Client', 'SYS.2.1.A7 Protokollierung auf Clients', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_1_Allgemeiner_Client.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.1.A8', 'SYS - IT-Systeme', 'SYS.2.1 Allgemeiner Client', 'SYS.2.1.A8 Absicherung des Bootvorgangs', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_1_Allgemeiner_Client.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.1.A9', 'SYS - IT-Systeme', 'SYS.2.1 Allgemeiner Client', 'SYS.2.1.A9 Festlegung einer Sicherheitsrichtlinie für Clients', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_1_Allgemeiner_Client.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.2.2.A1', 'SYS - IT-Systeme', 'SYS.2.2.2 Clients unter Windows 8.1', 'SYS.2.2.2.A1 Auswahl einer geeigneten Windows 8.1-Version', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_2_2_Clients_unter_Windows_8_1.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.2.2.A10', 'SYS - IT-Systeme', 'SYS.2.2.2 Clients unter Windows 8.1', 'SYS.2.2.2.A10 Integration von Online-Konten in das Betriebssystem', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_2_2_Clients_unter_Windows_8_1.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.2.2.A11', 'SYS - IT-Systeme', 'SYS.2.2.2 Clients unter Windows 8.1', 'SYS.2.2.2.A11 Konfiguration von Synchronisationsmechanismen in Windows 8.1', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_2_2_Clients_unter_Windows_8_1.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.2.2.A12', 'SYS - IT-Systeme', 'SYS.2.2.2 Clients unter Windows 8.1', 'SYS.2.2.2.A12 Sichere zentrale Authentisierung in Windows-Netzen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_2_2_Clients_unter_Windows_8_1.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.2.2.A13', 'SYS - IT-Systeme', 'SYS.2.2.2 Clients unter Windows 8.1', 'SYS.2.2.2.A13 Anbindung von Windows 8.1 an den Microsoft Store', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_2_2_Clients_unter_Windows_8_1.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.2.2.A14', 'SYS - IT-Systeme', 'SYS.2.2.2 Clients unter Windows 8.1', 'SYS.2.2.2.A14 Anwendungssteuerung mit Software Restriction Policies und AppLocker', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_2_2_Clients_unter_Windows_8_1.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.2.2.A15', 'SYS - IT-Systeme', 'SYS.2.2.2 Clients unter Windows 8.1', 'SYS.2.2.2.A15 Verschlüsselung des Dateisystems mit EFS', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_2_2_Clients_unter_Windows_8_1.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.2.2.A16', 'SYS - IT-Systeme', 'SYS.2.2.2 Clients unter Windows 8.1', 'SYS.2.2.2.A16 Verwendung der Windows PowerShell', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_2_2_Clients_unter_Windows_8_1.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.2.2.A17', 'SYS - IT-Systeme', 'SYS.2.2.2 Clients unter Windows 8.1', 'SYS.2.2.2.A17 Sicherer Einsatz des Wartungscenters', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_2_2_Clients_unter_Windows_8_1.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.2.2.A18', 'SYS - IT-Systeme', 'SYS.2.2.2 Clients unter Windows 8.1', 'SYS.2.2.2.A18 Aktivierung des Last-Access-Zeitstempels', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_2_2_Clients_unter_Windows_8_1.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.2.2.A19', 'SYS - IT-Systeme', 'SYS.2.2.2 Clients unter Windows 8.1', 'SYS.2.2.2.A19 Verwendung der Anmeldeinformationsverwaltung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_2_2_Clients_unter_Windows_8_1.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.2.2.A2', 'SYS - IT-Systeme', 'SYS.2.2.2 Clients unter Windows 8.1', 'SYS.2.2.2.A2 Festlegung eines Anmeldeverfahrens für Windows 8.1', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_2_2_Clients_unter_Windows_8_1.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.2.2.A20', 'SYS - IT-Systeme', 'SYS.2.2.2 Clients unter Windows 8.1', 'SYS.2.2.2.A20 Sicherheit beim Fernzugriff über RDP', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_2_2_Clients_unter_Windows_8_1.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.2.2.A21', 'SYS - IT-Systeme', 'SYS.2.2.2 Clients unter Windows 8.1', 'SYS.2.2.2.A21 Einsatz von File und Registry Virtualization', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_2_2_Clients_unter_Windows_8_1.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.2.2.A3', 'SYS - IT-Systeme', 'SYS.2.2.2 Clients unter Windows 8.1', 'SYS.2.2.2.A3 Einsatz von Viren-Schutzprogrammen unter Windows 8.1', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_2_2_Clients_unter_Windows_8_1.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.2.2.A4', 'SYS - IT-Systeme', 'SYS.2.2.2 Clients unter Windows 8.1', 'SYS.2.2.2.A4 Beschaffung von Windows 8.1', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_2_2_Clients_unter_Windows_8_1.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.2.2.A5', 'SYS - IT-Systeme', 'SYS.2.2.2 Clients unter Windows 8.1', 'SYS.2.2.2.A5 Lokale Sicherheitsrichtlinien für Windows 8.1', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_2_2_Clients_unter_Windows_8_1.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.2.2.A6', 'SYS - IT-Systeme', 'SYS.2.2.2 Clients unter Windows 8.1', 'SYS.2.2.2.A6 Datei- und Freigabeberechtigungen unter Windows 8.1', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_2_2_Clients_unter_Windows_8_1.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.2.2.A7', 'SYS - IT-Systeme', 'SYS.2.2.2 Clients unter Windows 8.1', 'SYS.2.2.2.A7 Einsatz der Windows-Benutzerkontensteuerung UAC', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_2_2_Clients_unter_Windows_8_1.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.2.2.A8', 'SYS - IT-Systeme', 'SYS.2.2.2 Clients unter Windows 8.1', 'SYS.2.2.2.A8 Keine Verwendung der Heimnetzgruppen-Funktion', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_2_2_Clients_unter_Windows_8_1.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.2.2.A9', 'SYS - IT-Systeme', 'SYS.2.2.2 Clients unter Windows 8.1', 'SYS.2.2.2.A9 Datenschutz und Datensparsamkeit bei Windows 8.1-Clients', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_2_2_Clients_unter_Windows_8_1.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.2.3.A1', 'SYS - IT-Systeme', 'SYS.2.2.3 Clients unter Windows 10', 'SYS.2.2.3.A1 Planung des Einsatzes von Cloud-Diensten unter Windows 10', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_2_3_Clients_unter_Windows 10.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.2.3.A10', 'SYS - IT-Systeme', 'SYS.2.2.3 Clients unter Windows 10', 'SYS.2.2.3.A10 Konfiguration zum Schutz von Anwendungen unter Windows 10', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_2_3_Clients_unter_Windows 10.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.2.3.A11', 'SYS - IT-Systeme', 'SYS.2.2.3 Clients unter Windows 10', 'SYS.2.2.3.A11 Schutz der Anmeldeinformationen unter Windows 10', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_2_3_Clients_unter_Windows 10.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.2.3.A12', 'SYS - IT-Systeme', 'SYS.2.2.3 Clients unter Windows 10', 'SYS.2.2.3.A12 Datei- und Freigabeberechtigungen unter Windows 10', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_2_3_Clients_unter_Windows 10.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.2.3.A13', 'SYS - IT-Systeme', 'SYS.2.2.3 Clients unter Windows 10', 'SYS.2.2.3.A13 Einsatz der SmartScreen-Funktion', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_2_3_Clients_unter_Windows 10.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.2.3.A14', 'SYS - IT-Systeme', 'SYS.2.2.3 Clients unter Windows 10', 'SYS.2.2.3.A14 Einsatz des Sprachassistenten Cortana', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_2_3_Clients_unter_Windows 10.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.2.3.A15', 'SYS - IT-Systeme', 'SYS.2.2.3 Clients unter Windows 10', 'SYS.2.2.3.A15 Einsatz der Synchronisationsmechanismen unter Windows 10', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_2_3_Clients_unter_Windows 10.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.2.3.A16', 'SYS - IT-Systeme', 'SYS.2.2.3 Clients unter Windows 10', 'SYS.2.2.3.A16 Anbindung von Windows 10 an den Microsoft-Store', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_2_3_Clients_unter_Windows 10.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.2.3.A17', 'SYS - IT-Systeme', 'SYS.2.2.3 Clients unter Windows 10', 'SYS.2.2.3.A17 Keine Speicherung von Daten zur automatischen Anmeldung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_2_3_Clients_unter_Windows 10.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.2.3.A18', 'SYS - IT-Systeme', 'SYS.2.2.3 Clients unter Windows 10', 'SYS.2.2.3.A18 Einsatz der Windows-Remoteunterstützung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_2_3_Clients_unter_Windows 10.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.2.3.A19', 'SYS - IT-Systeme', 'SYS.2.2.3 Clients unter Windows 10', 'SYS.2.2.3.A19 Sicherheit beim Fernzugriff über RDP', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_2_3_Clients_unter_Windows 10.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.2.3.A2', 'SYS - IT-Systeme', 'SYS.2.2.3 Clients unter Windows 10', 'SYS.2.2.3.A2 Auswahl und Beschaffung einer geeigneten Windows 10-Version', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_2_3_Clients_unter_Windows 10.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.2.3.A20', 'SYS - IT-Systeme', 'SYS.2.2.3 Clients unter Windows 10', 'SYS.2.2.3.A20 Einsatz der Benutzerkontensteuerung UAC für privilegierte Konten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_2_3_Clients_unter_Windows 10.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.2.3.A21', 'SYS - IT-Systeme', 'SYS.2.2.3 Clients unter Windows 10', 'SYS.2.2.3.A21 Einsatz des Encrypting File Systems', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_2_3_Clients_unter_Windows 10.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.2.3.A22', 'SYS - IT-Systeme', 'SYS.2.2.3 Clients unter Windows 10', 'SYS.2.2.3.A22 Verwendung der Windows PowerShell', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_2_3_Clients_unter_Windows 10.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.2.3.A23', 'SYS - IT-Systeme', 'SYS.2.2.3 Clients unter Windows 10', 'SYS.2.2.3.A23 Erweiterter Schutz der Anmeldeinformationen unter Windows 10', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_2_3_Clients_unter_Windows 10.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.2.3.A24', 'SYS - IT-Systeme', 'SYS.2.2.3 Clients unter Windows 10', 'SYS.2.2.3.A24 Aktivierung des Last-Access-Zeitstempels', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_2_3_Clients_unter_Windows 10.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.2.3.A25', 'SYS - IT-Systeme', 'SYS.2.2.3 Clients unter Windows 10', 'SYS.2.2.3.A25 Umgang mit Fernzugriffsfunktionen der „Connected User Experience and Telemetry“', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_2_3_Clients_unter_Windows 10.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.2.3.A3', 'SYS - IT-Systeme', 'SYS.2.2.3 Clients unter Windows 10', 'SYS.2.2.3.A3 ENTFALLEN', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_2_3_Clients_unter_Windows 10.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.2.3.A4', 'SYS - IT-Systeme', 'SYS.2.2.3 Clients unter Windows 10', 'SYS.2.2.3.A4 Telemetrie und Datenschutzeinstellungen unter Windows 10', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_2_3_Clients_unter_Windows 10.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.2.3.A5', 'SYS - IT-Systeme', 'SYS.2.2.3 Clients unter Windows 10', 'SYS.2.2.3.A5 Schutz vor Schadsoftware unter Windows 10', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_2_3_Clients_unter_Windows 10.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.2.3.A6', 'SYS - IT-Systeme', 'SYS.2.2.3 Clients unter Windows 10', 'SYS.2.2.3.A6 Integration von Online-Konten in das Betriebssystem', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_2_3_Clients_unter_Windows 10.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.2.3.A7', 'SYS - IT-Systeme', 'SYS.2.2.3 Clients unter Windows 10', 'SYS.2.2.3.A7 Lokale Sicherheitsrichtlinien für Windows 10', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_2_3_Clients_unter_Windows 10.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.2.3.A8', 'SYS - IT-Systeme', 'SYS.2.2.3 Clients unter Windows 10', 'SYS.2.2.3.A8 Zentrale Verwaltung der Sicherheitsrichtlinien von Clients', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_2_3_Clients_unter_Windows 10.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.2.3.A9', 'SYS - IT-Systeme', 'SYS.2.2.3 Clients unter Windows 10', 'SYS.2.2.3.A9 Sichere zentrale Authentisierung in Windows-Netzen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_2_3_Clients_unter_Windows 10.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.3.A1', 'SYS - IT-Systeme', 'SYS.2.3 Clients unter Linux und Unix', 'SYS.2.3.A1 Authentisierung von Administratoren und Benutzern', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_3_Clients_unter_Linux_und_Unix.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.3.A10', 'SYS - IT-Systeme', 'SYS.2.3 Clients unter Linux und Unix', 'SYS.2.3.A10 ENTFALLEN', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_3_Clients_unter_Linux_und_Unix.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.3.A11', 'SYS - IT-Systeme', 'SYS.2.3 Clients unter Linux und Unix', 'SYS.2.3.A11 Verhinderung der Überlastung der lokalen Festplatte', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_3_Clients_unter_Linux_und_Unix.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.3.A12', 'SYS - IT-Systeme', 'SYS.2.3 Clients unter Linux und Unix', 'SYS.2.3.A12 Sicherer Einsatz von Appliances', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_3_Clients_unter_Linux_und_Unix.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.3.A13', 'SYS - IT-Systeme', 'SYS.2.3 Clients unter Linux und Unix', 'SYS.2.3.A13 ENTFALLEN', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_3_Clients_unter_Linux_und_Unix.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.3.A14', 'SYS - IT-Systeme', 'SYS.2.3 Clients unter Linux und Unix', 'SYS.2.3.A14 Absicherung gegen Nutzung unbefugter Peripheriegeräte', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_3_Clients_unter_Linux_und_Unix.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.3.A15', 'SYS - IT-Systeme', 'SYS.2.3 Clients unter Linux und Unix', 'SYS.2.3.A15 Zusätzlicher Schutz vor der Ausführung unerwünschter Dateien', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_3_Clients_unter_Linux_und_Unix.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.3.A16', 'SYS - IT-Systeme', 'SYS.2.3 Clients unter Linux und Unix', 'SYS.2.3.A16 Zusätzliche Absicherung des Bootvorgangs', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_3_Clients_unter_Linux_und_Unix.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.3.A17', 'SYS - IT-Systeme', 'SYS.2.3 Clients unter Linux und Unix', 'SYS.2.3.A17 Zusätzliche Verhinderung der Ausbreitung bei der Ausnutzung von Schwachstellen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_3_Clients_unter_Linux_und_Unix.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.3.A18', 'SYS - IT-Systeme', 'SYS.2.3 Clients unter Linux und Unix', 'SYS.2.3.A18 Zusätzlicher Schutz des Kernels', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_3_Clients_unter_Linux_und_Unix.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.3.A19', 'SYS - IT-Systeme', 'SYS.2.3 Clients unter Linux und Unix', 'SYS.2.3.A19 Festplatten- oder Dateiverschlüsselung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_3_Clients_unter_Linux_und_Unix.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.3.A2', 'SYS - IT-Systeme', 'SYS.2.3 Clients unter Linux und Unix', 'SYS.2.3.A2 Auswahl einer geeigneten Distribution', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_3_Clients_unter_Linux_und_Unix.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.3.A20', 'SYS - IT-Systeme', 'SYS.2.3 Clients unter Linux und Unix', 'SYS.2.3.A20 Abschaltung kritischer SysRq-Funktionen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_3_Clients_unter_Linux_und_Unix.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.3.A3', 'SYS - IT-Systeme', 'SYS.2.3 Clients unter Linux und Unix', 'SYS.2.3.A3 Nutzung von Cloud- und Online-Funktionen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_3_Clients_unter_Linux_und_Unix.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.3.A4', 'SYS - IT-Systeme', 'SYS.2.3 Clients unter Linux und Unix', 'SYS.2.3.A4 Einspielen von Updates und Patches auf unixartigen Systemen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_3_Clients_unter_Linux_und_Unix.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.3.A5', 'SYS - IT-Systeme', 'SYS.2.3 Clients unter Linux und Unix', 'SYS.2.3.A5 Sichere Installation von Software-Paketen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_3_Clients_unter_Linux_und_Unix.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.3.A6', 'SYS - IT-Systeme', 'SYS.2.3 Clients unter Linux und Unix', 'SYS.2.3.A6 Kein automatisches Einbinden von Wechsellaufwerken', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_3_Clients_unter_Linux_und_Unix.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.3.A7', 'SYS - IT-Systeme', 'SYS.2.3 Clients unter Linux und Unix', 'SYS.2.3.A7 Restriktive Rechtevergabe auf Dateien und Verzeichnisse', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_3_Clients_unter_Linux_und_Unix.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.3.A8', 'SYS - IT-Systeme', 'SYS.2.3 Clients unter Linux und Unix', 'SYS.2.3.A8 Einsatz von Techniken zur Rechtebeschränkung von Anwendungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_3_Clients_unter_Linux_und_Unix.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.3.A9', 'SYS - IT-Systeme', 'SYS.2.3 Clients unter Linux und Unix', 'SYS.2.3.A9 Sichere Verwendung von Passwörtern auf der Kommandozeile', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_3_Clients_unter_Linux_und_Unix.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.4.A1', 'SYS - IT-Systeme', 'SYS.2.4 Clients unter macOS', 'SYS.2.4.A1 Planung des sicheren Einsatzes von macOS', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_4_Clients_unter_macOS.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.4.A10', 'SYS - IT-Systeme', 'SYS.2.4 Clients unter macOS', 'SYS.2.4.A10 Aktivierung der Personal Firewall unter macOS', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_4_Clients_unter_macOS.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.4.A11', 'SYS - IT-Systeme', 'SYS.2.4 Clients unter macOS', 'SYS.2.4.A11 Geräteaussonderung von Macs', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_4_Clients_unter_macOS.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.4.A12', 'SYS - IT-Systeme', 'SYS.2.4 Clients unter macOS', 'SYS.2.4.A12 Firmware-Kennwort und Boot-Schutz auf Macs', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_4_Clients_unter_macOS.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.4.A2', 'SYS - IT-Systeme', 'SYS.2.4 Clients unter macOS', 'SYS.2.4.A2 Nutzung der integrierten Sicherheitsfunktionen von macOS', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_4_Clients_unter_macOS.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.4.A3', 'SYS - IT-Systeme', 'SYS.2.4 Clients unter macOS', 'SYS.2.4.A3 Verwendung geeigneter Benutzerkonten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_4_Clients_unter_macOS.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.4.A4', 'SYS - IT-Systeme', 'SYS.2.4 Clients unter macOS', 'SYS.2.4.A4 Verwendung einer Festplattenverschlüsselung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_4_Clients_unter_macOS.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.4.A5', 'SYS - IT-Systeme', 'SYS.2.4 Clients unter macOS', 'SYS.2.4.A5 Deaktivierung sicherheitskritischer Funktionen von macOS', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_4_Clients_unter_macOS.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.4.A6', 'SYS - IT-Systeme', 'SYS.2.4 Clients unter macOS', 'SYS.2.4.A6 Verwendung aktueller Mac-Hardware', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_4_Clients_unter_macOS.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.4.A7', 'SYS - IT-Systeme', 'SYS.2.4 Clients unter macOS', 'SYS.2.4.A7 Zwei-Faktor-Authentisierung für Apple-ID', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_4_Clients_unter_macOS.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.4.A8', 'SYS - IT-Systeme', 'SYS.2.4 Clients unter macOS', 'SYS.2.4.A8 Keine Nutzung von iCloud für schützenswerte Daten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_4_Clients_unter_macOS.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.2.4.A9', 'SYS - IT-Systeme', 'SYS.2.4 Clients unter macOS', 'SYS.2.4.A9 Verwendung von zusätzlichen Schutzprogrammen unter macOS', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_2_4_Clients_unter_macOS.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.1.A1', 'SYS - IT-Systeme', 'SYS.3.1 Laptops', 'SYS.3.1.A1 Regelungen zur mobilen Nutzung von Laptops', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_1_Laptops.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.1.A10', 'SYS - IT-Systeme', 'SYS.3.1 Laptops', 'SYS.3.1.A10 Abgleich der Datenbestände von Laptops', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_1_Laptops.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.1.A11', 'SYS - IT-Systeme', 'SYS.3.1 Laptops', 'SYS.3.1.A11 Sicherstellung der Energieversorgung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_1_Laptops.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.1.A12', 'SYS - IT-Systeme', 'SYS.3.1 Laptops', 'SYS.3.1.A12 Verlustmeldung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_1_Laptops.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.1.A13', 'SYS - IT-Systeme', 'SYS.3.1 Laptops', 'SYS.3.1.A13 Verschlüsselung von Laptops', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_1_Laptops.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.1.A14', 'SYS - IT-Systeme', 'SYS.3.1 Laptops', 'SYS.3.1.A14 Geeignete Aufbewahrung von Laptops', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_1_Laptops.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.1.A15', 'SYS - IT-Systeme', 'SYS.3.1 Laptops', 'SYS.3.1.A15 Geeignete Auswahl von Laptops', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_1_Laptops.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.1.A16', 'SYS - IT-Systeme', 'SYS.3.1 Laptops', 'SYS.3.1.A16 Zentrale Administration von Laptops', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_1_Laptops.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.1.A17', 'SYS - IT-Systeme', 'SYS.3.1 Laptops', 'SYS.3.1.A17 Sammelaufbewahrung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_1_Laptops.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.1.A18', 'SYS - IT-Systeme', 'SYS.3.1 Laptops', 'SYS.3.1.A18 Einsatz von Diebstahl-Sicherungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_1_Laptops.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.1.A2', 'SYS - IT-Systeme', 'SYS.3.1 Laptops', 'SYS.3.1.A2 Zugriffsschutz am Laptop', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_1_Laptops.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.1.A3', 'SYS - IT-Systeme', 'SYS.3.1 Laptops', 'SYS.3.1.A3 Einsatz von Personal Firewalls', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_1_Laptops.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.1.A4', 'SYS - IT-Systeme', 'SYS.3.1 Laptops', 'SYS.3.1.A4 Einsatz von Antivirenprogrammen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_1_Laptops.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.1.A5', 'SYS - IT-Systeme', 'SYS.3.1 Laptops', 'SYS.3.1.A5 Datensicherung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_1_Laptops.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.1.A6', 'SYS - IT-Systeme', 'SYS.3.1 Laptops', 'SYS.3.1.A6 Sicherheitsrichtlinien für Laptops', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_1_Laptops.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.1.A7', 'SYS - IT-Systeme', 'SYS.3.1 Laptops', 'SYS.3.1.A7 Geregelte Übergabe und Rücknahme eines Laptops', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_1_Laptops.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.1.A8', 'SYS - IT-Systeme', 'SYS.3.1 Laptops', 'SYS.3.1.A8 Sicherer Anschluss von Laptops an Datennetze', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_1_Laptops.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.1.A9', 'SYS - IT-Systeme', 'SYS.3.1 Laptops', 'SYS.3.1.A9 Sicherer Fernzugriff', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_1_Laptops.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.2.1.A1', 'SYS - IT-Systeme', 'SYS.3.2.1 Allgemeine Smartphones und Tablets', 'SYS.3.2.1.A1 Festlegung einer Richtlinie für den Einsatz von Smartphones und Tablets', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_2_1_Allgemeine_Smartphones_und_Tablets.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.2.1.A10', 'SYS - IT-Systeme', 'SYS.3.2.1 Allgemeine Smartphones und Tablets', 'SYS.3.2.1.A10 Richtlinie für Mitarbeiter zur Benutzung von mobilen Geräten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_2_1_Allgemeine_Smartphones_und_Tablets.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.2.1.A11', 'SYS - IT-Systeme', 'SYS.3.2.1 Allgemeine Smartphones und Tablets', 'SYS.3.2.1.A11 Verschlüsselung des Speichers', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_2_1_Allgemeine_Smartphones_und_Tablets.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.2.1.A12', 'SYS - IT-Systeme', 'SYS.3.2.1 Allgemeine Smartphones und Tablets', 'SYS.3.2.1.A12 Verwendung nicht personalisierter Gerätenamen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_2_1_Allgemeine_Smartphones_und_Tablets.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.2.1.A13', 'SYS - IT-Systeme', 'SYS.3.2.1 Allgemeine Smartphones und Tablets', 'SYS.3.2.1.A13 Regelungen zum Screensharing und Casting', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_2_1_Allgemeine_Smartphones_und_Tablets.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.2.1.A14', 'SYS - IT-Systeme', 'SYS.3.2.1 Allgemeine Smartphones und Tablets', 'SYS.3.2.1.A14 Schutz vor Phishing und Schadprogrammen im Browser', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_2_1_Allgemeine_Smartphones_und_Tablets.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.2.1.A15', 'SYS - IT-Systeme', 'SYS.3.2.1 Allgemeine Smartphones und Tablets', 'SYS.3.2.1.A15 Deaktivierung von Download-Boostern', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_2_1_Allgemeine_Smartphones_und_Tablets.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.2.1.A16', 'SYS - IT-Systeme', 'SYS.3.2.1 Allgemeine Smartphones und Tablets', 'SYS.3.2.1.A16 Deaktivierung nicht benutzter Kommunikationsschnittstellen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_2_1_Allgemeine_Smartphones_und_Tablets.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.2.1.A17', 'SYS - IT-Systeme', 'SYS.3.2.1 Allgemeine Smartphones und Tablets', 'SYS.3.2.1.A17 Verwendung der SIM-Karten-PIN', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_2_1_Allgemeine_Smartphones_und_Tablets.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.2.1.A18', 'SYS - IT-Systeme', 'SYS.3.2.1 Allgemeine Smartphones und Tablets', 'SYS.3.2.1.A18 Verwendung biometrischer Authentisierung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_2_1_Allgemeine_Smartphones_und_Tablets.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.2.1.A19', 'SYS - IT-Systeme', 'SYS.3.2.1 Allgemeine Smartphones und Tablets', 'SYS.3.2.1.A19 Verwendung von Sprachassistenten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_2_1_Allgemeine_Smartphones_und_Tablets.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.2.1.A2', 'SYS - IT-Systeme', 'SYS.3.2.1 Allgemeine Smartphones und Tablets', 'SYS.3.2.1.A2 Festlegung einer Strategie für die Cloud-Nutzung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_2_1_Allgemeine_Smartphones_und_Tablets.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.2.1.A20', 'SYS - IT-Systeme', 'SYS.3.2.1 Allgemeine Smartphones und Tablets', 'SYS.3.2.1.A20 Auswahl und Freigabe von Apps', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_2_1_Allgemeine_Smartphones_und_Tablets.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.2.1.A21', 'SYS - IT-Systeme', 'SYS.3.2.1 Allgemeine Smartphones und Tablets', 'SYS.3.2.1.A21 Definition der erlaubten Informationen und Applikationen auf mobilen Geräten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_2_1_Allgemeine_Smartphones_und_Tablets.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.2.1.A22', 'SYS - IT-Systeme', 'SYS.3.2.1 Allgemeine Smartphones und Tablets', 'SYS.3.2.1.A22 Einbindung mobiler Geräte in die interne Infrastruktur via VPN', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_2_1_Allgemeine_Smartphones_und_Tablets.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.2.1.A23', 'SYS - IT-Systeme', 'SYS.3.2.1 Allgemeine Smartphones und Tablets', 'SYS.3.2.1.A23 Zusätzliche Authentisierung für vertrauliche Anwendungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_2_1_Allgemeine_Smartphones_und_Tablets.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.2.1.A24', 'SYS - IT-Systeme', 'SYS.3.2.1 Allgemeine Smartphones und Tablets', 'SYS.3.2.1.A24 Einsatz einer geschlossenen Benutzergruppe', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_2_1_Allgemeine_Smartphones_und_Tablets.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.2.1.A25', 'SYS - IT-Systeme', 'SYS.3.2.1 Allgemeine Smartphones und Tablets', 'SYS.3.2.1.A25 Nutzung von getrennten Arbeitsumgebungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_2_1_Allgemeine_Smartphones_und_Tablets.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.2.1.A26', 'SYS - IT-Systeme', 'SYS.3.2.1 Allgemeine Smartphones und Tablets', 'SYS.3.2.1.A26 Nutzung von PIM-Containern', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_2_1_Allgemeine_Smartphones_und_Tablets.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.2.1.A27', 'SYS - IT-Systeme', 'SYS.3.2.1 Allgemeine Smartphones und Tablets', 'SYS.3.2.1.A27 Einsatz besonders abgesicherter Endgeräte', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_2_1_Allgemeine_Smartphones_und_Tablets.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.2.1.A28', 'SYS - IT-Systeme', 'SYS.3.2.1 Allgemeine Smartphones und Tablets', 'SYS.3.2.1.A28 Verwendung der Filteroption für Webseiten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_2_1_Allgemeine_Smartphones_und_Tablets.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.2.1.A29', 'SYS - IT-Systeme', 'SYS.3.2.1 Allgemeine Smartphones und Tablets', 'SYS.3.2.1.A29 Verwendung eines institutionsbezogenen APN', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_2_1_Allgemeine_Smartphones_und_Tablets.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.2.1.A3', 'SYS - IT-Systeme', 'SYS.3.2.1 Allgemeine Smartphones und Tablets', 'SYS.3.2.1.A3 Sichere Grundkonfiguration für mobile Geräte', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_2_1_Allgemeine_Smartphones_und_Tablets.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.2.1.A30', 'SYS - IT-Systeme', 'SYS.3.2.1 Allgemeine Smartphones und Tablets', 'SYS.3.2.1.A30 Einschränkung der App-Installation mittels Whitelist', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_2_1_Allgemeine_Smartphones_und_Tablets.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.2.1.A4', 'SYS - IT-Systeme', 'SYS.3.2.1 Allgemeine Smartphones und Tablets', 'SYS.3.2.1.A4 Verwendung eines Zugriffschutzes', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_2_1_Allgemeine_Smartphones_und_Tablets.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.2.1.A5', 'SYS - IT-Systeme', 'SYS.3.2.1 Allgemeine Smartphones und Tablets', 'SYS.3.2.1.A5 Updates von Betriebssystem und Apps', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_2_1_Allgemeine_Smartphones_und_Tablets.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.2.1.A6', 'SYS - IT-Systeme', 'SYS.3.2.1 Allgemeine Smartphones und Tablets', 'SYS.3.2.1.A6 Datenschutzeinstellungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_2_1_Allgemeine_Smartphones_und_Tablets.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.2.1.A7', 'SYS - IT-Systeme', 'SYS.3.2.1 Allgemeine Smartphones und Tablets', 'SYS.3.2.1.A7 Verhaltensregeln bei Sicherheitsvorfällen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_2_1_Allgemeine_Smartphones_und_Tablets.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.2.1.A8', 'SYS - IT-Systeme', 'SYS.3.2.1 Allgemeine Smartphones und Tablets', 'SYS.3.2.1.A8 Keine Installation von Apps aus unsicheren Quellen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_2_1_Allgemeine_Smartphones_und_Tablets.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.2.1.A9', 'SYS - IT-Systeme', 'SYS.3.2.1 Allgemeine Smartphones und Tablets', 'SYS.3.2.1.A9 Restriktive Nutzung von funktionalen Erweiterungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_2_1_Allgemeine_Smartphones_und_Tablets.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.2.2.A1', 'SYS - IT-Systeme', 'SYS.3.2.2 Mobile Device Management (MDM)', 'SYS.3.2.2.A1 Festlegung einer Strategie für das Mobile Device Management', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_2_2_Mobile_Device_Management_(MDM).html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.2.2.A10', 'SYS - IT-Systeme', 'SYS.3.2.2 Mobile Device Management (MDM)', 'SYS.3.2.2.A10 Sichere Anbindung der mobilen Endgeräte an die Institution', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_2_2_Mobile_Device_Management_(MDM).html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.2.2.A11', 'SYS - IT-Systeme', 'SYS.3.2.2 Mobile Device Management (MDM)', 'SYS.3.2.2.A11 Berechtigungsmanagement im MDM', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_2_2_Mobile_Device_Management_(MDM).html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.2.2.A12', 'SYS - IT-Systeme', 'SYS.3.2.2 Mobile Device Management (MDM)', 'SYS.3.2.2.A12 Absicherung der MDM-Betriebsumgebung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_2_2_Mobile_Device_Management_(MDM).html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.2.2.A13', 'SYS - IT-Systeme', 'SYS.3.2.2 Mobile Device Management (MDM)', 'SYS.3.2.2.A13 ENTFALLEN', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_2_2_Mobile_Device_Management_(MDM).html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.2.2.A14', 'SYS - IT-Systeme', 'SYS.3.2.2 Mobile Device Management (MDM)', 'SYS.3.2.2.A14 Benutzung externer Reputation-Services für Apps', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_2_2_Mobile_Device_Management_(MDM).html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.2.2.A15', 'SYS - IT-Systeme', 'SYS.3.2.2 Mobile Device Management (MDM)', 'SYS.3.2.2.A15 ENTFALLEN', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_2_2_Mobile_Device_Management_(MDM).html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.2.2.A16', 'SYS - IT-Systeme', 'SYS.3.2.2 Mobile Device Management (MDM)', 'SYS.3.2.2.A16 ENTFALLEN', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_2_2_Mobile_Device_Management_(MDM).html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.2.2.A17', 'SYS - IT-Systeme', 'SYS.3.2.2 Mobile Device Management (MDM)', 'SYS.3.2.2.A17 Kontrolle der Nutzung von mobilen Endgeräten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_2_2_Mobile_Device_Management_(MDM).html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.2.2.A18', 'SYS - IT-Systeme', 'SYS.3.2.2 Mobile Device Management (MDM)', 'SYS.3.2.2.A18 ENTFALLEN', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_2_2_Mobile_Device_Management_(MDM).html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.2.2.A19', 'SYS - IT-Systeme', 'SYS.3.2.2 Mobile Device Management (MDM)', 'SYS.3.2.2.A19 Einsatz von Geofencing', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_2_2_Mobile_Device_Management_(MDM).html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.2.2.A2', 'SYS - IT-Systeme', 'SYS.3.2.2 Mobile Device Management (MDM)', 'SYS.3.2.2.A2 Festlegung erlaubter mobiler Endgeräte', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_2_2_Mobile_Device_Management_(MDM).html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.2.2.A20', 'SYS - IT-Systeme', 'SYS.3.2.2 Mobile Device Management (MDM)', 'SYS.3.2.2.A20 Regelmäßige Überprüfung des MDM', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_2_2_Mobile_Device_Management_(MDM).html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.2.2.A21', 'SYS - IT-Systeme', 'SYS.3.2.2 Mobile Device Management (MDM)', 'SYS.3.2.2.A21 Verwaltung von Zertifikaten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_2_2_Mobile_Device_Management_(MDM).html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.2.2.A22', 'SYS - IT-Systeme', 'SYS.3.2.2 Mobile Device Management (MDM)', 'SYS.3.2.2.A22 Fernlöschung und Außerbetriebnahme von Endgeräten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_2_2_Mobile_Device_Management_(MDM).html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.2.2.A23', 'SYS - IT-Systeme', 'SYS.3.2.2 Mobile Device Management (MDM)', 'SYS.3.2.2.A23 Durchsetzung von Compliance-Anforderungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_2_2_Mobile_Device_Management_(MDM).html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.2.2.A3', 'SYS - IT-Systeme', 'SYS.3.2.2 Mobile Device Management (MDM)', 'SYS.3.2.2.A3 Auswahl eines MDM-Produkts', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_2_2_Mobile_Device_Management_(MDM).html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.2.2.A4', 'SYS - IT-Systeme', 'SYS.3.2.2 Mobile Device Management (MDM)', 'SYS.3.2.2.A4 Verteilung der Grundkonfiguration auf mobile Endgeräte', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_2_2_Mobile_Device_Management_(MDM).html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.2.2.A5', 'SYS - IT-Systeme', 'SYS.3.2.2 Mobile Device Management (MDM)', 'SYS.3.2.2.A5 Sichere Grundkonfiguration für mobile Endgeräte', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_2_2_Mobile_Device_Management_(MDM).html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.2.2.A6', 'SYS - IT-Systeme', 'SYS.3.2.2 Mobile Device Management (MDM)', 'SYS.3.2.2.A6 Protokollierung und Gerätestatus', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_2_2_Mobile_Device_Management_(MDM).html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.2.2.A7', 'SYS - IT-Systeme', 'SYS.3.2.2 Mobile Device Management (MDM)', 'SYS.3.2.2.A7 Auswahl und Freigabe von Apps', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_2_2_Mobile_Device_Management_(MDM).html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.2.2.A8', 'SYS - IT-Systeme', 'SYS.3.2.2 Mobile Device Management (MDM)', 'SYS.3.2.2.A8 Festlegung erlaubter Informationen auf mobilen Endgeräten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_2_2_Mobile_Device_Management_(MDM).html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.2.2.A9', 'SYS - IT-Systeme', 'SYS.3.2.2 Mobile Device Management (MDM)', 'SYS.3.2.2.A9 Auswahl und Installation von Sicherheits-Apps', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_2_2_Mobile_Device_Management_(MDM).html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.2.3.A1', 'SYS - IT-Systeme', 'SYS.3.2.3 iOS (for Enterprise)', 'SYS.3.2.3.A1 Strategie für die iOS-Nutzung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_2_3_iOS_(for_Enterprise).html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.2.3.A10', 'SYS - IT-Systeme', 'SYS.3.2.3 iOS (for Enterprise)', 'SYS.3.2.3.A10 Verwendung biometrischer Authentisierung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_2_3_iOS_(for_Enterprise).html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.2.3.A11', 'SYS - IT-Systeme', 'SYS.3.2.3 iOS (for Enterprise)', 'SYS.3.2.3.A11 Verwendung nicht personalisierter Gerätenamen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_2_3_iOS_(for_Enterprise).html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.2.3.A12', 'SYS - IT-Systeme', 'SYS.3.2.3 iOS (for Enterprise)', 'SYS.3.2.3.A12 Verwendung von Apple-IDs', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_2_3_iOS_(for_Enterprise).html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.2.3.A13', 'SYS - IT-Systeme', 'SYS.3.2.3 iOS (for Enterprise)', 'SYS.3.2.3.A13 Verwendung der Konfigurationsoption „Einschränkungen unter iOS“', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_2_3_iOS_(for_Enterprise).html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.2.3.A14', 'SYS - IT-Systeme', 'SYS.3.2.3 iOS (for Enterprise)', 'SYS.3.2.3.A14 Verwendung der iCloud-Infrastruktur', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_2_3_iOS_(for_Enterprise).html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.2.3.A15', 'SYS - IT-Systeme', 'SYS.3.2.3 iOS (for Enterprise)', 'SYS.3.2.3.A15 Verwendung der Continuity-Funktionen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_2_3_iOS_(for_Enterprise).html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.2.3.A16', 'SYS - IT-Systeme', 'SYS.3.2.3 iOS (for Enterprise)', 'SYS.3.2.3.A16 ENTFALLEN', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_2_3_iOS_(for_Enterprise).html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.2.3.A17', 'SYS - IT-Systeme', 'SYS.3.2.3 iOS (for Enterprise)', 'SYS.3.2.3.A17 Verwendung der Gerätecode-Historie', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_2_3_iOS_(for_Enterprise).html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.2.3.A18', 'SYS - IT-Systeme', 'SYS.3.2.3 iOS (for Enterprise)', 'SYS.3.2.3.A18 Verwendung der Konfigurationsoption für den Browser Safari', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_2_3_iOS_(for_Enterprise).html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.2.3.A19', 'SYS - IT-Systeme', 'SYS.3.2.3 iOS (for Enterprise)', 'SYS.3.2.3.A19 ENTFALLEN', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_2_3_iOS_(for_Enterprise).html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.2.3.A2', 'SYS - IT-Systeme', 'SYS.3.2.3 iOS (for Enterprise)', 'SYS.3.2.3.A2 Planung des Einsatzes von Cloud-Diensten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_2_3_iOS_(for_Enterprise).html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.2.3.A20', 'SYS - IT-Systeme', 'SYS.3.2.3 iOS (for Enterprise)', 'SYS.3.2.3.A20 Einbindung der Geräte in die interne Infrastruktur via VPN', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_2_3_iOS_(for_Enterprise).html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.2.3.A21', 'SYS - IT-Systeme', 'SYS.3.2.3 iOS (for Enterprise)', 'SYS.3.2.3.A21 Freigabe von Apps und Einbindung des Apple App Stores', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_2_3_iOS_(for_Enterprise).html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.2.3.A22', 'SYS - IT-Systeme', 'SYS.3.2.3 iOS (for Enterprise)', 'SYS.3.2.3.A22 ENTFALLEN', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_2_3_iOS_(for_Enterprise).html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.2.3.A23', 'SYS - IT-Systeme', 'SYS.3.2.3 iOS (for Enterprise)', 'SYS.3.2.3.A23 Verwendung der automatischen Konfigurationsprofillöschung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_2_3_iOS_(for_Enterprise).html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.2.3.A24', 'SYS - IT-Systeme', 'SYS.3.2.3 iOS (for Enterprise)', 'SYS.3.2.3.A24 ENTFALLEN', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_2_3_iOS_(for_Enterprise).html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.2.3.A25', 'SYS - IT-Systeme', 'SYS.3.2.3 iOS (for Enterprise)', 'SYS.3.2.3.A25 Verwendung der Konfigurationsoption für AirPrint', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_2_3_iOS_(for_Enterprise).html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.2.3.A26', 'SYS - IT-Systeme', 'SYS.3.2.3 iOS (for Enterprise)', 'SYS.3.2.3.A26 Keine Verbindung mit Host-Systemen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_2_3_iOS_(for_Enterprise).html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.2.3.A27', 'SYS - IT-Systeme', 'SYS.3.2.3 iOS (for Enterprise)', 'SYS.3.2.3.A27 ENTFALLEN', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_2_3_iOS_(for_Enterprise).html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.2.3.A3', 'SYS - IT-Systeme', 'SYS.3.2.3 iOS (for Enterprise)', 'SYS.3.2.3.A3 ENTFALLEN', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_2_3_iOS_(for_Enterprise).html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.2.3.A4', 'SYS - IT-Systeme', 'SYS.3.2.3 iOS (for Enterprise)', 'SYS.3.2.3.A4 ENTFALLEN', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_2_3_iOS_(for_Enterprise).html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.2.3.A5', 'SYS - IT-Systeme', 'SYS.3.2.3 iOS (for Enterprise)', 'SYS.3.2.3.A5 ENTFALLEN', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_2_3_iOS_(for_Enterprise).html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.2.3.A6', 'SYS - IT-Systeme', 'SYS.3.2.3 iOS (for Enterprise)', 'SYS.3.2.3.A6 ENTFALLEN', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_2_3_iOS_(for_Enterprise).html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.2.3.A7', 'SYS - IT-Systeme', 'SYS.3.2.3 iOS (for Enterprise)', 'SYS.3.2.3.A7 Verhinderung des unautorisierten Löschens von Konfigurationsprofilen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_2_3_iOS_(for_Enterprise).html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.2.3.A8', 'SYS - IT-Systeme', 'SYS.3.2.3 iOS (for Enterprise)', 'SYS.3.2.3.A8 ENTFALLEN', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_2_3_iOS_(for_Enterprise).html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.2.3.A9', 'SYS - IT-Systeme', 'SYS.3.2.3 iOS (for Enterprise)', 'SYS.3.2.3.A9 ENTFALLEN', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_2_3_iOS_(for_Enterprise).html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.2.4.A1', 'SYS - IT-Systeme', 'SYS.3.2.4 Android', 'SYS.3.2.4.A1 Auswahl von Android-basierten Geräten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_2_4_Android.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.2.4.A2', 'SYS - IT-Systeme', 'SYS.3.2.4 Android', 'SYS.3.2.4.A2 Deaktivieren der Entwickler-Optionen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_2_4_Android.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.2.4.A3', 'SYS - IT-Systeme', 'SYS.3.2.4 Android', 'SYS.3.2.4.A3 Einsatz des Multi-User- und Gäste-Modus', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_2_4_Android.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.2.4.A4', 'SYS - IT-Systeme', 'SYS.3.2.4 Android', 'SYS.3.2.4.A4 Regelung und Konfiguration von Cloud-Print', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_2_4_Android.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.2.4.A5', 'SYS - IT-Systeme', 'SYS.3.2.4 Android', 'SYS.3.2.4.A5 Erweiterte Sicherheitseinstellungen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_2_4_Android.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.2.4.A6', 'SYS - IT-Systeme', 'SYS.3.2.4 Android', 'SYS.3.2.4.A6 Einsatz eines Produkts zum Schutz vor Schadsoftware', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_2_4_Android.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.2.4.A7', 'SYS - IT-Systeme', 'SYS.3.2.4 Android', 'SYS.3.2.4.A7 Verwendung einer Firewall', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_2_4_Android.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.3.A1', 'SYS - IT-Systeme', 'SYS.3.3 Mobiltelefon', 'SYS.3.3.A1 Sicherheitsrichtlinien und Regelungen für die Mobiltelefon-Nutzung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_3_Mobiltelefon.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.3.A10', 'SYS - IT-Systeme', 'SYS.3.3 Mobiltelefon', 'SYS.3.3.A10 Sichere Datenübertragung über Mobiltelefone', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_3_Mobiltelefon.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.3.A11', 'SYS - IT-Systeme', 'SYS.3.3 Mobiltelefon', 'SYS.3.3.A11 Ausfallvorsorge bei Mobiltelefonen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_3_Mobiltelefon.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.3.A12', 'SYS - IT-Systeme', 'SYS.3.3 Mobiltelefon', 'SYS.3.3.A12 Einrichtung eines Mobiltelefon-Pools', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_3_Mobiltelefon.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.3.A13', 'SYS - IT-Systeme', 'SYS.3.3 Mobiltelefon', 'SYS.3.3.A13 Schutz vor der Erstellung von Bewegungsprofilen bei der Mobilfunk-Nutzung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_3_Mobiltelefon.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.3.A14', 'SYS - IT-Systeme', 'SYS.3.3 Mobiltelefon', 'SYS.3.3.A14 Schutz vor Rufnummernermittlung bei der Mobiltelefon-Nutzung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_3_Mobiltelefon.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.3.A15', 'SYS - IT-Systeme', 'SYS.3.3 Mobiltelefon', 'SYS.3.3.A15 Schutz vor Abhören der Raumgespräche über Mobiltelefone', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_3_Mobiltelefon.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.3.A2', 'SYS - IT-Systeme', 'SYS.3.3 Mobiltelefon', 'SYS.3.3.A2 Sperrmaßnahmen bei Verlust eins Mobiltelefons', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_3_Mobiltelefon.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.3.A3', 'SYS - IT-Systeme', 'SYS.3.3 Mobiltelefon', 'SYS.3.3.A3 Sensibilisierung und Schulung der Mitarbeiter im Umgang mit Mobiltelefonen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_3_Mobiltelefon.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.3.A4', 'SYS - IT-Systeme', 'SYS.3.3 Mobiltelefon', 'SYS.3.3.A4 Aussonderung und ordnungsgemäße Entsorgung von Mobiltelefonen und darin verwendeter Speicherkarten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_3_Mobiltelefon.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.3.A5', 'SYS - IT-Systeme', 'SYS.3.3 Mobiltelefon', 'SYS.3.3.A5 Nutzung der Sicherheitsmechanismen von Mobiltelefonen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_3_Mobiltelefon.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.3.A6', 'SYS - IT-Systeme', 'SYS.3.3 Mobiltelefon', 'SYS.3.3.A6 Updates von Mobiltelefonen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_3_Mobiltelefon.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.3.A7', 'SYS - IT-Systeme', 'SYS.3.3 Mobiltelefon', 'SYS.3.3.A7 Beschaffung von Mobiltelefonen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_3_Mobiltelefon.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.3.A8', 'SYS - IT-Systeme', 'SYS.3.3 Mobiltelefon', 'SYS.3.3.A8 Nutzung drahtloser Schnittstellen von Mobiltelefonen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_3_Mobiltelefon.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.3.3.A9', 'SYS - IT-Systeme', 'SYS.3.3 Mobiltelefon', 'SYS.3.3.A9 Sicherstellung der Energieversorgung von Mobiltelefonen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_3_3_Mobiltelefon.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.4.1.A1', 'SYS - IT-Systeme', 'SYS.4.1 Drucker, Kopierer und Multifunktionsgeräte', 'SYS.4.1.A1 Planung des Einsatzes von Druckern, Kopierern und Multifunktionsgeräten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_4_1_Drucker,_Kopierer_und_Multifunktionsgeräte.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.4.1.A10', 'SYS - IT-Systeme', 'SYS.4.1 Drucker, Kopierer und Multifunktionsgeräte', 'SYS.4.1.A10 ENTFALLEN', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_4_1_Drucker,_Kopierer_und_Multifunktionsgeräte.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.4.1.A11', 'SYS - IT-Systeme', 'SYS.4.1 Drucker, Kopierer und Multifunktionsgeräte', 'SYS.4.1.A11 Einschränkung der Anbindung von Druckern, Kopierern und Multifunktionsgeräten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_4_1_Drucker,_Kopierer_und_Multifunktionsgeräte.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.4.1.A12', 'SYS - IT-Systeme', 'SYS.4.1 Drucker, Kopierer und Multifunktionsgeräte', 'SYS.4.1.A12 Ordnungsgemäße Entsorgung von Geräten und schützenswerten Betriebsmitteln', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_4_1_Drucker,_Kopierer_und_Multifunktionsgeräte.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.4.1.A13', 'SYS - IT-Systeme', 'SYS.4.1 Drucker, Kopierer und Multifunktionsgeräte', 'SYS.4.1.A13 ENTFALLEN', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_4_1_Drucker,_Kopierer_und_Multifunktionsgeräte.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.4.1.A14', 'SYS - IT-Systeme', 'SYS.4.1 Drucker, Kopierer und Multifunktionsgeräte', 'SYS.4.1.A14 Authentisierung und Autorisierung bei Druckern, Kopierern und Multifunktionsgeräten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_4_1_Drucker,_Kopierer_und_Multifunktionsgeräte.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.4.1.A15', 'SYS - IT-Systeme', 'SYS.4.1 Drucker, Kopierer und Multifunktionsgeräte', 'SYS.4.1.A15 Verschlüsselung von Informationen bei Druckern, Kopierern und Multifunktionsgeräten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_4_1_Drucker,_Kopierer_und_Multifunktionsgeräte.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.4.1.A16', 'SYS - IT-Systeme', 'SYS.4.1 Drucker, Kopierer und Multifunktionsgeräte', 'SYS.4.1.A16 Notfallvorsorge bei Druckern, Kopierern und Multifunktionsgeräten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_4_1_Drucker,_Kopierer_und_Multifunktionsgeräte.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.4.1.A17', 'SYS - IT-Systeme', 'SYS.4.1 Drucker, Kopierer und Multifunktionsgeräte', 'SYS.4.1.A17 Schutz von Nutz- und Metadaten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_4_1_Drucker,_Kopierer_und_Multifunktionsgeräte.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.4.1.A18', 'SYS - IT-Systeme', 'SYS.4.1 Drucker, Kopierer und Multifunktionsgeräte', 'SYS.4.1.A18 Konfiguration von Druckern, Kopierern und Multifunktionsgeräten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_4_1_Drucker,_Kopierer_und_Multifunktionsgeräte.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.4.1.A19', 'SYS - IT-Systeme', 'SYS.4.1 Drucker, Kopierer und Multifunktionsgeräte', 'SYS.4.1.A19 Sicheres Löschen von Informationen bei Druckern, Kopierern und Multifunktionsgeräten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_4_1_Drucker,_Kopierer_und_Multifunktionsgeräte.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.4.1.A2', 'SYS - IT-Systeme', 'SYS.4.1 Drucker, Kopierer und Multifunktionsgeräte', 'SYS.4.1.A2 Geeignete Aufstellung und Zugriff auf Drucker, Kopierer und Multifunktionsgeräte', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_4_1_Drucker,_Kopierer_und_Multifunktionsgeräte.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.4.1.A20', 'SYS - IT-Systeme', 'SYS.4.1 Drucker, Kopierer und Multifunktionsgeräte', 'SYS.4.1.A20 Erweiterter Schutz von Informationen bei Druckern, Kopierern und Multifunktionsgeräten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_4_1_Drucker,_Kopierer_und_Multifunktionsgeräte.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.4.1.A21', 'SYS - IT-Systeme', 'SYS.4.1 Drucker, Kopierer und Multifunktionsgeräte', 'SYS.4.1.A21 Erweiterte Absicherung von Druckern, Kopierern und Multifunktionsgeräten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_4_1_Drucker,_Kopierer_und_Multifunktionsgeräte.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.4.1.A22', 'SYS - IT-Systeme', 'SYS.4.1 Drucker, Kopierer und Multifunktionsgeräte', 'SYS.4.1.A22 Ordnungsgemäße Entsorgung ausgedruckter Dokumente', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_4_1_Drucker,_Kopierer_und_Multifunktionsgeräte.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.4.1.A3', 'SYS - IT-Systeme', 'SYS.4.1 Drucker, Kopierer und Multifunktionsgeräte', 'SYS.4.1.A3 ENTFALLEN', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_4_1_Drucker,_Kopierer_und_Multifunktionsgeräte.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.4.1.A4', 'SYS - IT-Systeme', 'SYS.4.1 Drucker, Kopierer und Multifunktionsgeräte', 'SYS.4.1.A4 Erstellung eines Sicherheitskonzeptes für den Einsatz von Druckern, Kopieren und Multifunktionsgeräten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_4_1_Drucker,_Kopierer_und_Multifunktionsgeräte.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.4.1.A5', 'SYS - IT-Systeme', 'SYS.4.1 Drucker, Kopierer und Multifunktionsgeräte', 'SYS.4.1.A5 Erstellung von Benutzerrichtlinien für den Umgang mit Druckern, Kopierern und Multifunktionsgeräten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_4_1_Drucker,_Kopierer_und_Multifunktionsgeräte.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.4.1.A6', 'SYS - IT-Systeme', 'SYS.4.1 Drucker, Kopierer und Multifunktionsgeräte', 'SYS.4.1.A6 ENTFALLEN', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_4_1_Drucker,_Kopierer_und_Multifunktionsgeräte.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.4.1.A7', 'SYS - IT-Systeme', 'SYS.4.1 Drucker, Kopierer und Multifunktionsgeräte', 'SYS.4.1.A7 Beschränkung der administrativen Fernzugriffe auf Drucker, Kopierer und Multifunktionsgeräte', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_4_1_Drucker,_Kopierer_und_Multifunktionsgeräte.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.4.1.A8', 'SYS - IT-Systeme', 'SYS.4.1 Drucker, Kopierer und Multifunktionsgeräte', 'SYS.4.1.A8 ENTFALLEN', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_4_1_Drucker,_Kopierer_und_Multifunktionsgeräte.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.4.1.A9', 'SYS - IT-Systeme', 'SYS.4.1 Drucker, Kopierer und Multifunktionsgeräte', 'SYS.4.1.A9 ENTFALLEN', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_4_1_Drucker,_Kopierer_und_Multifunktionsgeräte.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.4.3.A1', 'SYS - IT-Systeme', 'SYS.4.3 Eingebettete Systeme', 'SYS.4.3.A1 Regelungen zum Umgang mit eingebetteten Systemen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_4_3_Eingebettete_Systeme.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.4.3.A10', 'SYS - IT-Systeme', 'SYS.4.3 Eingebettete Systeme', 'SYS.4.3.A10 Wiederherstellung von eingebetteten Systemen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_4_3_Eingebettete_Systeme.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.4.3.A11', 'SYS - IT-Systeme', 'SYS.4.3 Eingebettete Systeme', 'SYS.4.3.A11 Sichere Aussonderung eines eingebetteten Systems', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_4_3_Eingebettete_Systeme.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.4.3.A12', 'SYS - IT-Systeme', 'SYS.4.3 Eingebettete Systeme', 'SYS.4.3.A12 Auswahl einer vertrauenswürdigen Lieferanten- und Logistikkette sowie qualifizierter Hersteller für eingebettete Systeme', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_4_3_Eingebettete_Systeme.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.4.3.A13', 'SYS - IT-Systeme', 'SYS.4.3 Eingebettete Systeme', 'SYS.4.3.A13 Einsatz eines zertifizierten Betriebssystems', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_4_3_Eingebettete_Systeme.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.4.3.A14', 'SYS - IT-Systeme', 'SYS.4.3 Eingebettete Systeme', 'SYS.4.3.A14 Abgesicherter und authentisierter Bootprozess bei eingebetteten Systemen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_4_3_Eingebettete_Systeme.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.4.3.A15', 'SYS - IT-Systeme', 'SYS.4.3 Eingebettete Systeme', 'SYS.4.3.A15 Speicherschutz bei eingebetteten Systemen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_4_3_Eingebettete_Systeme.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.4.3.A16', 'SYS - IT-Systeme', 'SYS.4.3 Eingebettete Systeme', 'SYS.4.3.A16 Tamper-Schutz bei eingebetteten Systemen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_4_3_Eingebettete_Systeme.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.4.3.A17', 'SYS - IT-Systeme', 'SYS.4.3 Eingebettete Systeme', 'SYS.4.3.A17 Automatische Überwachung der Baugruppenfunktion', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_4_3_Eingebettete_Systeme.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.4.3.A18', 'SYS - IT-Systeme', 'SYS.4.3 Eingebettete Systeme', 'SYS.4.3.A18 Widerstandsfähigkeit eingebetteter Systeme gegen Seitenkanalangriffe', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_4_3_Eingebettete_Systeme.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.4.3.A2', 'SYS - IT-Systeme', 'SYS.4.3 Eingebettete Systeme', 'SYS.4.3.A2 Deaktivieren nicht benutzter Schnittstellen und Dienste bei eingebetteten Systemen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_4_3_Eingebettete_Systeme.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.4.3.A3', 'SYS - IT-Systeme', 'SYS.4.3 Eingebettete Systeme', 'SYS.4.3.A3 Protokollierung sicherheitsrelevanter Ereignisse bei eingebetteten Systemen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_4_3_Eingebettete_Systeme.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.4.3.A4', 'SYS - IT-Systeme', 'SYS.4.3 Eingebettete Systeme', 'SYS.4.3.A4 Erstellung von Beschaffungskriterien für eingebettete Systeme', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_4_3_Eingebettete_Systeme.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.4.3.A5', 'SYS - IT-Systeme', 'SYS.4.3 Eingebettete Systeme', 'SYS.4.3.A5 Schutz vor schädigenden Umwelteinflüssen bei eingebetteten Systemen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_4_3_Eingebettete_Systeme.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.4.3.A6', 'SYS - IT-Systeme', 'SYS.4.3 Eingebettete Systeme', 'SYS.4.3.A6 Verhindern von Debugging-Möglichkeiten bei eingebetteten Systemen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_4_3_Eingebettete_Systeme.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.4.3.A7', 'SYS - IT-Systeme', 'SYS.4.3 Eingebettete Systeme', 'SYS.4.3.A7 Hardware-Realisierung von Funktionen eingebetteter Systeme', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_4_3_Eingebettete_Systeme.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.4.3.A8', 'SYS - IT-Systeme', 'SYS.4.3 Eingebettete Systeme', 'SYS.4.3.A8 Einsatz eines sicheren Betriebssystem für eingebettete Systeme', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_4_3_Eingebettete_Systeme.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.4.3.A9', 'SYS - IT-Systeme', 'SYS.4.3 Eingebettete Systeme', 'SYS.4.3.A9 Einsatz kryptografischer Prozessoren bzw. Koprozessoren bei eingebetteten Systemen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_4_3_Eingebettete_Systeme.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.4.4.A1', 'SYS - IT-Systeme', 'SYS.4.4 Allgemeines IoT-Gerät', 'SYS.4.4.A1 Einsatzkriterien für IoT-Geräte', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_4_4_Allgemeines_IoT-Gerät.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.4.4.A10', 'SYS - IT-Systeme', 'SYS.4.4 Allgemeines IoT-Gerät', 'SYS.4.4.A10 Sichere Installation und Konfiguration von IoT-Geräten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_4_4_Allgemeines_IoT-Gerät.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.4.4.A11', 'SYS - IT-Systeme', 'SYS.4.4 Allgemeines IoT-Gerät', 'SYS.4.4.A11 Verwendung von verschlüsselter Datenübertragung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_4_4_Allgemeines_IoT-Gerät.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.4.4.A12', 'SYS - IT-Systeme', 'SYS.4.4 Allgemeines IoT-Gerät', 'SYS.4.4.A12 Sichere Integration in übergeordnete Systeme', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_4_4_Allgemeines_IoT-Gerät.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.4.4.A13', 'SYS - IT-Systeme', 'SYS.4.4 Allgemeines IoT-Gerät', 'SYS.4.4.A13 Deaktivierung und Deinstallation nicht benötigter Komponenten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_4_4_Allgemeines_IoT-Gerät.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.4.4.A14', 'SYS - IT-Systeme', 'SYS.4.4 Allgemeines IoT-Gerät', 'SYS.4.4.A14 Einsatzfreigabe', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_4_4_Allgemeines_IoT-Gerät.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.4.4.A15', 'SYS - IT-Systeme', 'SYS.4.4 Allgemeines IoT-Gerät', 'SYS.4.4.A15 Restriktive Rechtevergabe', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_4_4_Allgemeines_IoT-Gerät.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.4.4.A16', 'SYS - IT-Systeme', 'SYS.4.4 Allgemeines IoT-Gerät', 'SYS.4.4.A16 Beseitigung von Schadprogrammen auf IoT-Geräten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_4_4_Allgemeines_IoT-Gerät.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.4.4.A17', 'SYS - IT-Systeme', 'SYS.4.4 Allgemeines IoT-Gerät', 'SYS.4.4.A17 Überwachung des Netzverkehrs von IoT-Geräten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_4_4_Allgemeines_IoT-Gerät.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.4.4.A18', 'SYS - IT-Systeme', 'SYS.4.4 Allgemeines IoT-Gerät', 'SYS.4.4.A18 Protokollierung sicherheitsrelevanter Ereignisse bei IoT-Geräten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_4_4_Allgemeines_IoT-Gerät.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.4.4.A19', 'SYS - IT-Systeme', 'SYS.4.4 Allgemeines IoT-Gerät', 'SYS.4.4.A19 Schutz der Administrationsschnittstellen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_4_4_Allgemeines_IoT-Gerät.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.4.4.A2', 'SYS - IT-Systeme', 'SYS.4.4 Allgemeines IoT-Gerät', 'SYS.4.4.A2 Authentisierung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_4_4_Allgemeines_IoT-Gerät.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.4.4.A20', 'SYS - IT-Systeme', 'SYS.4.4 Allgemeines IoT-Gerät', 'SYS.4.4.A20 Geregelte Außerbetriebnahme von IoT-Geräten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_4_4_Allgemeines_IoT-Gerät.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.4.4.A21', 'SYS - IT-Systeme', 'SYS.4.4 Allgemeines IoT-Gerät', 'SYS.4.4.A21 Einsatzumgebung und Stromversorgung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_4_4_Allgemeines_IoT-Gerät.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.4.4.A22', 'SYS - IT-Systeme', 'SYS.4.4 Allgemeines IoT-Gerät', 'SYS.4.4.A22 Systemüberwachung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_4_4_Allgemeines_IoT-Gerät.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.4.4.A23', 'SYS - IT-Systeme', 'SYS.4.4 Allgemeines IoT-Gerät', 'SYS.4.4.A23 Auditierung von IoT-Geräten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_4_4_Allgemeines_IoT-Gerät.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.4.4.A24', 'SYS - IT-Systeme', 'SYS.4.4 Allgemeines IoT-Gerät', 'SYS.4.4.A24 Sichere Konfiguration und Nutzung eines eingebetteten Webservers', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_4_4_Allgemeines_IoT-Gerät.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.4.4.A3', 'SYS - IT-Systeme', 'SYS.4.4 Allgemeines IoT-Gerät', 'SYS.4.4.A3 Regelmäßige Aktualisierung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_4_4_Allgemeines_IoT-Gerät.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.4.4.A4', 'SYS - IT-Systeme', 'SYS.4.4 Allgemeines IoT-Gerät', 'SYS.4.4.A4 ENTFALLEN', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_4_4_Allgemeines_IoT-Gerät.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.4.4.A5', 'SYS - IT-Systeme', 'SYS.4.4 Allgemeines IoT-Gerät', 'SYS.4.4.A5 Einschränkung des Netzzugriffs', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_4_4_Allgemeines_IoT-Gerät.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.4.4.A6', 'SYS - IT-Systeme', 'SYS.4.4 Allgemeines IoT-Gerät', 'SYS.4.4.A6 Aufnahme von IoT-Geräten in die Sicherheitsrichtlinie der Institution', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_4_4_Allgemeines_IoT-Gerät.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.4.4.A7', 'SYS - IT-Systeme', 'SYS.4.4 Allgemeines IoT-Gerät', 'SYS.4.4.A7 Planung des Einsatzes von IoT-Geräten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_4_4_Allgemeines_IoT-Gerät.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.4.4.A8', 'SYS - IT-Systeme', 'SYS.4.4 Allgemeines IoT-Gerät', 'SYS.4.4.A8 Beschaffungskriterien für IoT-Geräte', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_4_4_Allgemeines_IoT-Gerät.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.4.4.A9', 'SYS - IT-Systeme', 'SYS.4.4 Allgemeines IoT-Gerät', 'SYS.4.4.A9 Regelung des Einsatzes von IoT-Geräten', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_4_4_Allgemeines_IoT-Gerät.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.4.5.A1', 'SYS - IT-Systeme', 'SYS.4.5 Wechseldatenträger', 'SYS.4.5.A1 Sensibilisierung der Mitarbeiter zum sicheren Umgang mit Wechseldatenträgern', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_4_5_Wechseldatenträger.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.4.5.A10', 'SYS - IT-Systeme', 'SYS.4.5 Wechseldatenträger', 'SYS.4.5.A10 Datenträgerverschlüsselung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_4_5_Wechseldatenträger.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.4.5.A11', 'SYS - IT-Systeme', 'SYS.4.5 Wechseldatenträger', 'SYS.4.5.A11 Integritätsschutz durch Checksummen oder digitale Signaturen', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_4_5_Wechseldatenträger.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.4.5.A12', 'SYS - IT-Systeme', 'SYS.4.5 Wechseldatenträger', 'SYS.4.5.A12 Schutz vor Schadsoftware', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_4_5_Wechseldatenträger.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.4.5.A13', 'SYS - IT-Systeme', 'SYS.4.5 Wechseldatenträger', 'SYS.4.5.A13 Angemessene Kennzeichnung der Datenträger beim Versand', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_4_5_Wechseldatenträger.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.4.5.A14', 'SYS - IT-Systeme', 'SYS.4.5 Wechseldatenträger', 'SYS.4.5.A14 Sichere Versandart und Verpackung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_4_5_Wechseldatenträger.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.4.5.A15', 'SYS - IT-Systeme', 'SYS.4.5 Wechseldatenträger', 'SYS.4.5.A15 Zertifizierte Produkte', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_4_5_Wechseldatenträger.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.4.5.A16', 'SYS - IT-Systeme', 'SYS.4.5 Wechseldatenträger', 'SYS.4.5.A16 Nutzung dedizierter Systeme zur Datenprüfung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_4_5_Wechseldatenträger.html', 3);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.4.5.A2', 'SYS - IT-Systeme', 'SYS.4.5 Wechseldatenträger', 'SYS.4.5.A2 Verlust- bzw. Manipulationsmeldung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_4_5_Wechseldatenträger.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.4.5.A3', 'SYS - IT-Systeme', 'SYS.4.5 Wechseldatenträger', 'SYS.4.5.A3 ENTFALLEN', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_4_5_Wechseldatenträger.html', 1);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.4.5.A4', 'SYS - IT-Systeme', 'SYS.4.5 Wechseldatenträger', 'SYS.4.5.A4 Erstellung einer Richtlinie zum sicheren Umgang mit Wechseldatenträgern', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_4_5_Wechseldatenträger.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.4.5.A5', 'SYS - IT-Systeme', 'SYS.4.5 Wechseldatenträger', 'SYS.4.5.A5 Regelung zur Mitnahme von Wechseldatenträgern', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_4_5_Wechseldatenträger.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.4.5.A6', 'SYS - IT-Systeme', 'SYS.4.5 Wechseldatenträger', 'SYS.4.5.A6 Datenträgerverwaltung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_4_5_Wechseldatenträger.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.4.5.A7', 'SYS - IT-Systeme', 'SYS.4.5 Wechseldatenträger', 'SYS.4.5.A7 Sicheres Löschen der Datenträger vor und nach der Verwendung', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_4_5_Wechseldatenträger.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.4.5.A8', 'SYS - IT-Systeme', 'SYS.4.5 Wechseldatenträger', 'SYS.4.5.A8 ENTFALLEN', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_4_5_Wechseldatenträger.html', 2);
insert into toms (Identifier, Category, Subcategory, Description, URL, Risklevel) VALUES ('SYS.4.5.A9', 'SYS - IT-Systeme', 'SYS.4.5 Wechseldatenträger', 'SYS.4.5.A9 ENTFALLEN', 'https://www.bsi.bund.de/DE/Themen/ITGrundschutz/ITGrundschutzKompendium/bausteine/SYS/SYS_4_5_Wechseldatenträger.html', 3);
insert into tom_rollen (TOMID, RoleID) values ('APP.1.1.A1', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.1.1.A10', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.1.1.A10', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('APP.1.1.A11', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.1.1.A12', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.1.1.A12', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('APP.1.1.A13', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.1.1.A13', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('APP.1.1.A14', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.1.1.A14', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('APP.1.1.A15', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.1.1.A16', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.1.1.A2', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.1.1.A3', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.1.1.A3', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('APP.1.1.A4', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.1.1.A5', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.1.1.A6', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.1.1.A7', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.1.1.A8', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.1.1.A9', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.1.1.A9', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('APP.1.2.A1', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.1.2.A10', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.1.2.A10', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('APP.1.2.A11', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.1.2.A12', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.1.2.A2', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.1.2.A3', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.1.2.A3', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('APP.1.2.A4', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.1.2.A5', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.1.2.A6', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.1.2.A6', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('APP.1.2.A7', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.1.2.A7', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('APP.1.2.A8', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.1.2.A8', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('APP.1.2.A9', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.1.4.A1', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.1.4.A1', 16); -- Fachverantwortliche
insert into tom_rollen (TOMID, RoleID) values ('APP.1.4.A10', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.1.4.A11', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.1.4.A12', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.1.4.A13', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.1.4.A13', 16); -- Fachverantwortliche
insert into tom_rollen (TOMID, RoleID) values ('APP.1.4.A14', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.1.4.A15', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.1.4.A2', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.1.4.A2', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('APP.1.4.A3', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.1.4.A3', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('APP.1.4.A4', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.1.4.A4', 10); -- Datenschutzbeauftragter
insert into tom_rollen (TOMID, RoleID) values ('APP.1.4.A4', 16); -- Fachverantwortliche
insert into tom_rollen (TOMID, RoleID) values ('APP.1.4.A5', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.1.4.A5', 16); -- Fachverantwortliche
insert into tom_rollen (TOMID, RoleID) values ('APP.1.4.A6', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.1.4.A7', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.1.4.A8', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.1.4.A9', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.1.4.A9', 16); -- Fachverantwortliche
insert into tom_rollen (TOMID, RoleID) values ('APP.2.1.A1', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.2.1.A10', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.2.1.A11', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.2.1.A12', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.2.1.A13', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.2.1.A14', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.2.1.A14', 16); -- Fachverantwortliche
insert into tom_rollen (TOMID, RoleID) values ('APP.2.1.A15', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.2.1.A16', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.2.1.A2', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.2.1.A2', 10); -- Datenschutzbeauftragter
insert into tom_rollen (TOMID, RoleID) values ('APP.2.1.A2', 16); -- Fachverantwortliche
insert into tom_rollen (TOMID, RoleID) values ('APP.2.1.A3', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.2.1.A3', 16); -- Fachverantwortliche
insert into tom_rollen (TOMID, RoleID) values ('APP.2.1.A4', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.2.1.A5', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.2.1.A6', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.2.1.A7', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.2.1.A8', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.2.1.A9', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.2.1.A9', 16); -- Fachverantwortliche
insert into tom_rollen (TOMID, RoleID) values ('APP.2.2.A1', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.2.2.A1', 16); -- Fachverantwortliche
insert into tom_rollen (TOMID, RoleID) values ('APP.2.2.A10', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.2.2.A11', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.2.2.A12', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.2.2.A13', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.2.2.A14', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.2.2.A15', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.2.2.A2', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.2.2.A2', 16); -- Fachverantwortliche
insert into tom_rollen (TOMID, RoleID) values ('APP.2.2.A3', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.2.2.A4', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.2.2.A5', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.2.2.A6', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.2.2.A7', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.2.2.A7', 16); -- Fachverantwortliche
insert into tom_rollen (TOMID, RoleID) values ('APP.2.2.A8', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.2.2.A9', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.2.3.A1', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.2.3.A10', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.2.3.A11', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.2.3.A12', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.2.3.A12', 10); -- Datenschutzbeauftragter
insert into tom_rollen (TOMID, RoleID) values ('APP.2.3.A13', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.2.3.A2', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.2.3.A3', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.2.3.A4', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.2.3.A5', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.2.3.A6', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.2.3.A7', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.2.3.A8', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.2.3.A9', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.1.A1', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.1.A1', 11); -- Entwickler
insert into tom_rollen (TOMID, RoleID) values ('APP.3.1.A10', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.1.A11', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.1.A12', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.1.A13', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.1.A14', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.1.A14', 11); -- Entwickler
insert into tom_rollen (TOMID, RoleID) values ('APP.3.1.A15', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.1.A15', 11); -- Entwickler
insert into tom_rollen (TOMID, RoleID) values ('APP.3.1.A16', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.1.A16', 11); -- Entwickler
insert into tom_rollen (TOMID, RoleID) values ('APP.3.1.A17', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.1.A17', 11); -- Entwickler
insert into tom_rollen (TOMID, RoleID) values ('APP.3.1.A18', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.1.A19', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.1.A19', 11); -- Entwickler
insert into tom_rollen (TOMID, RoleID) values ('APP.3.1.A2', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.1.A2', 11); -- Entwickler
insert into tom_rollen (TOMID, RoleID) values ('APP.3.1.A20', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.1.A21', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.1.A21', 11); -- Entwickler
insert into tom_rollen (TOMID, RoleID) values ('APP.3.1.A22', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.1.A23', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.1.A23', 11); -- Entwickler
insert into tom_rollen (TOMID, RoleID) values ('APP.3.1.A24', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.1.A24', 11); -- Entwickler
insert into tom_rollen (TOMID, RoleID) values ('APP.3.1.A25', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.1.A25', 11); -- Entwickler
insert into tom_rollen (TOMID, RoleID) values ('APP.3.1.A3', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.1.A3', 11); -- Entwickler
insert into tom_rollen (TOMID, RoleID) values ('APP.3.1.A4', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.1.A4', 11); -- Entwickler
insert into tom_rollen (TOMID, RoleID) values ('APP.3.1.A5', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.1.A5', 11); -- Entwickler
insert into tom_rollen (TOMID, RoleID) values ('APP.3.1.A6', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.1.A7', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.1.A7', 11); -- Entwickler
insert into tom_rollen (TOMID, RoleID) values ('APP.3.1.A8', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.1.A8', 6); -- Beschaffer
insert into tom_rollen (TOMID, RoleID) values ('APP.3.1.A8', 11); -- Entwickler
insert into tom_rollen (TOMID, RoleID) values ('APP.3.1.A9', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.1.A9', 11); -- Entwickler
insert into tom_rollen (TOMID, RoleID) values ('APP.3.1.A9', 6); -- Beschaffer
insert into tom_rollen (TOMID, RoleID) values ('APP.3.2.A1', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.2.A10', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.2.A11', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.2.A12', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.2.A13', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.2.A14', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.2.A15', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.2.A16', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.2.A17', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.2.A18', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.2.A19', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.2.A2', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.2.A20', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.2.A20', 16); -- Fachverantwortliche
insert into tom_rollen (TOMID, RoleID) values ('APP.3.2.A20', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('APP.3.2.A3', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.2.A4', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.2.A5', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.2.A6', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.2.A7', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.2.A7', 16); -- Fachverantwortliche
insert into tom_rollen (TOMID, RoleID) values ('APP.3.2.A8', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.2.A9', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.3.A1', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.3.A10', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.3.A11', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.3.A12', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.3.A13', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.3.A14', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.3.A15', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.3.A2', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.3.A3', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.3.A4', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.3.A5', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.3.A6', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.3.A7', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.3.A8', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.3.A8', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('APP.3.3.A9', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.4.A1', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.4.A10', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.4.A11', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.4.A12', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.4.A13', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.4.A14', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.4.A15', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.4.A2', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.4.A3', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.4.A4', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.4.A5', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.4.A6', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.4.A7', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.4.A8', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.4.A9', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.6.A1', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.6.A10', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.6.A11', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.6.A12', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.6.A12', 45); -- Vorgesetzte
insert into tom_rollen (TOMID, RoleID) values ('APP.3.6.A13', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.6.A14', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.6.A15', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.6.A16', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.6.A17', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.6.A18', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.6.A19', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.6.A2', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.6.A20', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.6.A21', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.6.A22', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.6.A22', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('APP.3.6.A3', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.6.A4', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.6.A5', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.6.A6', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.6.A7', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.6.A8', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.3.6.A8', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('APP.3.6.A9', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.4.2.A1', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.4.2.A10', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.4.2.A10', 15); -- Fachabteilung
insert into tom_rollen (TOMID, RoleID) values ('APP.4.2.A11', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.4.2.A12', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.4.2.A12', 15); -- Fachabteilung
insert into tom_rollen (TOMID, RoleID) values ('APP.4.2.A12', 11); -- Entwickler
insert into tom_rollen (TOMID, RoleID) values ('APP.4.2.A12', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('APP.4.2.A13', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.4.2.A14', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.4.2.A14', 15); -- Fachabteilung
insert into tom_rollen (TOMID, RoleID) values ('APP.4.2.A15', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.4.2.A16', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.4.2.A17', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.4.2.A18', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.4.2.A19', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.4.2.A2', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.4.2.A20', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.4.2.A21', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.4.2.A22', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.4.2.A22', 11); -- Entwickler
insert into tom_rollen (TOMID, RoleID) values ('APP.4.2.A23', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.4.2.A23', 11); -- Entwickler
insert into tom_rollen (TOMID, RoleID) values ('APP.4.2.A24', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.4.2.A25', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.4.2.A26', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.4.2.A27', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.4.2.A27', 15); -- Fachabteilung
insert into tom_rollen (TOMID, RoleID) values ('APP.4.2.A28', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.4.2.A28', 37); -- Notfallbeauftragter
insert into tom_rollen (TOMID, RoleID) values ('APP.4.2.A29', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.4.2.A3', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.4.2.A30', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.4.2.A31', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.4.2.A32', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.4.2.A4', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.4.2.A5', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.4.2.A6', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.4.2.A6', 15); -- Fachabteilung
insert into tom_rollen (TOMID, RoleID) values ('APP.4.2.A6', 11); -- Entwickler
insert into tom_rollen (TOMID, RoleID) values ('APP.4.2.A6', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('APP.4.2.A7', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.4.2.A8', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.4.2.A9', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.4.3.A1', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.4.3.A10', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.4.3.A11', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.4.3.A11', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('APP.4.3.A11', 16); -- Fachverantwortliche
insert into tom_rollen (TOMID, RoleID) values ('APP.4.3.A12', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.4.3.A12', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('APP.4.3.A13', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.4.3.A14', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.4.3.A15', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.4.3.A15', 45); -- Vorgesetzte
insert into tom_rollen (TOMID, RoleID) values ('APP.4.3.A15', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('APP.4.3.A16', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.4.3.A17', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.4.3.A17', 16); -- Fachverantwortliche
insert into tom_rollen (TOMID, RoleID) values ('APP.4.3.A18', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.4.3.A19', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.4.3.A19', 11); -- Entwickler
insert into tom_rollen (TOMID, RoleID) values ('APP.4.3.A2', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.4.3.A20', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.4.3.A21', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.4.3.A22', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.4.3.A23', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.4.3.A24', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.4.3.A25', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.4.3.A3', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.4.3.A4', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.4.3.A5', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.4.3.A6', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.4.3.A6', 16); -- Fachverantwortliche
insert into tom_rollen (TOMID, RoleID) values ('APP.4.3.A7', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.4.3.A8', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.4.3.A9', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.4.6.A1', 28); -- Leiter Entwicklung
insert into tom_rollen (TOMID, RoleID) values ('APP.4.6.A1', 11); -- Entwickler
insert into tom_rollen (TOMID, RoleID) values ('APP.4.6.A10', 28); -- Leiter Entwicklung
insert into tom_rollen (TOMID, RoleID) values ('APP.4.6.A10', 11); -- Entwickler
insert into tom_rollen (TOMID, RoleID) values ('APP.4.6.A11', 28); -- Leiter Entwicklung
insert into tom_rollen (TOMID, RoleID) values ('APP.4.6.A11', 11); -- Entwickler
insert into tom_rollen (TOMID, RoleID) values ('APP.4.6.A12', 28); -- Leiter Entwicklung
insert into tom_rollen (TOMID, RoleID) values ('APP.4.6.A12', 11); -- Entwickler
insert into tom_rollen (TOMID, RoleID) values ('APP.4.6.A13', 28); -- Leiter Entwicklung
insert into tom_rollen (TOMID, RoleID) values ('APP.4.6.A13', 11); -- Entwickler
insert into tom_rollen (TOMID, RoleID) values ('APP.4.6.A14', 28); -- Leiter Entwicklung
insert into tom_rollen (TOMID, RoleID) values ('APP.4.6.A14', 11); -- Entwickler
insert into tom_rollen (TOMID, RoleID) values ('APP.4.6.A15', 28); -- Leiter Entwicklung
insert into tom_rollen (TOMID, RoleID) values ('APP.4.6.A15', 11); -- Entwickler
insert into tom_rollen (TOMID, RoleID) values ('APP.4.6.A16', 28); -- Leiter Entwicklung
insert into tom_rollen (TOMID, RoleID) values ('APP.4.6.A16', 11); -- Entwickler
insert into tom_rollen (TOMID, RoleID) values ('APP.4.6.A17', 28); -- Leiter Entwicklung
insert into tom_rollen (TOMID, RoleID) values ('APP.4.6.A17', 11); -- Entwickler
insert into tom_rollen (TOMID, RoleID) values ('APP.4.6.A18', 28); -- Leiter Entwicklung
insert into tom_rollen (TOMID, RoleID) values ('APP.4.6.A18', 11); -- Entwickler
insert into tom_rollen (TOMID, RoleID) values ('APP.4.6.A19', 28); -- Leiter Entwicklung
insert into tom_rollen (TOMID, RoleID) values ('APP.4.6.A19', 11); -- Entwickler
insert into tom_rollen (TOMID, RoleID) values ('APP.4.6.A2', 28); -- Leiter Entwicklung
insert into tom_rollen (TOMID, RoleID) values ('APP.4.6.A2', 11); -- Entwickler
insert into tom_rollen (TOMID, RoleID) values ('APP.4.6.A20', 28); -- Leiter Entwicklung
insert into tom_rollen (TOMID, RoleID) values ('APP.4.6.A20', 11); -- Entwickler
insert into tom_rollen (TOMID, RoleID) values ('APP.4.6.A21', 28); -- Leiter Entwicklung
insert into tom_rollen (TOMID, RoleID) values ('APP.4.6.A21', 11); -- Entwickler
insert into tom_rollen (TOMID, RoleID) values ('APP.4.6.A22', 28); -- Leiter Entwicklung
insert into tom_rollen (TOMID, RoleID) values ('APP.4.6.A3', 28); -- Leiter Entwicklung
insert into tom_rollen (TOMID, RoleID) values ('APP.4.6.A3', 11); -- Entwickler
insert into tom_rollen (TOMID, RoleID) values ('APP.4.6.A4', 28); -- Leiter Entwicklung
insert into tom_rollen (TOMID, RoleID) values ('APP.4.6.A4', 11); -- Entwickler
insert into tom_rollen (TOMID, RoleID) values ('APP.4.6.A5', 28); -- Leiter Entwicklung
insert into tom_rollen (TOMID, RoleID) values ('APP.4.6.A6', 28); -- Leiter Entwicklung
insert into tom_rollen (TOMID, RoleID) values ('APP.4.6.A6', 11); -- Entwickler
insert into tom_rollen (TOMID, RoleID) values ('APP.4.6.A7', 28); -- Leiter Entwicklung
insert into tom_rollen (TOMID, RoleID) values ('APP.4.6.A7', 11); -- Entwickler
insert into tom_rollen (TOMID, RoleID) values ('APP.4.6.A8', 28); -- Leiter Entwicklung
insert into tom_rollen (TOMID, RoleID) values ('APP.4.6.A8', 11); -- Entwickler
insert into tom_rollen (TOMID, RoleID) values ('APP.4.6.A9', 28); -- Leiter Entwicklung
insert into tom_rollen (TOMID, RoleID) values ('APP.4.6.A9', 11); -- Entwickler
insert into tom_rollen (TOMID, RoleID) values ('APP.5.1.A1', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.5.1.A10', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.5.1.A11', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.5.1.A12', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.5.1.A13', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.5.1.A14', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.5.1.A15', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.5.1.A16', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.5.1.A16', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('APP.5.1.A17', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.5.1.A18', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.5.1.A19', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.5.1.A2', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.5.1.A20', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.5.1.A21', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.5.1.A22', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.5.1.A3', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.5.1.A4', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.5.1.A5', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.5.1.A6', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.5.1.A6', 45); -- Vorgesetzte
insert into tom_rollen (TOMID, RoleID) values ('APP.5.1.A7', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.5.1.A8', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.5.1.A9', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.5.2.A1', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.5.2.A10', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.5.2.A11', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.5.2.A12', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.5.2.A13', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.5.2.A14', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.5.2.A14', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('APP.5.2.A15', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.5.2.A16', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.5.2.A17', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.5.2.A18', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.5.2.A19', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.5.2.A2', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.5.2.A3', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.5.2.A4', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.5.2.A5', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.5.2.A6', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.5.2.A7', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.5.2.A8', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('APP.5.2.A9', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('CON.1.A1', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('CON.1.A1', 16); -- Fachverantwortliche
insert into tom_rollen (TOMID, RoleID) values ('CON.1.A10', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('CON.1.A11', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('CON.1.A11', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('CON.1.A12', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('CON.1.A12', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('CON.1.A13', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('CON.1.A14', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('CON.1.A14', 45); -- Vorgesetzte
insert into tom_rollen (TOMID, RoleID) values ('CON.1.A14', 16); -- Fachverantwortliche
insert into tom_rollen (TOMID, RoleID) values ('CON.1.A14', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('CON.1.A15', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('CON.1.A16', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('CON.1.A16', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('CON.1.A17', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('CON.1.A17', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('CON.1.A18', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('CON.1.A18', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('CON.1.A2', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('CON.1.A2', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('CON.1.A3', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('CON.1.A4', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('CON.1.A5', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('CON.1.A5', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('CON.1.A6', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('CON.1.A6', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('CON.1.A6', 16); -- Fachverantwortliche
insert into tom_rollen (TOMID, RoleID) values ('CON.1.A7', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('CON.1.A8', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('CON.1.A9', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('CON.1.A9', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('CON.1.A9', 16); -- Fachverantwortliche
insert into tom_rollen (TOMID, RoleID) values ('CON.2.A1', 10); -- Datenschutzbeauftragter
insert into tom_rollen (TOMID, RoleID) values ('CON.3.A1', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('CON.3.A1', 16); -- Fachverantwortliche
insert into tom_rollen (TOMID, RoleID) values ('CON.3.A1', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('CON.3.A10', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('CON.3.A11', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('CON.3.A11', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('CON.3.A12', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('CON.3.A12', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('CON.3.A13', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('CON.3.A13', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('CON.3.A2', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('CON.3.A2', 16); -- Fachverantwortliche
insert into tom_rollen (TOMID, RoleID) values ('CON.3.A2', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('CON.3.A3', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('CON.3.A4', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('CON.3.A4', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('CON.3.A5', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('CON.3.A5', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('CON.3.A6', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('CON.3.A6', 16); -- Fachverantwortliche
insert into tom_rollen (TOMID, RoleID) values ('CON.3.A6', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('CON.3.A7', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('CON.3.A7', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('CON.3.A8', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('CON.3.A9', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('CON.3.A9', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('CON.3.A9', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('CON.4.A1', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('CON.4.A10', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('CON.4.A11', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('CON.4.A12', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('CON.4.A2', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('CON.4.A3', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('CON.4.A4', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('CON.4.A4', 15); -- Fachabteilung
insert into tom_rollen (TOMID, RoleID) values ('CON.4.A5', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('CON.4.A5', 15); -- Fachabteilung
insert into tom_rollen (TOMID, RoleID) values ('CON.4.A6', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('CON.4.A6', 15); -- Fachabteilung
insert into tom_rollen (TOMID, RoleID) values ('CON.4.A6', 7); -- Beschaffungsstelle
insert into tom_rollen (TOMID, RoleID) values ('CON.4.A7', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('CON.4.A7', 15); -- Fachabteilung
insert into tom_rollen (TOMID, RoleID) values ('CON.4.A8', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('CON.4.A9', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('CON.5.A1', 16); -- Fachverantwortliche
insert into tom_rollen (TOMID, RoleID) values ('CON.5.A1', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('CON.5.A10', 16); -- Fachverantwortliche
insert into tom_rollen (TOMID, RoleID) values ('CON.5.A11', 16); -- Fachverantwortliche
insert into tom_rollen (TOMID, RoleID) values ('CON.5.A11', 6); -- Beschaffer
insert into tom_rollen (TOMID, RoleID) values ('CON.5.A12', 16); -- Fachverantwortliche
insert into tom_rollen (TOMID, RoleID) values ('CON.5.A13', 16); -- Fachverantwortliche
insert into tom_rollen (TOMID, RoleID) values ('CON.5.A13', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('CON.5.A13', 37); -- Notfallbeauftragter
insert into tom_rollen (TOMID, RoleID) values ('CON.5.A2', 16); -- Fachverantwortliche
insert into tom_rollen (TOMID, RoleID) values ('CON.5.A3', 16); -- Fachverantwortliche
insert into tom_rollen (TOMID, RoleID) values ('CON.5.A3', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('CON.5.A4', 16); -- Fachverantwortliche
insert into tom_rollen (TOMID, RoleID) values ('CON.5.A5', 16); -- Fachverantwortliche
insert into tom_rollen (TOMID, RoleID) values ('CON.5.A6', 16); -- Fachverantwortliche
insert into tom_rollen (TOMID, RoleID) values ('CON.5.A7', 16); -- Fachverantwortliche
insert into tom_rollen (TOMID, RoleID) values ('CON.5.A8', 16); -- Fachverantwortliche
insert into tom_rollen (TOMID, RoleID) values ('CON.5.A9', 16); -- Fachverantwortliche
insert into tom_rollen (TOMID, RoleID) values ('CON.6.A1', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('CON.6.A1', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('CON.6.A1', 32); -- Leiter Organisation
insert into tom_rollen (TOMID, RoleID) values ('CON.6.A10', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('CON.6.A10', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('CON.6.A10', 7); -- Beschaffungsstelle
insert into tom_rollen (TOMID, RoleID) values ('CON.6.A10', 32); -- Leiter Organisation
insert into tom_rollen (TOMID, RoleID) values ('CON.6.A11', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('CON.6.A11', 32); -- Leiter Organisation
insert into tom_rollen (TOMID, RoleID) values ('CON.6.A11', 10); -- Datenschutzbeauftragter
insert into tom_rollen (TOMID, RoleID) values ('CON.6.A2', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('CON.6.A2', 36); -- Mitarbeiter
insert into tom_rollen (TOMID, RoleID) values ('CON.6.A2', 29); -- Leiter Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('CON.6.A2', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('CON.6.A3', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('CON.6.A3', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('CON.6.A3', 36); -- Mitarbeiter
insert into tom_rollen (TOMID, RoleID) values ('CON.6.A4', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('CON.6.A4', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('CON.6.A4', 32); -- Leiter Organisation
insert into tom_rollen (TOMID, RoleID) values ('CON.6.A5', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('CON.6.A5', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('CON.6.A5', 36); -- Mitarbeiter
insert into tom_rollen (TOMID, RoleID) values ('CON.6.A5', 16); -- Fachverantwortliche
insert into tom_rollen (TOMID, RoleID) values ('CON.6.A5', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('CON.6.A6', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('CON.6.A6', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('CON.6.A7', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('CON.6.A7', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('CON.6.A7', 36); -- Mitarbeiter
insert into tom_rollen (TOMID, RoleID) values ('CON.6.A8', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('CON.6.A8', 36); -- Mitarbeiter
insert into tom_rollen (TOMID, RoleID) values ('CON.6.A8', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('CON.6.A8', 10); -- Datenschutzbeauftragter
insert into tom_rollen (TOMID, RoleID) values ('CON.6.A9', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('CON.6.A9', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('CON.6.A9', 32); -- Leiter Organisation
insert into tom_rollen (TOMID, RoleID) values ('CON.7.A1', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('CON.7.A10', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('CON.7.A10', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('CON.7.A10', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('CON.7.A11', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('CON.7.A11', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('CON.7.A12', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('CON.7.A12', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('CON.7.A13', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('CON.7.A13', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('CON.7.A14', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('CON.7.A14', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('CON.7.A14', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('CON.7.A15', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('CON.7.A16', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('CON.7.A16', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('CON.7.A17', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('CON.7.A17', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('CON.7.A18', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('CON.7.A18', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('CON.7.A2', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('CON.7.A3', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('CON.7.A3', 38); -- Personalabteilung
insert into tom_rollen (TOMID, RoleID) values ('CON.7.A4', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('CON.7.A4', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('CON.7.A5', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('CON.7.A5', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('CON.7.A6', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('CON.7.A6', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('CON.7.A7', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('CON.7.A7', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('CON.7.A7', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('CON.7.A8', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('CON.7.A8', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('CON.7.A9', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('CON.7.A9', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('CON.8.A1', 28); -- Leiter Entwicklung
insert into tom_rollen (TOMID, RoleID) values ('CON.8.A1', 32); -- Leiter Organisation
insert into tom_rollen (TOMID, RoleID) values ('CON.8.A10', 28); -- Leiter Entwicklung
insert into tom_rollen (TOMID, RoleID) values ('CON.8.A10', 11); -- Entwickler
insert into tom_rollen (TOMID, RoleID) values ('CON.8.A11', 28); -- Leiter Entwicklung
insert into tom_rollen (TOMID, RoleID) values ('CON.8.A12', 28); -- Leiter Entwicklung
insert into tom_rollen (TOMID, RoleID) values ('CON.8.A13', 28); -- Leiter Entwicklung
insert into tom_rollen (TOMID, RoleID) values ('CON.8.A14', 28); -- Leiter Entwicklung
insert into tom_rollen (TOMID, RoleID) values ('CON.8.A15', 28); -- Leiter Entwicklung
insert into tom_rollen (TOMID, RoleID) values ('CON.8.A15', 11); -- Entwickler
insert into tom_rollen (TOMID, RoleID) values ('CON.8.A16', 28); -- Leiter Entwicklung
insert into tom_rollen (TOMID, RoleID) values ('CON.8.A17', 28); -- Leiter Entwicklung
insert into tom_rollen (TOMID, RoleID) values ('CON.8.A18', 28); -- Leiter Entwicklung
insert into tom_rollen (TOMID, RoleID) values ('CON.8.A19', 28); -- Leiter Entwicklung
insert into tom_rollen (TOMID, RoleID) values ('CON.8.A19', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('CON.8.A2', 28); -- Leiter Entwicklung
insert into tom_rollen (TOMID, RoleID) values ('CON.8.A3', 28); -- Leiter Entwicklung
insert into tom_rollen (TOMID, RoleID) values ('CON.8.A4', 28); -- Leiter Entwicklung
insert into tom_rollen (TOMID, RoleID) values ('CON.8.A4', 11); -- Entwickler
insert into tom_rollen (TOMID, RoleID) values ('CON.8.A5', 28); -- Leiter Entwicklung
insert into tom_rollen (TOMID, RoleID) values ('CON.8.A6', 28); -- Leiter Entwicklung
insert into tom_rollen (TOMID, RoleID) values ('CON.8.A7', 28); -- Leiter Entwicklung
insert into tom_rollen (TOMID, RoleID) values ('CON.8.A7', 43); -- Tester
insert into tom_rollen (TOMID, RoleID) values ('CON.8.A8', 28); -- Leiter Entwicklung
insert into tom_rollen (TOMID, RoleID) values ('CON.8.A8', 11); -- Entwickler
insert into tom_rollen (TOMID, RoleID) values ('CON.8.A9', 28); -- Leiter Entwicklung
insert into tom_rollen (TOMID, RoleID) values ('CON.8.A9', 11); -- Entwickler
insert into tom_rollen (TOMID, RoleID) values ('CON.9.A1', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('CON.9.A2', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('CON.9.A3', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('CON.9.A4', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('CON.9.A5', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('CON.9.A5', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('CON.9.A6', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('CON.9.A7', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('CON.9.A8', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('DER.1.A1', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('DER.1.A1', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('DER.1.A10', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('DER.1.A10', 16); -- Fachverantwortliche
insert into tom_rollen (TOMID, RoleID) values ('DER.1.A11', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('DER.1.A11', 16); -- Fachverantwortliche
insert into tom_rollen (TOMID, RoleID) values ('DER.1.A12', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('DER.1.A12', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('DER.1.A12', 16); -- Fachverantwortliche
insert into tom_rollen (TOMID, RoleID) values ('DER.1.A13', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('DER.1.A14', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('DER.1.A14', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('DER.1.A15', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('DER.1.A16', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('DER.1.A17', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('DER.1.A18', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('DER.1.A2', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('DER.1.A2', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('DER.1.A3', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('DER.1.A4', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('DER.1.A4', 45); -- Vorgesetzte
insert into tom_rollen (TOMID, RoleID) values ('DER.1.A4', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('DER.1.A5', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('DER.1.A5', 16); -- Fachverantwortliche
insert into tom_rollen (TOMID, RoleID) values ('DER.1.A6', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('DER.1.A7', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('DER.1.A7', 45); -- Vorgesetzte
insert into tom_rollen (TOMID, RoleID) values ('DER.1.A7', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('DER.1.A8', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('DER.1.A8', 16); -- Fachverantwortliche
insert into tom_rollen (TOMID, RoleID) values ('DER.1.A9', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('DER.1.A9', 16); -- Fachverantwortliche
insert into tom_rollen (TOMID, RoleID) values ('DER.2.1.A1', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('DER.2.1.A1', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('DER.2.1.A10', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('DER.2.1.A10', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('DER.2.1.A10', 37); -- Notfallbeauftragter
insert into tom_rollen (TOMID, RoleID) values ('DER.2.1.A10', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('DER.2.1.A11', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('DER.2.1.A11', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('DER.2.1.A11', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('DER.2.1.A12', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('DER.2.1.A12', 37); -- Notfallbeauftragter
insert into tom_rollen (TOMID, RoleID) values ('DER.2.1.A13', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('DER.2.1.A13', 37); -- Notfallbeauftragter
insert into tom_rollen (TOMID, RoleID) values ('DER.2.1.A14', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('DER.2.1.A14', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('DER.2.1.A15', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('DER.2.1.A15', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('DER.2.1.A16', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('DER.2.1.A17', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('DER.2.1.A18', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('DER.2.1.A18', 16); -- Fachverantwortliche
insert into tom_rollen (TOMID, RoleID) values ('DER.2.1.A19', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('DER.2.1.A19', 26); -- Institutionsleitung
insert into tom_rollen (TOMID, RoleID) values ('DER.2.1.A2', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('DER.2.1.A20', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('DER.2.1.A21', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('DER.2.1.A22', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('DER.2.1.A3', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('DER.2.1.A3', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('DER.2.1.A4', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('DER.2.1.A4', 40); -- Pressestelle
insert into tom_rollen (TOMID, RoleID) values ('DER.2.1.A4', 26); -- Institutionsleitung
insert into tom_rollen (TOMID, RoleID) values ('DER.2.1.A4', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('DER.2.1.A4', 10); -- Datenschutzbeauftragter
insert into tom_rollen (TOMID, RoleID) values ('DER.2.1.A4', 37); -- Notfallbeauftragter
insert into tom_rollen (TOMID, RoleID) values ('DER.2.1.A5', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('DER.2.1.A5', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('DER.2.1.A5', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('DER.2.1.A6', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('DER.2.1.A6', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('DER.2.1.A6', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('DER.2.1.A7', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('DER.2.1.A7', 26); -- Institutionsleitung
insert into tom_rollen (TOMID, RoleID) values ('DER.2.1.A8', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('DER.2.1.A9', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('DER.2.1.A9', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('DER.2.2.A1', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('DER.2.2.A1', 10); -- Datenschutzbeauftragter
insert into tom_rollen (TOMID, RoleID) values ('DER.2.2.A1', 26); -- Institutionsleitung
insert into tom_rollen (TOMID, RoleID) values ('DER.2.2.A10', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('DER.2.2.A10', 12); -- Ermittler
insert into tom_rollen (TOMID, RoleID) values ('DER.2.2.A10', 13); -- Ermittlungsleiter
insert into tom_rollen (TOMID, RoleID) values ('DER.2.2.A11', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('DER.2.2.A11', 12); -- Ermittler
insert into tom_rollen (TOMID, RoleID) values ('DER.2.2.A11', 13); -- Ermittlungsleiter
insert into tom_rollen (TOMID, RoleID) values ('DER.2.2.A12', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('DER.2.2.A12', 12); -- Ermittler
insert into tom_rollen (TOMID, RoleID) values ('DER.2.2.A12', 13); -- Ermittlungsleiter
insert into tom_rollen (TOMID, RoleID) values ('DER.2.2.A13', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('DER.2.2.A14', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('DER.2.2.A15', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('DER.2.2.A2', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('DER.2.2.A3', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('DER.2.2.A4', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('DER.2.2.A5', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('DER.2.2.A6', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('DER.2.2.A7', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('DER.2.2.A8', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('DER.2.2.A8', 13); -- Ermittlungsleiter
insert into tom_rollen (TOMID, RoleID) values ('DER.2.2.A9', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('DER.2.2.A9', 13); -- Ermittlungsleiter
insert into tom_rollen (TOMID, RoleID) values ('DER.2.3.A1', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('DER.2.3.A1', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('DER.2.3.A10', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('DER.2.3.A2', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('DER.2.3.A2', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('DER.2.3.A2', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('DER.2.3.A3', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('DER.2.3.A4', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('DER.2.3.A5', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('DER.2.3.A6', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('DER.2.3.A7', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('DER.2.3.A8', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('DER.2.3.A9', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('DER.3.1.A1', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('DER.3.1.A1', 26); -- Institutionsleitung
insert into tom_rollen (TOMID, RoleID) values ('DER.3.1.A10', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('DER.3.1.A10', 2); -- Auditteam
insert into tom_rollen (TOMID, RoleID) values ('DER.3.1.A11', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('DER.3.1.A11', 2); -- Auditteam
insert into tom_rollen (TOMID, RoleID) values ('DER.3.1.A12', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('DER.3.1.A12', 2); -- Auditteam
insert into tom_rollen (TOMID, RoleID) values ('DER.3.1.A13', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('DER.3.1.A13', 2); -- Auditteam
insert into tom_rollen (TOMID, RoleID) values ('DER.3.1.A14', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('DER.3.1.A14', 2); -- Auditteam
insert into tom_rollen (TOMID, RoleID) values ('DER.3.1.A15', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('DER.3.1.A15', 2); -- Auditteam
insert into tom_rollen (TOMID, RoleID) values ('DER.3.1.A16', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('DER.3.1.A16', 2); -- Auditteam
insert into tom_rollen (TOMID, RoleID) values ('DER.3.1.A17', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('DER.3.1.A17', 2); -- Auditteam
insert into tom_rollen (TOMID, RoleID) values ('DER.3.1.A18', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('DER.3.1.A18', 2); -- Auditteam
insert into tom_rollen (TOMID, RoleID) values ('DER.3.1.A19', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('DER.3.1.A19', 2); -- Auditteam
insert into tom_rollen (TOMID, RoleID) values ('DER.3.1.A2', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('DER.3.1.A20', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('DER.3.1.A20', 2); -- Auditteam
insert into tom_rollen (TOMID, RoleID) values ('DER.3.1.A21', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('DER.3.1.A21', 2); -- Auditteam
insert into tom_rollen (TOMID, RoleID) values ('DER.3.1.A22', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('DER.3.1.A22', 2); -- Auditteam
insert into tom_rollen (TOMID, RoleID) values ('DER.3.1.A23', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('DER.3.1.A24', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('DER.3.1.A24', 2); -- Auditteam
insert into tom_rollen (TOMID, RoleID) values ('DER.3.1.A25', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('DER.3.1.A26', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('DER.3.1.A27', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('DER.3.1.A28', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('DER.3.1.A3', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('DER.3.1.A3', 2); -- Auditteam
insert into tom_rollen (TOMID, RoleID) values ('DER.3.1.A4', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('DER.3.1.A5', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('DER.3.1.A6', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('DER.3.1.A7', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('DER.3.1.A8', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('DER.3.1.A9', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('DER.3.2.A1', 44); -- Verantwortlicher für die IS-Revision
insert into tom_rollen (TOMID, RoleID) values ('DER.3.2.A1', 26); -- Institutionsleitung
insert into tom_rollen (TOMID, RoleID) values ('DER.3.2.A10', 44); -- Verantwortlicher für die IS-Revision
insert into tom_rollen (TOMID, RoleID) values ('DER.3.2.A11', 44); -- Verantwortlicher für die IS-Revision
insert into tom_rollen (TOMID, RoleID) values ('DER.3.2.A11', 22); -- IS-Revisionsteam
insert into tom_rollen (TOMID, RoleID) values ('DER.3.2.A12', 44); -- Verantwortlicher für die IS-Revision
insert into tom_rollen (TOMID, RoleID) values ('DER.3.2.A12', 22); -- IS-Revisionsteam
insert into tom_rollen (TOMID, RoleID) values ('DER.3.2.A13', 44); -- Verantwortlicher für die IS-Revision
insert into tom_rollen (TOMID, RoleID) values ('DER.3.2.A13', 22); -- IS-Revisionsteam
insert into tom_rollen (TOMID, RoleID) values ('DER.3.2.A14', 44); -- Verantwortlicher für die IS-Revision
insert into tom_rollen (TOMID, RoleID) values ('DER.3.2.A14', 22); -- IS-Revisionsteam
insert into tom_rollen (TOMID, RoleID) values ('DER.3.2.A15', 44); -- Verantwortlicher für die IS-Revision
insert into tom_rollen (TOMID, RoleID) values ('DER.3.2.A15', 22); -- IS-Revisionsteam
insert into tom_rollen (TOMID, RoleID) values ('DER.3.2.A16', 44); -- Verantwortlicher für die IS-Revision
insert into tom_rollen (TOMID, RoleID) values ('DER.3.2.A16', 22); -- IS-Revisionsteam
insert into tom_rollen (TOMID, RoleID) values ('DER.3.2.A17', 44); -- Verantwortlicher für die IS-Revision
insert into tom_rollen (TOMID, RoleID) values ('DER.3.2.A17', 22); -- IS-Revisionsteam
insert into tom_rollen (TOMID, RoleID) values ('DER.3.2.A18', 44); -- Verantwortlicher für die IS-Revision
insert into tom_rollen (TOMID, RoleID) values ('DER.3.2.A18', 22); -- IS-Revisionsteam
insert into tom_rollen (TOMID, RoleID) values ('DER.3.2.A19', 44); -- Verantwortlicher für die IS-Revision
insert into tom_rollen (TOMID, RoleID) values ('DER.3.2.A19', 22); -- IS-Revisionsteam
insert into tom_rollen (TOMID, RoleID) values ('DER.3.2.A2', 44); -- Verantwortlicher für die IS-Revision
insert into tom_rollen (TOMID, RoleID) values ('DER.3.2.A2', 26); -- Institutionsleitung
insert into tom_rollen (TOMID, RoleID) values ('DER.3.2.A20', 44); -- Verantwortlicher für die IS-Revision
insert into tom_rollen (TOMID, RoleID) values ('DER.3.2.A20', 22); -- IS-Revisionsteam
insert into tom_rollen (TOMID, RoleID) values ('DER.3.2.A21', 44); -- Verantwortlicher für die IS-Revision
insert into tom_rollen (TOMID, RoleID) values ('DER.3.2.A21', 22); -- IS-Revisionsteam
insert into tom_rollen (TOMID, RoleID) values ('DER.3.2.A22', 44); -- Verantwortlicher für die IS-Revision
insert into tom_rollen (TOMID, RoleID) values ('DER.3.2.A22', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('DER.3.2.A23', 44); -- Verantwortlicher für die IS-Revision
insert into tom_rollen (TOMID, RoleID) values ('DER.3.2.A3', 44); -- Verantwortlicher für die IS-Revision
insert into tom_rollen (TOMID, RoleID) values ('DER.3.2.A4', 44); -- Verantwortlicher für die IS-Revision
insert into tom_rollen (TOMID, RoleID) values ('DER.3.2.A5', 44); -- Verantwortlicher für die IS-Revision
insert into tom_rollen (TOMID, RoleID) values ('DER.3.2.A6', 44); -- Verantwortlicher für die IS-Revision
insert into tom_rollen (TOMID, RoleID) values ('DER.3.2.A6', 22); -- IS-Revisionsteam
insert into tom_rollen (TOMID, RoleID) values ('DER.3.2.A7', 44); -- Verantwortlicher für die IS-Revision
insert into tom_rollen (TOMID, RoleID) values ('DER.3.2.A7', 22); -- IS-Revisionsteam
insert into tom_rollen (TOMID, RoleID) values ('DER.3.2.A8', 44); -- Verantwortlicher für die IS-Revision
insert into tom_rollen (TOMID, RoleID) values ('DER.3.2.A9', 44); -- Verantwortlicher für die IS-Revision
insert into tom_rollen (TOMID, RoleID) values ('DER.3.2.A9', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('DER.4.A1', 37); -- Notfallbeauftragter
insert into tom_rollen (TOMID, RoleID) values ('DER.4.A10', 37); -- Notfallbeauftragter
insert into tom_rollen (TOMID, RoleID) values ('DER.4.A10', 26); -- Institutionsleitung
insert into tom_rollen (TOMID, RoleID) values ('DER.4.A11', 37); -- Notfallbeauftragter
insert into tom_rollen (TOMID, RoleID) values ('DER.4.A12', 37); -- Notfallbeauftragter
insert into tom_rollen (TOMID, RoleID) values ('DER.4.A13', 37); -- Notfallbeauftragter
insert into tom_rollen (TOMID, RoleID) values ('DER.4.A13', 26); -- Institutionsleitung
insert into tom_rollen (TOMID, RoleID) values ('DER.4.A14', 37); -- Notfallbeauftragter
insert into tom_rollen (TOMID, RoleID) values ('DER.4.A14', 26); -- Institutionsleitung
insert into tom_rollen (TOMID, RoleID) values ('DER.4.A15', 37); -- Notfallbeauftragter
insert into tom_rollen (TOMID, RoleID) values ('DER.4.A15', 26); -- Institutionsleitung
insert into tom_rollen (TOMID, RoleID) values ('DER.4.A16', 37); -- Notfallbeauftragter
insert into tom_rollen (TOMID, RoleID) values ('DER.4.A16', 26); -- Institutionsleitung
insert into tom_rollen (TOMID, RoleID) values ('DER.4.A2', 37); -- Notfallbeauftragter
insert into tom_rollen (TOMID, RoleID) values ('DER.4.A2', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('DER.4.A3', 37); -- Notfallbeauftragter
insert into tom_rollen (TOMID, RoleID) values ('DER.4.A3', 26); -- Institutionsleitung
insert into tom_rollen (TOMID, RoleID) values ('DER.4.A4', 37); -- Notfallbeauftragter
insert into tom_rollen (TOMID, RoleID) values ('DER.4.A4', 26); -- Institutionsleitung
insert into tom_rollen (TOMID, RoleID) values ('DER.4.A5', 37); -- Notfallbeauftragter
insert into tom_rollen (TOMID, RoleID) values ('DER.4.A5', 26); -- Institutionsleitung
insert into tom_rollen (TOMID, RoleID) values ('DER.4.A6', 37); -- Notfallbeauftragter
insert into tom_rollen (TOMID, RoleID) values ('DER.4.A6', 26); -- Institutionsleitung
insert into tom_rollen (TOMID, RoleID) values ('DER.4.A7', 37); -- Notfallbeauftragter
insert into tom_rollen (TOMID, RoleID) values ('DER.4.A7', 26); -- Institutionsleitung
insert into tom_rollen (TOMID, RoleID) values ('DER.4.A8', 37); -- Notfallbeauftragter
insert into tom_rollen (TOMID, RoleID) values ('DER.4.A8', 45); -- Vorgesetzte
insert into tom_rollen (TOMID, RoleID) values ('DER.4.A8', 33); -- Leiter Personal
insert into tom_rollen (TOMID, RoleID) values ('DER.4.A9', 37); -- Notfallbeauftragter
insert into tom_rollen (TOMID, RoleID) values ('DER.4.A9', 26); -- Institutionsleitung
insert into tom_rollen (TOMID, RoleID) values ('IND.1.A1', 21); -- ICS-Informationssicherheitsbeauftragter
insert into tom_rollen (TOMID, RoleID) values ('IND.1.A10', 21); -- ICS-Informationssicherheitsbeauftragter
insert into tom_rollen (TOMID, RoleID) values ('IND.1.A10', 5); -- Bereichssicherheitsbeauftragter
insert into tom_rollen (TOMID, RoleID) values ('IND.1.A11', 21); -- ICS-Informationssicherheitsbeauftragter
insert into tom_rollen (TOMID, RoleID) values ('IND.1.A12', 21); -- ICS-Informationssicherheitsbeauftragter
insert into tom_rollen (TOMID, RoleID) values ('IND.1.A13', 21); -- ICS-Informationssicherheitsbeauftragter
insert into tom_rollen (TOMID, RoleID) values ('IND.1.A14', 21); -- ICS-Informationssicherheitsbeauftragter
insert into tom_rollen (TOMID, RoleID) values ('IND.1.A15', 21); -- ICS-Informationssicherheitsbeauftragter
insert into tom_rollen (TOMID, RoleID) values ('IND.1.A16', 21); -- ICS-Informationssicherheitsbeauftragter
insert into tom_rollen (TOMID, RoleID) values ('IND.1.A17', 21); -- ICS-Informationssicherheitsbeauftragter
insert into tom_rollen (TOMID, RoleID) values ('IND.1.A2', 21); -- ICS-Informationssicherheitsbeauftragter
insert into tom_rollen (TOMID, RoleID) values ('IND.1.A3', 21); -- ICS-Informationssicherheitsbeauftragter
insert into tom_rollen (TOMID, RoleID) values ('IND.1.A4', 21); -- ICS-Informationssicherheitsbeauftragter
insert into tom_rollen (TOMID, RoleID) values ('IND.1.A5', 21); -- ICS-Informationssicherheitsbeauftragter
insert into tom_rollen (TOMID, RoleID) values ('IND.1.A5', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('IND.1.A6', 21); -- ICS-Informationssicherheitsbeauftragter
insert into tom_rollen (TOMID, RoleID) values ('IND.1.A7', 21); -- ICS-Informationssicherheitsbeauftragter
insert into tom_rollen (TOMID, RoleID) values ('IND.1.A8', 21); -- ICS-Informationssicherheitsbeauftragter
insert into tom_rollen (TOMID, RoleID) values ('IND.1.A8', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('IND.1.A9', 21); -- ICS-Informationssicherheitsbeauftragter
insert into tom_rollen (TOMID, RoleID) values ('IND.2.1.A1', 21); -- ICS-Informationssicherheitsbeauftragter
insert into tom_rollen (TOMID, RoleID) values ('IND.2.1.A1', 20); -- ICS-Administrator
insert into tom_rollen (TOMID, RoleID) values ('IND.2.1.A10', 21); -- ICS-Informationssicherheitsbeauftragter
insert into tom_rollen (TOMID, RoleID) values ('IND.2.1.A10', 35); -- Leitstellen-Operator
insert into tom_rollen (TOMID, RoleID) values ('IND.2.1.A10', 20); -- ICS-Administrator
insert into tom_rollen (TOMID, RoleID) values ('IND.2.1.A11', 21); -- ICS-Informationssicherheitsbeauftragter
insert into tom_rollen (TOMID, RoleID) values ('IND.2.1.A11', 35); -- Leitstellen-Operator
insert into tom_rollen (TOMID, RoleID) values ('IND.2.1.A11', 46); -- Wartungspersonal
insert into tom_rollen (TOMID, RoleID) values ('IND.2.1.A11', 20); -- ICS-Administrator
insert into tom_rollen (TOMID, RoleID) values ('IND.2.1.A12', 21); -- ICS-Informationssicherheitsbeauftragter
insert into tom_rollen (TOMID, RoleID) values ('IND.2.1.A12', 35); -- Leitstellen-Operator
insert into tom_rollen (TOMID, RoleID) values ('IND.2.1.A12', 20); -- ICS-Administrator
insert into tom_rollen (TOMID, RoleID) values ('IND.2.1.A13', 21); -- ICS-Informationssicherheitsbeauftragter
insert into tom_rollen (TOMID, RoleID) values ('IND.2.1.A13', 20); -- ICS-Administrator
insert into tom_rollen (TOMID, RoleID) values ('IND.2.1.A14', 21); -- ICS-Informationssicherheitsbeauftragter
insert into tom_rollen (TOMID, RoleID) values ('IND.2.1.A14', 20); -- ICS-Administrator
insert into tom_rollen (TOMID, RoleID) values ('IND.2.1.A15', 21); -- ICS-Informationssicherheitsbeauftragter
insert into tom_rollen (TOMID, RoleID) values ('IND.2.1.A15', 20); -- ICS-Administrator
insert into tom_rollen (TOMID, RoleID) values ('IND.2.1.A16', 21); -- ICS-Informationssicherheitsbeauftragter
insert into tom_rollen (TOMID, RoleID) values ('IND.2.1.A16', 20); -- ICS-Administrator
insert into tom_rollen (TOMID, RoleID) values ('IND.2.1.A17', 21); -- ICS-Informationssicherheitsbeauftragter
insert into tom_rollen (TOMID, RoleID) values ('IND.2.1.A17', 20); -- ICS-Administrator
insert into tom_rollen (TOMID, RoleID) values ('IND.2.1.A18', 21); -- ICS-Informationssicherheitsbeauftragter
insert into tom_rollen (TOMID, RoleID) values ('IND.2.1.A18', 35); -- Leitstellen-Operator
insert into tom_rollen (TOMID, RoleID) values ('IND.2.1.A18', 20); -- ICS-Administrator
insert into tom_rollen (TOMID, RoleID) values ('IND.2.1.A19', 21); -- ICS-Informationssicherheitsbeauftragter
insert into tom_rollen (TOMID, RoleID) values ('IND.2.1.A19', 20); -- ICS-Administrator
insert into tom_rollen (TOMID, RoleID) values ('IND.2.1.A2', 21); -- ICS-Informationssicherheitsbeauftragter
insert into tom_rollen (TOMID, RoleID) values ('IND.2.1.A2', 46); -- Wartungspersonal
insert into tom_rollen (TOMID, RoleID) values ('IND.2.1.A2', 20); -- ICS-Administrator
insert into tom_rollen (TOMID, RoleID) values ('IND.2.1.A20', 21); -- ICS-Informationssicherheitsbeauftragter
insert into tom_rollen (TOMID, RoleID) values ('IND.2.1.A20', 20); -- ICS-Administrator
insert into tom_rollen (TOMID, RoleID) values ('IND.2.1.A3', 21); -- ICS-Informationssicherheitsbeauftragter
insert into tom_rollen (TOMID, RoleID) values ('IND.2.1.A3', 20); -- ICS-Administrator
insert into tom_rollen (TOMID, RoleID) values ('IND.2.1.A4', 21); -- ICS-Informationssicherheitsbeauftragter
insert into tom_rollen (TOMID, RoleID) values ('IND.2.1.A4', 46); -- Wartungspersonal
insert into tom_rollen (TOMID, RoleID) values ('IND.2.1.A4', 20); -- ICS-Administrator
insert into tom_rollen (TOMID, RoleID) values ('IND.2.1.A5', 21); -- ICS-Informationssicherheitsbeauftragter
insert into tom_rollen (TOMID, RoleID) values ('IND.2.1.A5', 20); -- ICS-Administrator
insert into tom_rollen (TOMID, RoleID) values ('IND.2.1.A6', 21); -- ICS-Informationssicherheitsbeauftragter
insert into tom_rollen (TOMID, RoleID) values ('IND.2.1.A6', 20); -- ICS-Administrator
insert into tom_rollen (TOMID, RoleID) values ('IND.2.1.A7', 21); -- ICS-Informationssicherheitsbeauftragter
insert into tom_rollen (TOMID, RoleID) values ('IND.2.1.A7', 35); -- Leitstellen-Operator
insert into tom_rollen (TOMID, RoleID) values ('IND.2.1.A8', 21); -- ICS-Informationssicherheitsbeauftragter
insert into tom_rollen (TOMID, RoleID) values ('IND.2.1.A8', 20); -- ICS-Administrator
insert into tom_rollen (TOMID, RoleID) values ('IND.2.1.A9', 21); -- ICS-Informationssicherheitsbeauftragter
insert into tom_rollen (TOMID, RoleID) values ('IND.2.1.A9', 20); -- ICS-Administrator
insert into tom_rollen (TOMID, RoleID) values ('IND.2.2.A1', 21); -- ICS-Informationssicherheitsbeauftragter
insert into tom_rollen (TOMID, RoleID) values ('IND.2.2.A1', 20); -- ICS-Administrator
insert into tom_rollen (TOMID, RoleID) values ('IND.2.2.A2', 21); -- ICS-Informationssicherheitsbeauftragter
insert into tom_rollen (TOMID, RoleID) values ('IND.2.2.A2', 20); -- ICS-Administrator
insert into tom_rollen (TOMID, RoleID) values ('IND.2.2.A3', 21); -- ICS-Informationssicherheitsbeauftragter
insert into tom_rollen (TOMID, RoleID) values ('IND.2.2.A3', 20); -- ICS-Administrator
insert into tom_rollen (TOMID, RoleID) values ('IND.2.3.A1', 21); -- ICS-Informationssicherheitsbeauftragter
insert into tom_rollen (TOMID, RoleID) values ('IND.2.3.A1', 46); -- Wartungspersonal
insert into tom_rollen (TOMID, RoleID) values ('IND.2.3.A1', 20); -- ICS-Administrator
insert into tom_rollen (TOMID, RoleID) values ('IND.2.3.A2', 21); -- ICS-Informationssicherheitsbeauftragter
insert into tom_rollen (TOMID, RoleID) values ('IND.2.3.A2', 46); -- Wartungspersonal
insert into tom_rollen (TOMID, RoleID) values ('IND.2.3.A3', 21); -- ICS-Informationssicherheitsbeauftragter
insert into tom_rollen (TOMID, RoleID) values ('IND.2.4.A1', 21); -- ICS-Informationssicherheitsbeauftragter
insert into tom_rollen (TOMID, RoleID) values ('IND.2.4.A1', 20); -- ICS-Administrator
insert into tom_rollen (TOMID, RoleID) values ('IND.2.4.A2', 21); -- ICS-Informationssicherheitsbeauftragter
insert into tom_rollen (TOMID, RoleID) values ('IND.2.4.A2', 20); -- ICS-Administrator
insert into tom_rollen (TOMID, RoleID) values ('IND.2.7.A1', 8); -- Betriebsleiter
insert into tom_rollen (TOMID, RoleID) values ('IND.2.7.A1', 39); -- Planer
insert into tom_rollen (TOMID, RoleID) values ('IND.2.7.A1', 46); -- Wartungspersonal
insert into tom_rollen (TOMID, RoleID) values ('IND.2.7.A10', 8); -- Betriebsleiter
insert into tom_rollen (TOMID, RoleID) values ('IND.2.7.A10', 39); -- Planer
insert into tom_rollen (TOMID, RoleID) values ('IND.2.7.A11', 8); -- Betriebsleiter
insert into tom_rollen (TOMID, RoleID) values ('IND.2.7.A11', 39); -- Planer
insert into tom_rollen (TOMID, RoleID) values ('IND.2.7.A11', 46); -- Wartungspersonal
insert into tom_rollen (TOMID, RoleID) values ('IND.2.7.A11', 21); -- ICS-Informationssicherheitsbeauftragter
insert into tom_rollen (TOMID, RoleID) values ('IND.2.7.A12', 8); -- Betriebsleiter
insert into tom_rollen (TOMID, RoleID) values ('IND.2.7.A12', 39); -- Planer
insert into tom_rollen (TOMID, RoleID) values ('IND.2.7.A12', 19); -- Hersteller
insert into tom_rollen (TOMID, RoleID) values ('IND.2.7.A2', 8); -- Betriebsleiter
insert into tom_rollen (TOMID, RoleID) values ('IND.2.7.A2', 46); -- Wartungspersonal
insert into tom_rollen (TOMID, RoleID) values ('IND.2.7.A3', 8); -- Betriebsleiter
insert into tom_rollen (TOMID, RoleID) values ('IND.2.7.A3', 46); -- Wartungspersonal
insert into tom_rollen (TOMID, RoleID) values ('IND.2.7.A4', 8); -- Betriebsleiter
insert into tom_rollen (TOMID, RoleID) values ('IND.2.7.A4', 21); -- ICS-Informationssicherheitsbeauftragter
insert into tom_rollen (TOMID, RoleID) values ('IND.2.7.A5', 8); -- Betriebsleiter
insert into tom_rollen (TOMID, RoleID) values ('IND.2.7.A5', 21); -- ICS-Informationssicherheitsbeauftragter
insert into tom_rollen (TOMID, RoleID) values ('IND.2.7.A6', 8); -- Betriebsleiter
insert into tom_rollen (TOMID, RoleID) values ('IND.2.7.A6', 39); -- Planer
insert into tom_rollen (TOMID, RoleID) values ('IND.2.7.A6', 46); -- Wartungspersonal
insert into tom_rollen (TOMID, RoleID) values ('IND.2.7.A6', 21); -- ICS-Informationssicherheitsbeauftragter
insert into tom_rollen (TOMID, RoleID) values ('IND.2.7.A7', 8); -- Betriebsleiter
insert into tom_rollen (TOMID, RoleID) values ('IND.2.7.A7', 39); -- Planer
insert into tom_rollen (TOMID, RoleID) values ('IND.2.7.A7', 46); -- Wartungspersonal
insert into tom_rollen (TOMID, RoleID) values ('IND.2.7.A8', 8); -- Betriebsleiter
insert into tom_rollen (TOMID, RoleID) values ('IND.2.7.A8', 39); -- Planer
insert into tom_rollen (TOMID, RoleID) values ('IND.2.7.A8', 46); -- Wartungspersonal
insert into tom_rollen (TOMID, RoleID) values ('IND.2.7.A8', 21); -- ICS-Informationssicherheitsbeauftragter
insert into tom_rollen (TOMID, RoleID) values ('IND.2.7.A9', 8); -- Betriebsleiter
insert into tom_rollen (TOMID, RoleID) values ('IND.2.7.A9', 39); -- Planer
insert into tom_rollen (TOMID, RoleID) values ('IND.2.7.A9', 46); -- Wartungspersonal
insert into tom_rollen (TOMID, RoleID) values ('IND.2.7.A9', 21); -- ICS-Informationssicherheitsbeauftragter
insert into tom_rollen (TOMID, RoleID) values ('INF.1.A1', 18); -- Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.1.A1', 39); -- Planer
insert into tom_rollen (TOMID, RoleID) values ('INF.1.A10', 18); -- Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.1.A10', 14); -- Errichterfirma
insert into tom_rollen (TOMID, RoleID) values ('INF.1.A10', 3); -- Bauleiter
insert into tom_rollen (TOMID, RoleID) values ('INF.1.A11', 18); -- Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.1.A11', 36); -- Mitarbeiter
insert into tom_rollen (TOMID, RoleID) values ('INF.1.A12', 18); -- Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.1.A13', 18); -- Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.1.A14', 18); -- Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.1.A15', 18); -- Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.1.A16', 18); -- Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.1.A17', 18); -- Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.1.A17', 39); -- Planer
insert into tom_rollen (TOMID, RoleID) values ('INF.1.A18', 18); -- Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.1.A19', 18); -- Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.1.A2', 18); -- Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.1.A20', 18); -- Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.1.A21', 18); -- Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.1.A22', 18); -- Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.1.A23', 18); -- Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.1.A23', 39); -- Planer
insert into tom_rollen (TOMID, RoleID) values ('INF.1.A24', 18); -- Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.1.A25', 18); -- Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.1.A25', 26); -- Institutionsleitung
insert into tom_rollen (TOMID, RoleID) values ('INF.1.A26', 18); -- Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.1.A27', 18); -- Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.1.A28', 18); -- Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.1.A29', 18); -- Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.1.A3', 18); -- Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.1.A30', 18); -- Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.1.A31', 18); -- Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.1.A31', 25); -- Innerer Dienst
insert into tom_rollen (TOMID, RoleID) values ('INF.1.A32', 18); -- Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.1.A33', 18); -- Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.1.A34', 18); -- Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.1.A4', 18); -- Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.1.A4', 39); -- Planer
insert into tom_rollen (TOMID, RoleID) values ('INF.1.A5', 18); -- Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.1.A6', 18); -- Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.1.A6', 36); -- Mitarbeiter
insert into tom_rollen (TOMID, RoleID) values ('INF.1.A7', 18); -- Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.1.A7', 32); -- Leiter Organisation
insert into tom_rollen (TOMID, RoleID) values ('INF.1.A8', 18); -- Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.1.A9', 18); -- Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.1.A9', 39); -- Planer
insert into tom_rollen (TOMID, RoleID) values ('INF.1.A9', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('INF.10.A1', 32); -- Leiter Organisation
insert into tom_rollen (TOMID, RoleID) values ('INF.10.A1', 18); -- Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.10.A1', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('INF.10.A10', 32); -- Leiter Organisation
insert into tom_rollen (TOMID, RoleID) values ('INF.10.A2', 32); -- Leiter Organisation
insert into tom_rollen (TOMID, RoleID) values ('INF.10.A2', 36); -- Mitarbeiter
insert into tom_rollen (TOMID, RoleID) values ('INF.10.A3', 32); -- Leiter Organisation
insert into tom_rollen (TOMID, RoleID) values ('INF.10.A3', 36); -- Mitarbeiter
insert into tom_rollen (TOMID, RoleID) values ('INF.10.A4', 32); -- Leiter Organisation
insert into tom_rollen (TOMID, RoleID) values ('INF.10.A5', 32); -- Leiter Organisation
insert into tom_rollen (TOMID, RoleID) values ('INF.10.A6', 32); -- Leiter Organisation
insert into tom_rollen (TOMID, RoleID) values ('INF.10.A6', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('INF.10.A7', 32); -- Leiter Organisation
insert into tom_rollen (TOMID, RoleID) values ('INF.10.A7', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('INF.10.A8', 32); -- Leiter Organisation
insert into tom_rollen (TOMID, RoleID) values ('INF.10.A9', 32); -- Leiter Organisation
insert into tom_rollen (TOMID, RoleID) values ('INF.10.A9', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('INF.2.A1', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('INF.2.A1', 18); -- Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.2.A1', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('INF.2.A1', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('INF.2.A1', 39); -- Planer
insert into tom_rollen (TOMID, RoleID) values ('INF.2.A10', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('INF.2.A10', 46); -- Wartungspersonal
insert into tom_rollen (TOMID, RoleID) values ('INF.2.A10', 18); -- Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.2.A10', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('INF.2.A11', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('INF.2.A11', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('INF.2.A11', 18); -- Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.2.A12', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('INF.2.A12', 39); -- Planer
insert into tom_rollen (TOMID, RoleID) values ('INF.2.A12', 18); -- Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.2.A13', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('INF.2.A13', 18); -- Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.2.A14', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('INF.2.A14', 39); -- Planer
insert into tom_rollen (TOMID, RoleID) values ('INF.2.A14', 18); -- Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.2.A15', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('INF.2.A15', 39); -- Planer
insert into tom_rollen (TOMID, RoleID) values ('INF.2.A15', 18); -- Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.2.A16', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('INF.2.A16', 39); -- Planer
insert into tom_rollen (TOMID, RoleID) values ('INF.2.A17', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('INF.2.A17', 39); -- Planer
insert into tom_rollen (TOMID, RoleID) values ('INF.2.A17', 18); -- Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.2.A18', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('INF.2.A19', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('INF.2.A19', 18); -- Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.2.A2', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('INF.2.A2', 39); -- Planer
insert into tom_rollen (TOMID, RoleID) values ('INF.2.A20', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('INF.2.A20', 18); -- Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.2.A21', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('INF.2.A22', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('INF.2.A22', 18); -- Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.2.A23', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('INF.2.A23', 18); -- Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.2.A24', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('INF.2.A24', 10); -- Datenschutzbeauftragter
insert into tom_rollen (TOMID, RoleID) values ('INF.2.A24', 18); -- Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.2.A24', 39); -- Planer
insert into tom_rollen (TOMID, RoleID) values ('INF.2.A25', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('INF.2.A25', 39); -- Planer
insert into tom_rollen (TOMID, RoleID) values ('INF.2.A26', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('INF.2.A26', 39); -- Planer
insert into tom_rollen (TOMID, RoleID) values ('INF.2.A27', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('INF.2.A28', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('INF.2.A28', 39); -- Planer
insert into tom_rollen (TOMID, RoleID) values ('INF.2.A29', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('INF.2.A29', 18); -- Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.2.A29', 39); -- Planer
insert into tom_rollen (TOMID, RoleID) values ('INF.2.A3', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('INF.2.A3', 18); -- Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.2.A30', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('INF.2.A30', 18); -- Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.2.A30', 39); -- Planer
insert into tom_rollen (TOMID, RoleID) values ('INF.2.A4', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('INF.2.A4', 18); -- Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.2.A5', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('INF.2.A5', 18); -- Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.2.A6', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('INF.2.A6', 18); -- Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.2.A6', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('INF.2.A6', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('INF.2.A7', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('INF.2.A7', 36); -- Mitarbeiter
insert into tom_rollen (TOMID, RoleID) values ('INF.2.A7', 18); -- Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.2.A8', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('INF.2.A8', 39); -- Planer
insert into tom_rollen (TOMID, RoleID) values ('INF.2.A9', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('INF.2.A9', 18); -- Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.3.A1', 29); -- Leiter Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.3.A10', 29); -- Leiter Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.3.A11', 29); -- Leiter Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.3.A12', 29); -- Leiter Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.3.A13', 29); -- Leiter Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.3.A14', 29); -- Leiter Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.3.A15', 29); -- Leiter Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.3.A16', 29); -- Leiter Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.3.A17', 29); -- Leiter Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.3.A18', 29); -- Leiter Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.3.A2', 29); -- Leiter Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.3.A2', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('INF.3.A3', 29); -- Leiter Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.3.A4', 29); -- Leiter Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.3.A5', 29); -- Leiter Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.3.A6', 29); -- Leiter Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.3.A7', 29); -- Leiter Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.3.A8', 29); -- Leiter Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.3.A9', 29); -- Leiter Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.4.A1', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('INF.4.A1', 29); -- Leiter Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.4.A10', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('INF.4.A11', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('INF.4.A12', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('INF.4.A13', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('INF.4.A14', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('INF.4.A15', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('INF.4.A2', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('INF.4.A2', 29); -- Leiter Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.4.A3', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('INF.4.A3', 29); -- Leiter Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.4.A4', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('INF.4.A5', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('INF.4.A5', 29); -- Leiter Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.4.A6', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('INF.4.A7', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('INF.4.A7', 29); -- Leiter Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.4.A8', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('INF.4.A8', 29); -- Leiter Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.4.A9', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('INF.5.A1', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('INF.5.A1', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('INF.5.A1', 39); -- Planer
insert into tom_rollen (TOMID, RoleID) values ('INF.5.A10', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('INF.5.A10', 18); -- Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.5.A11', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('INF.5.A11', 39); -- Planer
insert into tom_rollen (TOMID, RoleID) values ('INF.5.A11', 18); -- Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.5.A12', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('INF.5.A12', 39); -- Planer
insert into tom_rollen (TOMID, RoleID) values ('INF.5.A13', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('INF.5.A13', 39); -- Planer
insert into tom_rollen (TOMID, RoleID) values ('INF.5.A13', 18); -- Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.5.A14', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('INF.5.A14', 39); -- Planer
insert into tom_rollen (TOMID, RoleID) values ('INF.5.A14', 18); -- Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.5.A15', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('INF.5.A15', 39); -- Planer
insert into tom_rollen (TOMID, RoleID) values ('INF.5.A15', 18); -- Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.5.A16', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('INF.5.A16', 18); -- Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.5.A17', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('INF.5.A17', 18); -- Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.5.A17', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('INF.5.A17', 46); -- Wartungspersonal
insert into tom_rollen (TOMID, RoleID) values ('INF.5.A18', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('INF.5.A18', 39); -- Planer
insert into tom_rollen (TOMID, RoleID) values ('INF.5.A19', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('INF.5.A19', 39); -- Planer
insert into tom_rollen (TOMID, RoleID) values ('INF.5.A2', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('INF.5.A2', 39); -- Planer
insert into tom_rollen (TOMID, RoleID) values ('INF.5.A20', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('INF.5.A20', 39); -- Planer
insert into tom_rollen (TOMID, RoleID) values ('INF.5.A21', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('INF.5.A21', 39); -- Planer
insert into tom_rollen (TOMID, RoleID) values ('INF.5.A21', 18); -- Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.5.A21', 46); -- Wartungspersonal
insert into tom_rollen (TOMID, RoleID) values ('INF.5.A22', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('INF.5.A22', 39); -- Planer
insert into tom_rollen (TOMID, RoleID) values ('INF.5.A23', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('INF.5.A23', 39); -- Planer
insert into tom_rollen (TOMID, RoleID) values ('INF.5.A23', 18); -- Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.5.A23', 46); -- Wartungspersonal
insert into tom_rollen (TOMID, RoleID) values ('INF.5.A24', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('INF.5.A24', 39); -- Planer
insert into tom_rollen (TOMID, RoleID) values ('INF.5.A24', 18); -- Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.5.A24', 46); -- Wartungspersonal
insert into tom_rollen (TOMID, RoleID) values ('INF.5.A25', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('INF.5.A25', 39); -- Planer
insert into tom_rollen (TOMID, RoleID) values ('INF.5.A26', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('INF.5.A26', 39); -- Planer
insert into tom_rollen (TOMID, RoleID) values ('INF.5.A26', 18); -- Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.5.A3', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('INF.5.A3', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('INF.5.A3', 18); -- Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.5.A3', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('INF.5.A4', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('INF.5.A4', 39); -- Planer
insert into tom_rollen (TOMID, RoleID) values ('INF.5.A4', 18); -- Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.5.A5', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('INF.5.A5', 39); -- Planer
insert into tom_rollen (TOMID, RoleID) values ('INF.5.A6', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('INF.5.A6', 36); -- Mitarbeiter
insert into tom_rollen (TOMID, RoleID) values ('INF.5.A6', 39); -- Planer
insert into tom_rollen (TOMID, RoleID) values ('INF.5.A7', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('INF.5.A7', 36); -- Mitarbeiter
insert into tom_rollen (TOMID, RoleID) values ('INF.5.A7', 39); -- Planer
insert into tom_rollen (TOMID, RoleID) values ('INF.5.A8', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('INF.5.A8', 39); -- Planer
insert into tom_rollen (TOMID, RoleID) values ('INF.5.A9', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('INF.5.A9', 18); -- Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.6.A1', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('INF.6.A1', 9); -- Brandschutzbeauftragter
insert into tom_rollen (TOMID, RoleID) values ('INF.6.A2', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('INF.6.A2', 18); -- Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.6.A3', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('INF.6.A4', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('INF.6.A4', 36); -- Mitarbeiter
insert into tom_rollen (TOMID, RoleID) values ('INF.6.A5', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('INF.6.A5', 36); -- Mitarbeiter
insert into tom_rollen (TOMID, RoleID) values ('INF.6.A6', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('INF.6.A6', 18); -- Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.6.A7', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('INF.6.A7', 18); -- Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.6.A8', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('INF.6.A8', 39); -- Planer
insert into tom_rollen (TOMID, RoleID) values ('INF.6.A9', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('INF.6.A9', 18); -- Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.7.A1', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('INF.7.A1', 36); -- Mitarbeiter
insert into tom_rollen (TOMID, RoleID) values ('INF.7.A1', 45); -- Vorgesetzte
insert into tom_rollen (TOMID, RoleID) values ('INF.7.A2', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('INF.7.A2', 36); -- Mitarbeiter
insert into tom_rollen (TOMID, RoleID) values ('INF.7.A3', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('INF.7.A4', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('INF.7.A5', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('INF.7.A5', 29); -- Leiter Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.7.A6', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('INF.7.A6', 36); -- Mitarbeiter
insert into tom_rollen (TOMID, RoleID) values ('INF.7.A7', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('INF.7.A7', 36); -- Mitarbeiter
insert into tom_rollen (TOMID, RoleID) values ('INF.7.A7', 29); -- Leiter Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.7.A8', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('INF.7.A8', 36); -- Mitarbeiter
insert into tom_rollen (TOMID, RoleID) values ('INF.7.A8', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('INF.8.A1', 36); -- Mitarbeiter
insert into tom_rollen (TOMID, RoleID) values ('INF.8.A2', 36); -- Mitarbeiter
insert into tom_rollen (TOMID, RoleID) values ('INF.8.A2', 18); -- Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('INF.8.A3', 36); -- Mitarbeiter
insert into tom_rollen (TOMID, RoleID) values ('INF.8.A4', 36); -- Mitarbeiter
insert into tom_rollen (TOMID, RoleID) values ('INF.8.A5', 36); -- Mitarbeiter
insert into tom_rollen (TOMID, RoleID) values ('INF.8.A6', 36); -- Mitarbeiter
insert into tom_rollen (TOMID, RoleID) values ('INF.8.A6', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('INF.9.A1', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('INF.9.A1', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('INF.9.A10', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('INF.9.A10', 36); -- Mitarbeiter
insert into tom_rollen (TOMID, RoleID) values ('INF.9.A11', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('INF.9.A11', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('INF.9.A2', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('INF.9.A2', 38); -- Personalabteilung
insert into tom_rollen (TOMID, RoleID) values ('INF.9.A3', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('INF.9.A3', 38); -- Personalabteilung
insert into tom_rollen (TOMID, RoleID) values ('INF.9.A4', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('INF.9.A4', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('INF.9.A5', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('INF.9.A5', 36); -- Mitarbeiter
insert into tom_rollen (TOMID, RoleID) values ('INF.9.A6', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('INF.9.A6', 36); -- Mitarbeiter
insert into tom_rollen (TOMID, RoleID) values ('INF.9.A7', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('INF.9.A7', 38); -- Personalabteilung
insert into tom_rollen (TOMID, RoleID) values ('INF.9.A8', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('INF.9.A8', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('INF.9.A9', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('INF.9.A9', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('ISMS.1.A1', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('ISMS.1.A1', 26); -- Institutionsleitung
insert into tom_rollen (TOMID, RoleID) values ('ISMS.1.A10', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('ISMS.1.A11', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('ISMS.1.A12', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('ISMS.1.A12', 26); -- Institutionsleitung
insert into tom_rollen (TOMID, RoleID) values ('ISMS.1.A13', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('ISMS.1.A14', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('ISMS.1.A15', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('ISMS.1.A16', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('ISMS.1.A17', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('ISMS.1.A2', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('ISMS.1.A2', 26); -- Institutionsleitung
insert into tom_rollen (TOMID, RoleID) values ('ISMS.1.A3', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('ISMS.1.A3', 26); -- Institutionsleitung
insert into tom_rollen (TOMID, RoleID) values ('ISMS.1.A4', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('ISMS.1.A4', 26); -- Institutionsleitung
insert into tom_rollen (TOMID, RoleID) values ('ISMS.1.A5', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('ISMS.1.A5', 26); -- Institutionsleitung
insert into tom_rollen (TOMID, RoleID) values ('ISMS.1.A6', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('ISMS.1.A6', 26); -- Institutionsleitung
insert into tom_rollen (TOMID, RoleID) values ('ISMS.1.A7', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('ISMS.1.A8', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('ISMS.1.A8', 45); -- Vorgesetzte
insert into tom_rollen (TOMID, RoleID) values ('ISMS.1.A9', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('ISMS.1.A9', 26); -- Institutionsleitung
insert into tom_rollen (TOMID, RoleID) values ('NET.1.1.A1', 31); -- Leiter Netze
insert into tom_rollen (TOMID, RoleID) values ('NET.1.1.A1', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('NET.1.1.A1', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('NET.1.1.A10', 31); -- Leiter Netze
insert into tom_rollen (TOMID, RoleID) values ('NET.1.1.A11', 31); -- Leiter Netze
insert into tom_rollen (TOMID, RoleID) values ('NET.1.1.A12', 31); -- Leiter Netze
insert into tom_rollen (TOMID, RoleID) values ('NET.1.1.A13', 31); -- Leiter Netze
insert into tom_rollen (TOMID, RoleID) values ('NET.1.1.A14', 31); -- Leiter Netze
insert into tom_rollen (TOMID, RoleID) values ('NET.1.1.A15', 31); -- Leiter Netze
insert into tom_rollen (TOMID, RoleID) values ('NET.1.1.A15', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('NET.1.1.A16', 31); -- Leiter Netze
insert into tom_rollen (TOMID, RoleID) values ('NET.1.1.A17', 31); -- Leiter Netze
insert into tom_rollen (TOMID, RoleID) values ('NET.1.1.A18', 31); -- Leiter Netze
insert into tom_rollen (TOMID, RoleID) values ('NET.1.1.A19', 31); -- Leiter Netze
insert into tom_rollen (TOMID, RoleID) values ('NET.1.1.A2', 31); -- Leiter Netze
insert into tom_rollen (TOMID, RoleID) values ('NET.1.1.A2', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.1.1.A20', 31); -- Leiter Netze
insert into tom_rollen (TOMID, RoleID) values ('NET.1.1.A21', 31); -- Leiter Netze
insert into tom_rollen (TOMID, RoleID) values ('NET.1.1.A22', 31); -- Leiter Netze
insert into tom_rollen (TOMID, RoleID) values ('NET.1.1.A23', 31); -- Leiter Netze
insert into tom_rollen (TOMID, RoleID) values ('NET.1.1.A24', 31); -- Leiter Netze
insert into tom_rollen (TOMID, RoleID) values ('NET.1.1.A25', 31); -- Leiter Netze
insert into tom_rollen (TOMID, RoleID) values ('NET.1.1.A26', 31); -- Leiter Netze
insert into tom_rollen (TOMID, RoleID) values ('NET.1.1.A27', 31); -- Leiter Netze
insert into tom_rollen (TOMID, RoleID) values ('NET.1.1.A27', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('NET.1.1.A28', 31); -- Leiter Netze
insert into tom_rollen (TOMID, RoleID) values ('NET.1.1.A29', 31); -- Leiter Netze
insert into tom_rollen (TOMID, RoleID) values ('NET.1.1.A3', 31); -- Leiter Netze
insert into tom_rollen (TOMID, RoleID) values ('NET.1.1.A30', 31); -- Leiter Netze
insert into tom_rollen (TOMID, RoleID) values ('NET.1.1.A31', 31); -- Leiter Netze
insert into tom_rollen (TOMID, RoleID) values ('NET.1.1.A32', 31); -- Leiter Netze
insert into tom_rollen (TOMID, RoleID) values ('NET.1.1.A33', 31); -- Leiter Netze
insert into tom_rollen (TOMID, RoleID) values ('NET.1.1.A34', 31); -- Leiter Netze
insert into tom_rollen (TOMID, RoleID) values ('NET.1.1.A35', 31); -- Leiter Netze
insert into tom_rollen (TOMID, RoleID) values ('NET.1.1.A35', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('NET.1.1.A36', 31); -- Leiter Netze
insert into tom_rollen (TOMID, RoleID) values ('NET.1.1.A4', 31); -- Leiter Netze
insert into tom_rollen (TOMID, RoleID) values ('NET.1.1.A5', 31); -- Leiter Netze
insert into tom_rollen (TOMID, RoleID) values ('NET.1.1.A6', 31); -- Leiter Netze
insert into tom_rollen (TOMID, RoleID) values ('NET.1.1.A7', 31); -- Leiter Netze
insert into tom_rollen (TOMID, RoleID) values ('NET.1.1.A8', 31); -- Leiter Netze
insert into tom_rollen (TOMID, RoleID) values ('NET.1.1.A9', 31); -- Leiter Netze
insert into tom_rollen (TOMID, RoleID) values ('NET.1.2.A1', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.1.2.A10', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.1.2.A11', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.1.2.A11', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('NET.1.2.A12', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.1.2.A13', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.1.2.A13', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('NET.1.2.A14', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.1.2.A15', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.1.2.A16', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.1.2.A17', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.1.2.A18', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.1.2.A18', 45); -- Vorgesetzte
insert into tom_rollen (TOMID, RoleID) values ('NET.1.2.A19', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.1.2.A2', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.1.2.A2', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('NET.1.2.A20', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.1.2.A21', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.1.2.A22', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.1.2.A23', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.1.2.A24', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.1.2.A25', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.1.2.A26', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.1.2.A27', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.1.2.A28', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.1.2.A29', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.1.2.A3', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.1.2.A30', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.1.2.A31', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.1.2.A32', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.1.2.A33', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.1.2.A33', 31); -- Leiter Netze
insert into tom_rollen (TOMID, RoleID) values ('NET.1.2.A34', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.1.2.A35', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.1.2.A36', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.1.2.A37', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.1.2.A38', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.1.2.A4', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.1.2.A4', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('NET.1.2.A4', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('NET.1.2.A5', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.1.2.A6', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.1.2.A7', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.1.2.A8', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.1.2.A9', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.2.1.A1', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.2.1.A1', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('NET.2.1.A10', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.2.1.A11', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.2.1.A12', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.2.1.A13', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.2.1.A14', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.2.1.A15', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.2.1.A16', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.2.1.A17', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.2.1.A18', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.2.1.A2', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.2.1.A2', 39); -- Planer
insert into tom_rollen (TOMID, RoleID) values ('NET.2.1.A3', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.2.1.A3', 39); -- Planer
insert into tom_rollen (TOMID, RoleID) values ('NET.2.1.A4', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.2.1.A4', 18); -- Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('NET.2.1.A5', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.2.1.A6', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.2.1.A7', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.2.1.A7', 39); -- Planer
insert into tom_rollen (TOMID, RoleID) values ('NET.2.1.A8', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.2.1.A9', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.2.1.A9', 39); -- Planer
insert into tom_rollen (TOMID, RoleID) values ('NET.2.2.A1', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('NET.2.2.A1', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('NET.2.2.A2', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('NET.2.2.A2', 45); -- Vorgesetzte
insert into tom_rollen (TOMID, RoleID) values ('NET.2.2.A2', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('NET.2.2.A3', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('NET.2.2.A3', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.2.2.A4', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('NET.3.1.A1', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.3.1.A10', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.3.1.A10', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('NET.3.1.A11', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.3.1.A12', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.3.1.A13', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.3.1.A14', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.3.1.A15', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.3.1.A16', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.3.1.A17', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.3.1.A18', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.3.1.A19', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.3.1.A2', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.3.1.A20', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.3.1.A21', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.3.1.A22', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.3.1.A23', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.3.1.A24', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.3.1.A25', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.3.1.A26', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.3.1.A27', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.3.1.A28', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.3.1.A3', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.3.1.A4', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.3.1.A5', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.3.1.A6', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.3.1.A7', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.3.1.A8', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.3.1.A9', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.3.2.A1', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.3.2.A10', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.3.2.A11', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.3.2.A12', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.3.2.A13', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.3.2.A14', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.3.2.A15', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.3.2.A16', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.3.2.A17', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.3.2.A18', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.3.2.A19', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.3.2.A2', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.3.2.A20', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.3.2.A21', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.3.2.A22', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.3.2.A23', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.3.2.A24', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.3.2.A25', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.3.2.A26', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.3.2.A27', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.3.2.A28', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.3.2.A29', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.3.2.A3', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.3.2.A30', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.3.2.A31', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.3.2.A4', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.3.2.A5', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.3.2.A6', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.3.2.A7', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.3.2.A8', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.3.2.A9', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.3.3.A1', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.3.3.A10', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.3.3.A11', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.3.3.A12', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.3.3.A13', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.3.3.A2', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.3.3.A2', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('NET.3.3.A3', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.3.3.A4', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.3.3.A5', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.3.3.A6', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.3.3.A7', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.3.3.A8', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.3.3.A9', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.4.1.A1', 41); -- TK-Anlagen-Verantwortlicher
insert into tom_rollen (TOMID, RoleID) values ('NET.4.1.A1', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('NET.4.1.A1', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.4.1.A10', 41); -- TK-Anlagen-Verantwortlicher
insert into tom_rollen (TOMID, RoleID) values ('NET.4.1.A10', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.4.1.A11', 41); -- TK-Anlagen-Verantwortlicher
insert into tom_rollen (TOMID, RoleID) values ('NET.4.1.A11', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.4.1.A12', 41); -- TK-Anlagen-Verantwortlicher
insert into tom_rollen (TOMID, RoleID) values ('NET.4.1.A13', 41); -- TK-Anlagen-Verantwortlicher
insert into tom_rollen (TOMID, RoleID) values ('NET.4.1.A14', 41); -- TK-Anlagen-Verantwortlicher
insert into tom_rollen (TOMID, RoleID) values ('NET.4.1.A15', 41); -- TK-Anlagen-Verantwortlicher
insert into tom_rollen (TOMID, RoleID) values ('NET.4.1.A16', 41); -- TK-Anlagen-Verantwortlicher
insert into tom_rollen (TOMID, RoleID) values ('NET.4.1.A17', 41); -- TK-Anlagen-Verantwortlicher
insert into tom_rollen (TOMID, RoleID) values ('NET.4.1.A18', 41); -- TK-Anlagen-Verantwortlicher
insert into tom_rollen (TOMID, RoleID) values ('NET.4.1.A19', 41); -- TK-Anlagen-Verantwortlicher
insert into tom_rollen (TOMID, RoleID) values ('NET.4.1.A2', 41); -- TK-Anlagen-Verantwortlicher
insert into tom_rollen (TOMID, RoleID) values ('NET.4.1.A2', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('NET.4.1.A3', 41); -- TK-Anlagen-Verantwortlicher
insert into tom_rollen (TOMID, RoleID) values ('NET.4.1.A4', 41); -- TK-Anlagen-Verantwortlicher
insert into tom_rollen (TOMID, RoleID) values ('NET.4.1.A5', 41); -- TK-Anlagen-Verantwortlicher
insert into tom_rollen (TOMID, RoleID) values ('NET.4.1.A6', 41); -- TK-Anlagen-Verantwortlicher
insert into tom_rollen (TOMID, RoleID) values ('NET.4.1.A6', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('NET.4.1.A7', 41); -- TK-Anlagen-Verantwortlicher
insert into tom_rollen (TOMID, RoleID) values ('NET.4.1.A8', 41); -- TK-Anlagen-Verantwortlicher
insert into tom_rollen (TOMID, RoleID) values ('NET.4.1.A9', 41); -- TK-Anlagen-Verantwortlicher
insert into tom_rollen (TOMID, RoleID) values ('NET.4.1.A9', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('NET.4.2.A1', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.4.2.A1', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('NET.4.2.A10', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.4.2.A11', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.4.2.A11', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('NET.4.2.A12', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.4.2.A13', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.4.2.A14', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.4.2.A15', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.4.2.A16', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.4.2.A2', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.4.2.A2', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('NET.4.2.A3', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.4.2.A4', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.4.2.A4', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('NET.4.2.A5', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.4.2.A6', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.4.2.A7', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.4.2.A8', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.4.2.A9', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.4.3.A1', 17); -- Fax-Verantwortlicher
insert into tom_rollen (TOMID, RoleID) values ('NET.4.3.A1', 18); -- Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('NET.4.3.A10', 17); -- Fax-Verantwortlicher
insert into tom_rollen (TOMID, RoleID) values ('NET.4.3.A11', 17); -- Fax-Verantwortlicher
insert into tom_rollen (TOMID, RoleID) values ('NET.4.3.A11', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.4.3.A12', 17); -- Fax-Verantwortlicher
insert into tom_rollen (TOMID, RoleID) values ('NET.4.3.A13', 17); -- Fax-Verantwortlicher
insert into tom_rollen (TOMID, RoleID) values ('NET.4.3.A13', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('NET.4.3.A14', 17); -- Fax-Verantwortlicher
insert into tom_rollen (TOMID, RoleID) values ('NET.4.3.A14', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('NET.4.3.A15', 17); -- Fax-Verantwortlicher
insert into tom_rollen (TOMID, RoleID) values ('NET.4.3.A15', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('NET.4.3.A2', 17); -- Fax-Verantwortlicher
insert into tom_rollen (TOMID, RoleID) values ('NET.4.3.A3', 17); -- Fax-Verantwortlicher
insert into tom_rollen (TOMID, RoleID) values ('NET.4.3.A3', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('NET.4.3.A4', 17); -- Fax-Verantwortlicher
insert into tom_rollen (TOMID, RoleID) values ('NET.4.3.A4', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('NET.4.3.A5', 17); -- Fax-Verantwortlicher
insert into tom_rollen (TOMID, RoleID) values ('NET.4.3.A6', 17); -- Fax-Verantwortlicher
insert into tom_rollen (TOMID, RoleID) values ('NET.4.3.A6', 7); -- Beschaffungsstelle
insert into tom_rollen (TOMID, RoleID) values ('NET.4.3.A7', 17); -- Fax-Verantwortlicher
insert into tom_rollen (TOMID, RoleID) values ('NET.4.3.A7', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('NET.4.3.A8', 17); -- Fax-Verantwortlicher
insert into tom_rollen (TOMID, RoleID) values ('NET.4.3.A9', 17); -- Fax-Verantwortlicher
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.2.A1', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.2.A1', 33); -- Leiter Personal
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.2.A10', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.2.A11', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.2.A11', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.2.A12', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.2.A12', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.2.A13', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.2.A14', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.2.A14', 33); -- Leiter Personal
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.2.A15', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.2.A16', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.2.A17', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.2.A18', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.2.A19', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.2.A2', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.2.A3', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.2.A4', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.2.A4', 33); -- Leiter Personal
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.2.A5', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.2.A6', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.2.A7', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.2.A8', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.2.A9', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.3.A1', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.3.A1', 16); -- Fachverantwortliche
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.3.A10', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.3.A11', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.3.A11', 47); -- Änderungsmanager
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.3.A12', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.3.A13', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.3.A14', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.3.A14', 47); -- Änderungsmanager
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.3.A2', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.3.A2', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.3.A3', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.3.A4', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.3.A4', 47); -- Änderungsmanager
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.3.A5', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.3.A5', 47); -- Änderungsmanager
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.3.A6', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.3.A6', 47); -- Änderungsmanager
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.3.A7', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.3.A7', 47); -- Änderungsmanager
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.3.A8', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.3.A9', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.4.A1', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.4.A10', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.4.A11', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.4.A12', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.4.A13', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.4.A14', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.4.A15', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.4.A2', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.4.A3', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.4.A4', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.4.A4', 16); -- Fachverantwortliche
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.4.A5', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.4.A6', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.4.A7', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.4.A7', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.4.A8', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.4.A9', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.4.A9', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.5.A1', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.5.A1', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.5.A1', 16); -- Fachverantwortliche
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.5.A10', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.5.A11', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.5.A12', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.5.A13', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.5.A13', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.5.A2', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.5.A2', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.5.A3', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.5.A4', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.5.A5', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.5.A5', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.5.A6', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.5.A7', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.5.A8', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.5.A9', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.6.A1', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.6.A10', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.6.A11', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.6.A11', 10); -- Datenschutzbeauftragter
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.6.A11', 43); -- Tester
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.6.A12', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.6.A12', 43); -- Tester
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.6.A13', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.6.A13', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.6.A14', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.6.A14', 43); -- Tester
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.6.A2', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.6.A2', 43); -- Tester
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.6.A3', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.6.A3', 43); -- Tester
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.6.A4', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.6.A4', 16); -- Fachverantwortliche
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.6.A5', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.6.A5', 43); -- Tester
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.6.A6', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.6.A6', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.6.A6', 16); -- Fachverantwortliche
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.6.A7', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.6.A7', 38); -- Personalabteilung
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.6.A8', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.6.A8', 33); -- Leiter Personal
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.6.A9', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.6.A9', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.1.6.A9', 43); -- Tester
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.2.A1', 1); -- Archivverwalter
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.2.A1', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.2.A10', 1); -- Archivverwalter
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.2.A10', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.2.A10', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.2.A11', 1); -- Archivverwalter
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.2.A11', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.2.A11', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.2.A11', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.2.A12', 1); -- Archivverwalter
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.2.A12', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.2.A12', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.2.A13', 1); -- Archivverwalter
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.2.A14', 1); -- Archivverwalter
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.2.A14', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.2.A15', 1); -- Archivverwalter
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.2.A15', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.2.A15', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.2.A16', 1); -- Archivverwalter
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.2.A16', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.2.A16', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.2.A17', 1); -- Archivverwalter
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.2.A17', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.2.A18', 1); -- Archivverwalter
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.2.A18', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.2.A18', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.2.A19', 1); -- Archivverwalter
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.2.A19', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.2.A19', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.2.A2', 1); -- Archivverwalter
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.2.A2', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.2.A20', 1); -- Archivverwalter
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.2.A20', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.2.A21', 1); -- Archivverwalter
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.2.A3', 1); -- Archivverwalter
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.2.A3', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.2.A3', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.2.A4', 1); -- Archivverwalter
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.2.A4', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.2.A4', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.2.A4', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.2.A5', 1); -- Archivverwalter
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.2.A5', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.2.A6', 1); -- Archivverwalter
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.2.A6', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.2.A6', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.2.A7', 1); -- Archivverwalter
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.2.A7', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.2.A7', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.2.A8', 1); -- Archivverwalter
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.2.A8', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.2.A8', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.2.A9', 1); -- Archivverwalter
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.2.A9', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.2.A9', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.4.A1', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.4.A1', 45); -- Vorgesetzte
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.4.A1', 38); -- Personalabteilung
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.4.A10', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.4.A10', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.4.A10', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.4.A2', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.4.A3', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.4.A3', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.4.A3', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.4.A4', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.4.A4', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.4.A4', 42); -- Telearbeiter
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.4.A5', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.4.A6', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.4.A7', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.4.A7', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.4.A7', 42); -- Telearbeiter
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.4.A8', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.4.A8', 45); -- Vorgesetzte
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.4.A8', 42); -- Telearbeiter
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.4.A9', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.4.A9', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.4.A9', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.4.A9', 42); -- Telearbeiter
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.5.A1', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.5.A10', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.5.A10', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.5.A11', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.5.A12', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.5.A13', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.5.A14', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.5.A15', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.5.A16', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.5.A17', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.5.A18', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.5.A19', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.5.A2', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.5.A2', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.5.A20', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.5.A21', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.5.A22', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.5.A23', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.5.A24', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.5.A3', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.5.A4', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.5.A5', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.5.A5', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.5.A6', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.5.A7', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.5.A8', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.1.2.5.A9', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.2.1.A1', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.2.1.A10', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.2.1.A11', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.2.1.A12', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.2.1.A12', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.2.1.A12', 47); -- Änderungsmanager
insert into tom_rollen (TOMID, RoleID) values ('OPS.2.1.A13', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.2.1.A14', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.2.1.A14', 37); -- Notfallbeauftragter
insert into tom_rollen (TOMID, RoleID) values ('OPS.2.1.A15', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.2.1.A15', 27); -- Leiter Beschaffung
insert into tom_rollen (TOMID, RoleID) values ('OPS.2.1.A16', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.2.1.A2', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.2.1.A2', 32); -- Leiter Organisation
insert into tom_rollen (TOMID, RoleID) values ('OPS.2.1.A3', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.2.1.A4', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.2.1.A5', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.2.1.A6', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.2.1.A6', 16); -- Fachverantwortliche
insert into tom_rollen (TOMID, RoleID) values ('OPS.2.1.A7', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.2.1.A7', 32); -- Leiter Organisation
insert into tom_rollen (TOMID, RoleID) values ('OPS.2.1.A8', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.2.1.A8', 33); -- Leiter Personal
insert into tom_rollen (TOMID, RoleID) values ('OPS.2.1.A9', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.2.2.A1', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.2.2.A1', 16); -- Fachverantwortliche
insert into tom_rollen (TOMID, RoleID) values ('OPS.2.2.A1', 26); -- Institutionsleitung
insert into tom_rollen (TOMID, RoleID) values ('OPS.2.2.A1', 10); -- Datenschutzbeauftragter
insert into tom_rollen (TOMID, RoleID) values ('OPS.2.2.A10', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.2.2.A10', 16); -- Fachverantwortliche
insert into tom_rollen (TOMID, RoleID) values ('OPS.2.2.A10', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.2.2.A11', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.2.2.A11', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.2.2.A12', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.2.2.A12', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.2.2.A13', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.2.2.A14', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.2.2.A14', 16); -- Fachverantwortliche
insert into tom_rollen (TOMID, RoleID) values ('OPS.2.2.A14', 26); -- Institutionsleitung
insert into tom_rollen (TOMID, RoleID) values ('OPS.2.2.A15', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.2.2.A15', 16); -- Fachverantwortliche
insert into tom_rollen (TOMID, RoleID) values ('OPS.2.2.A15', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.2.2.A16', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.2.2.A16', 16); -- Fachverantwortliche
insert into tom_rollen (TOMID, RoleID) values ('OPS.2.2.A16', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.2.2.A17', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.2.2.A17', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.2.2.A18', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.2.2.A18', 16); -- Fachverantwortliche
insert into tom_rollen (TOMID, RoleID) values ('OPS.2.2.A18', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.2.2.A19', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.2.2.A19', 33); -- Leiter Personal
insert into tom_rollen (TOMID, RoleID) values ('OPS.2.2.A2', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.2.2.A2', 16); -- Fachverantwortliche
insert into tom_rollen (TOMID, RoleID) values ('OPS.2.2.A3', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.2.2.A3', 16); -- Fachverantwortliche
insert into tom_rollen (TOMID, RoleID) values ('OPS.2.2.A4', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.2.2.A4', 16); -- Fachverantwortliche
insert into tom_rollen (TOMID, RoleID) values ('OPS.2.2.A5', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.2.2.A5', 16); -- Fachverantwortliche
insert into tom_rollen (TOMID, RoleID) values ('OPS.2.2.A6', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.2.2.A6', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.2.2.A7', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.2.2.A7', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.2.2.A8', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.2.2.A8', 26); -- Institutionsleitung
insert into tom_rollen (TOMID, RoleID) values ('OPS.2.2.A9', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.2.2.A9', 26); -- Institutionsleitung
insert into tom_rollen (TOMID, RoleID) values ('OPS.3.1.A1', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.3.1.A10', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.3.1.A11', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.3.1.A11', 32); -- Leiter Organisation
insert into tom_rollen (TOMID, RoleID) values ('OPS.3.1.A12', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.3.1.A12', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('OPS.3.1.A12', 47); -- Änderungsmanager
insert into tom_rollen (TOMID, RoleID) values ('OPS.3.1.A13', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.3.1.A14', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.3.1.A14', 37); -- Notfallbeauftragter
insert into tom_rollen (TOMID, RoleID) values ('OPS.3.1.A15', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.3.1.A15', 26); -- Institutionsleitung
insert into tom_rollen (TOMID, RoleID) values ('OPS.3.1.A16', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.3.1.A16', 33); -- Leiter Personal
insert into tom_rollen (TOMID, RoleID) values ('OPS.3.1.A2', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.3.1.A3', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.3.1.A4', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.3.1.A4', 32); -- Leiter Organisation
insert into tom_rollen (TOMID, RoleID) values ('OPS.3.1.A4', 10); -- Datenschutzbeauftragter
insert into tom_rollen (TOMID, RoleID) values ('OPS.3.1.A5', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.3.1.A5', 33); -- Leiter Personal
insert into tom_rollen (TOMID, RoleID) values ('OPS.3.1.A6', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.3.1.A6', 33); -- Leiter Personal
insert into tom_rollen (TOMID, RoleID) values ('OPS.3.1.A7', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.3.1.A8', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('OPS.3.1.A9', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('ORP.1.A1', 32); -- Leiter Organisation
insert into tom_rollen (TOMID, RoleID) values ('ORP.1.A1', 26); -- Institutionsleitung
insert into tom_rollen (TOMID, RoleID) values ('ORP.1.A10', 32); -- Leiter Organisation
insert into tom_rollen (TOMID, RoleID) values ('ORP.1.A10', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('ORP.1.A11', 32); -- Leiter Organisation
insert into tom_rollen (TOMID, RoleID) values ('ORP.1.A11', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('ORP.1.A12', 32); -- Leiter Organisation
insert into tom_rollen (TOMID, RoleID) values ('ORP.1.A12', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('ORP.1.A12', 18); -- Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('ORP.1.A12', 21); -- ICS-Informationssicherheitsbeauftragter
insert into tom_rollen (TOMID, RoleID) values ('ORP.1.A13', 32); -- Leiter Organisation
insert into tom_rollen (TOMID, RoleID) values ('ORP.1.A13', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('ORP.1.A13', 29); -- Leiter Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('ORP.1.A14', 32); -- Leiter Organisation
insert into tom_rollen (TOMID, RoleID) values ('ORP.1.A14', 18); -- Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('ORP.1.A14', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('ORP.1.A2', 32); -- Leiter Organisation
insert into tom_rollen (TOMID, RoleID) values ('ORP.1.A2', 26); -- Institutionsleitung
insert into tom_rollen (TOMID, RoleID) values ('ORP.1.A3', 32); -- Leiter Organisation
insert into tom_rollen (TOMID, RoleID) values ('ORP.1.A3', 36); -- Mitarbeiter
insert into tom_rollen (TOMID, RoleID) values ('ORP.1.A4', 32); -- Leiter Organisation
insert into tom_rollen (TOMID, RoleID) values ('ORP.1.A5', 32); -- Leiter Organisation
insert into tom_rollen (TOMID, RoleID) values ('ORP.1.A5', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('ORP.1.A6', 32); -- Leiter Organisation
insert into tom_rollen (TOMID, RoleID) values ('ORP.1.A6', 36); -- Mitarbeiter
insert into tom_rollen (TOMID, RoleID) values ('ORP.1.A7', 32); -- Leiter Organisation
insert into tom_rollen (TOMID, RoleID) values ('ORP.1.A7', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('ORP.1.A7', 34); -- Leiter Produktion und Fertigung
insert into tom_rollen (TOMID, RoleID) values ('ORP.1.A7', 29); -- Leiter Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('ORP.1.A8', 32); -- Leiter Organisation
insert into tom_rollen (TOMID, RoleID) values ('ORP.1.A8', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('ORP.1.A9', 32); -- Leiter Organisation
insert into tom_rollen (TOMID, RoleID) values ('ORP.2.A1', 38); -- Personalabteilung
insert into tom_rollen (TOMID, RoleID) values ('ORP.2.A1', 45); -- Vorgesetzte
insert into tom_rollen (TOMID, RoleID) values ('ORP.2.A10', 38); -- Personalabteilung
insert into tom_rollen (TOMID, RoleID) values ('ORP.2.A11', 38); -- Personalabteilung
insert into tom_rollen (TOMID, RoleID) values ('ORP.2.A12', 38); -- Personalabteilung
insert into tom_rollen (TOMID, RoleID) values ('ORP.2.A13', 38); -- Personalabteilung
insert into tom_rollen (TOMID, RoleID) values ('ORP.2.A2', 38); -- Personalabteilung
insert into tom_rollen (TOMID, RoleID) values ('ORP.2.A2', 45); -- Vorgesetzte
insert into tom_rollen (TOMID, RoleID) values ('ORP.2.A2', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('ORP.2.A3', 38); -- Personalabteilung
insert into tom_rollen (TOMID, RoleID) values ('ORP.2.A3', 45); -- Vorgesetzte
insert into tom_rollen (TOMID, RoleID) values ('ORP.2.A4', 38); -- Personalabteilung
insert into tom_rollen (TOMID, RoleID) values ('ORP.2.A5', 38); -- Personalabteilung
insert into tom_rollen (TOMID, RoleID) values ('ORP.2.A6', 38); -- Personalabteilung
insert into tom_rollen (TOMID, RoleID) values ('ORP.2.A7', 38); -- Personalabteilung
insert into tom_rollen (TOMID, RoleID) values ('ORP.2.A8', 38); -- Personalabteilung
insert into tom_rollen (TOMID, RoleID) values ('ORP.2.A8', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('ORP.2.A9', 38); -- Personalabteilung
insert into tom_rollen (TOMID, RoleID) values ('ORP.3.A1', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('ORP.3.A1', 45); -- Vorgesetzte
insert into tom_rollen (TOMID, RoleID) values ('ORP.3.A1', 26); -- Institutionsleitung
insert into tom_rollen (TOMID, RoleID) values ('ORP.3.A2', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('ORP.3.A3', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('ORP.3.A3', 45); -- Vorgesetzte
insert into tom_rollen (TOMID, RoleID) values ('ORP.3.A3', 38); -- Personalabteilung
insert into tom_rollen (TOMID, RoleID) values ('ORP.3.A3', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('ORP.3.A4', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('ORP.3.A5', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('ORP.3.A6', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('ORP.3.A7', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('ORP.3.A8', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('ORP.3.A8', 38); -- Personalabteilung
insert into tom_rollen (TOMID, RoleID) values ('ORP.3.A9', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('ORP.4.A1', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('ORP.4.A1', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('ORP.4.A10', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('ORP.4.A10', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('ORP.4.A11', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('ORP.4.A11', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('ORP.4.A12', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('ORP.4.A12', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('ORP.4.A13', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('ORP.4.A13', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('ORP.4.A14', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('ORP.4.A14', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('ORP.4.A15', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('ORP.4.A15', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('ORP.4.A16', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('ORP.4.A16', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('ORP.4.A17', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('ORP.4.A17', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('ORP.4.A18', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('ORP.4.A18', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('ORP.4.A19', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('ORP.4.A19', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('ORP.4.A19', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('ORP.4.A2', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('ORP.4.A2', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('ORP.4.A20', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('ORP.4.A20', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('ORP.4.A21', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('ORP.4.A21', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('ORP.4.A22', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('ORP.4.A22', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('ORP.4.A23', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('ORP.4.A23', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('ORP.4.A3', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('ORP.4.A3', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('ORP.4.A4', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('ORP.4.A4', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('ORP.4.A5', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('ORP.4.A5', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('ORP.4.A6', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('ORP.4.A6', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('ORP.4.A7', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('ORP.4.A7', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('ORP.4.A8', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('ORP.4.A8', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('ORP.4.A8', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('ORP.4.A9', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('ORP.4.A9', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('ORP.5.A1', 0); -- Anforderungsmanager (Compliance Manager)
insert into tom_rollen (TOMID, RoleID) values ('ORP.5.A1', 32); -- Leiter Organisation
insert into tom_rollen (TOMID, RoleID) values ('ORP.5.A1', 26); -- Institutionsleitung
insert into tom_rollen (TOMID, RoleID) values ('ORP.5.A10', 0); -- Anforderungsmanager (Compliance Manager)
insert into tom_rollen (TOMID, RoleID) values ('ORP.5.A11', 0); -- Anforderungsmanager (Compliance Manager)
insert into tom_rollen (TOMID, RoleID) values ('ORP.5.A2', 0); -- Anforderungsmanager (Compliance Manager)
insert into tom_rollen (TOMID, RoleID) values ('ORP.5.A2', 45); -- Vorgesetzte
insert into tom_rollen (TOMID, RoleID) values ('ORP.5.A2', 32); -- Leiter Organisation
insert into tom_rollen (TOMID, RoleID) values ('ORP.5.A2', 26); -- Institutionsleitung
insert into tom_rollen (TOMID, RoleID) values ('ORP.5.A3', 0); -- Anforderungsmanager (Compliance Manager)
insert into tom_rollen (TOMID, RoleID) values ('ORP.5.A3', 45); -- Vorgesetzte
insert into tom_rollen (TOMID, RoleID) values ('ORP.5.A3', 38); -- Personalabteilung
insert into tom_rollen (TOMID, RoleID) values ('ORP.5.A4', 0); -- Anforderungsmanager (Compliance Manager)
insert into tom_rollen (TOMID, RoleID) values ('ORP.5.A4', 26); -- Institutionsleitung
insert into tom_rollen (TOMID, RoleID) values ('ORP.5.A5', 0); -- Anforderungsmanager (Compliance Manager)
insert into tom_rollen (TOMID, RoleID) values ('ORP.5.A5', 45); -- Vorgesetzte
insert into tom_rollen (TOMID, RoleID) values ('ORP.5.A5', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('ORP.5.A6', 0); -- Anforderungsmanager (Compliance Manager)
insert into tom_rollen (TOMID, RoleID) values ('ORP.5.A6', 45); -- Vorgesetzte
insert into tom_rollen (TOMID, RoleID) values ('ORP.5.A6', 38); -- Personalabteilung
insert into tom_rollen (TOMID, RoleID) values ('ORP.5.A7', 0); -- Anforderungsmanager (Compliance Manager)
insert into tom_rollen (TOMID, RoleID) values ('ORP.5.A8', 0); -- Anforderungsmanager (Compliance Manager)
insert into tom_rollen (TOMID, RoleID) values ('ORP.5.A9', 0); -- Anforderungsmanager (Compliance Manager)
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.1.A1', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.1.A1', 18); -- Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.1.A10', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.1.A11', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.1.A12', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.1.A13', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.1.A14', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.1.A15', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.1.A15', 18); -- Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.1.A16', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.1.A17', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.1.A18', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.1.A19', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.1.A2', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.1.A20', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.1.A21', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.1.A22', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.1.A23', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.1.A24', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.1.A25', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.1.A26', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.1.A27', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.1.A28', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.1.A29', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.1.A3', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.1.A30', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.1.A31', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.1.A32', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.1.A33', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.1.A34', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.1.A4', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.1.A5', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.1.A6', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.1.A7', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.1.A8', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.1.A9', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.2.2.A1', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.2.2.A10', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.2.2.A11', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.2.2.A12', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.2.2.A13', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.2.2.A14', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.2.2.A2', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.2.2.A3', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.2.2.A4', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.2.2.A5', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.2.2.A6', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.2.2.A7', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.2.2.A8', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.2.2.A9', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.3.A1', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.3.A1', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.3.A10', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.3.A11', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.3.A12', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.3.A13', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.3.A14', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.3.A15', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.3.A16', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.3.A17', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.3.A2', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.3.A3', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.3.A4', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.3.A5', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.3.A6', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.3.A7', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.3.A8', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.3.A9', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.5.A1', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.5.A10', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.5.A10', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.5.A11', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.5.A12', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.5.A13', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.5.A14', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.5.A14', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.5.A15', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.5.A16', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.5.A17', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.5.A18', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.5.A18', 45); -- Vorgesetzte
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.5.A19', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.5.A2', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.5.A20', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.5.A20', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.5.A20', 31); -- Leiter Netze
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.5.A21', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.5.A22', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.5.A23', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.5.A24', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.5.A25', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.5.A26', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.5.A26', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.5.A26', 31); -- Leiter Netze
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.5.A27', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.5.A27', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.5.A28', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.5.A3', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.5.A4', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.5.A5', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.5.A6', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.5.A7', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.5.A8', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.5.A8', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.5.A8', 31); -- Leiter Netze
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.5.A9', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.5.A9', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.5.A9', 31); -- Leiter Netze
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.7.A1', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.7.A10', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.7.A11', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.7.A12', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.7.A13', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.7.A14', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.7.A15', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.7.A15', 22); -- IS-Revisionsteam
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.7.A16', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.7.A17', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.7.A18', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.7.A19', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.7.A2', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.7.A20', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.7.A21', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.7.A22', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.7.A23', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.7.A24', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.7.A25', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.7.A26', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.7.A27', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.7.A28', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.7.A29', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.7.A3', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.7.A30', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.7.A31', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.7.A32', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.7.A33', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.7.A34', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.7.A35', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.7.A36', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.7.A37', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.7.A38', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.7.A4', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.7.A5', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.7.A6', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.7.A6', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.7.A7', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.7.A8', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.7.A9', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.8.A1', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.8.A1', 18); -- Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.8.A1', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.8.A10', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.8.A10', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.8.A10', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.8.A11', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.8.A12', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.8.A12', 45); -- Vorgesetzte
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.8.A13', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.8.A14', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.8.A15', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.8.A16', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.8.A17', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.8.A18', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.8.A18', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.8.A19', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.8.A2', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.8.A20', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.8.A20', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.8.A21', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.8.A22', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.8.A22', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.8.A23', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.8.A23', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.8.A24', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.8.A25', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.8.A26', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.8.A3', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.8.A4', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.8.A5', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.8.A6', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.8.A6', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.8.A7', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.8.A7', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.8.A7', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.8.A8', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.8.A8', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.8.A8', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.8.A9', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.8.A9', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('SYS.1.8.A9', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.1.A1', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.1.A10', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.1.A11', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.1.A12', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.1.A13', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.1.A14', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.1.A15', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.1.A16', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.1.A17', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.1.A18', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.1.A18', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.1.A19', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.1.A2', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.1.A20', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.1.A21', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.1.A22', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.1.A22', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.1.A23', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.1.A24', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.1.A25', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.1.A25', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.1.A26', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.1.A27', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.1.A28', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.1.A29', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.1.A3', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.1.A30', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.1.A31', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.1.A32', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.1.A33', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.1.A34', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.1.A35', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.1.A36', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.1.A37', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.1.A38', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.1.A39', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.1.A39', 18); -- Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.1.A4', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.1.A40', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.1.A41', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.1.A5', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.1.A5', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.1.A6', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.1.A7', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.1.A8', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.1.A9', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.2.2.A1', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.2.2.A10', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.2.2.A10', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.2.2.A11', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.2.2.A12', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.2.2.A13', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.2.2.A14', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.2.2.A15', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.2.2.A16', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.2.2.A17', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.2.2.A18', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.2.2.A19', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.2.2.A2', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.2.2.A20', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.2.2.A21', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.2.2.A3', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.2.2.A4', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.2.2.A5', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.2.2.A6', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.2.2.A7', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.2.2.A8', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.2.2.A8', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.2.2.A9', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.2.2.A9', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.2.3.A1', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.2.3.A10', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.2.3.A11', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.2.3.A12', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.2.3.A13', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.2.3.A14', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.2.3.A14', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.2.3.A15', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.2.3.A16', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.2.3.A17', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.2.3.A18', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.2.3.A19', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.2.3.A19', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.2.3.A2', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.2.3.A20', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.2.3.A21', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.2.3.A22', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.2.3.A23', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.2.3.A24', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.2.3.A25', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.2.3.A3', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.2.3.A4', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.2.3.A5', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.2.3.A6', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.2.3.A6', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.2.3.A7', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.2.3.A8', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.2.3.A9', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.3.A1', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.3.A1', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.3.A10', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.3.A11', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.3.A12', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.3.A13', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.3.A14', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.3.A15', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.3.A16', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.3.A17', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.3.A18', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.3.A19', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.3.A2', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.3.A20', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.3.A3', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.3.A3', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.3.A4', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.3.A5', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.3.A6', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.3.A6', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.3.A7', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.3.A8', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.3.A9', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.3.A9', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.4.A1', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.4.A10', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.4.A11', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.4.A12', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.4.A12', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.4.A2', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.4.A3', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.4.A3', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.4.A4', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.4.A5', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.4.A6', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.4.A7', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.4.A7', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.4.A8', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.4.A8', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('SYS.2.4.A9', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.1.A1', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.1.A10', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.1.A10', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.1.A11', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.1.A11', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.1.A12', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.1.A12', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.1.A13', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.1.A14', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.1.A14', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.1.A15', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.1.A15', 7); -- Beschaffungsstelle
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.1.A16', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.1.A17', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.1.A18', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.1.A2', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.1.A2', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.1.A3', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.1.A4', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.1.A4', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.1.A5', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.1.A5', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.1.A6', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.1.A7', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.1.A7', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.1.A8', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.1.A8', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.1.A9', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.1.A1', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.1.A10', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.1.A10', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.1.A11', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.1.A12', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.1.A13', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.1.A14', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.1.A15', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.1.A16', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.1.A16', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.1.A17', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.1.A18', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.1.A19', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.1.A2', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.1.A20', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.1.A21', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.1.A21', 16); -- Fachverantwortliche
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.1.A21', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.1.A22', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.1.A23', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.1.A24', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.1.A25', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.1.A26', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.1.A27', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.1.A28', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.1.A29', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.1.A3', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.1.A30', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.1.A4', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.1.A4', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.1.A5', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.1.A6', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.1.A7', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.1.A7', 16); -- Fachverantwortliche
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.1.A7', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.1.A8', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.1.A9', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.2.A1', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.2.A10', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.2.A11', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.2.A12', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.2.A13', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.2.A14', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.2.A15', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.2.A16', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.2.A17', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.2.A18', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.2.A19', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.2.A2', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.2.A20', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.2.A21', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.2.A22', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.2.A23', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.2.A3', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.2.A4', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.2.A5', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.2.A6', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.2.A7', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.2.A8', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.2.A9', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.3.A1', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.3.A10', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.3.A11', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.3.A12', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.3.A13', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.3.A14', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.3.A15', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.3.A16', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.3.A17', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.3.A18', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.3.A19', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.3.A2', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.3.A20', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.3.A21', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.3.A22', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.3.A23', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.3.A24', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.3.A25', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.3.A26', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.3.A27', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.3.A3', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.3.A4', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.3.A5', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.3.A6', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.3.A7', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.3.A8', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.3.A9', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.4.A1', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.4.A2', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.4.A3', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.4.A4', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.4.A5', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.4.A6', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.2.4.A7', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.3.A1', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.3.A10', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.3.A10', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.3.A11', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.3.A11', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.3.A12', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.3.A13', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.3.A13', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.3.A14', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.3.A14', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.3.A15', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.3.A2', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.3.A2', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.3.A3', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.3.A4', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.3.A5', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.3.A5', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.3.A6', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.3.A6', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.3.A7', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.3.A8', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.3.A8', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.3.A9', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.3.3.A9', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.1.A1', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.1.A10', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.1.A11', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.1.A12', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.1.A13', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.1.A14', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.1.A15', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.1.A16', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.1.A17', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.1.A18', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.1.A19', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.1.A2', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.1.A20', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.1.A21', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.1.A22', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.1.A3', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.1.A4', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.1.A5', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.1.A5', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.1.A6', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.1.A7', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.1.A8', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.1.A9', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.3.A1', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.3.A1', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.3.A10', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.3.A11', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.3.A11', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.3.A12', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.3.A12', 6); -- Beschaffer
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.3.A12', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.3.A13', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.3.A13', 11); -- Entwickler
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.3.A13', 39); -- Planer
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.3.A13', 6); -- Beschaffer
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.3.A14', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.3.A14', 11); -- Entwickler
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.3.A14', 39); -- Planer
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.3.A14', 6); -- Beschaffer
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.3.A15', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.3.A15', 11); -- Entwickler
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.3.A15', 39); -- Planer
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.3.A15', 6); -- Beschaffer
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.3.A16', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.3.A16', 39); -- Planer
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.3.A17', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.3.A17', 39); -- Planer
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.3.A17', 6); -- Beschaffer
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.3.A18', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.3.A18', 11); -- Entwickler
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.3.A18', 6); -- Beschaffer
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.3.A2', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.3.A2', 11); -- Entwickler
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.3.A3', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.3.A4', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.3.A4', 6); -- Beschaffer
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.3.A4', 30); -- Leiter IT
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.3.A5', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.3.A5', 11); -- Entwickler
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.3.A5', 39); -- Planer
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.3.A6', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.3.A6', 11); -- Entwickler
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.3.A7', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.3.A7', 11); -- Entwickler
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.3.A7', 39); -- Planer
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.3.A7', 6); -- Beschaffer
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.3.A8', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.3.A8', 11); -- Entwickler
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.3.A8', 39); -- Planer
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.3.A8', 6); -- Beschaffer
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.3.A9', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.3.A9', 11); -- Entwickler
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.3.A9', 39); -- Planer
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.3.A9', 6); -- Beschaffer
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.4.A1', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.4.A10', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.4.A11', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.4.A12', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.4.A13', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.4.A14', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.4.A15', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.4.A16', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.4.A17', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.4.A18', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.4.A19', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.4.A2', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.4.A20', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.4.A21', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.4.A21', 18); -- Haustechnik
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.4.A22', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.4.A23', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.4.A24', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.4.A3', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.4.A4', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.4.A5', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.4.A6', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.4.A7', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.4.A8', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.4.A8', 7); -- Beschaffungsstelle
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.4.A8', 24); -- Informationssicherheitsbeauftragter (ISB)
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.4.A9', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.5.A1', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.5.A10', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.5.A11', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.5.A12', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.5.A12', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.5.A13', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.5.A13', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.5.A14', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.5.A15', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.5.A16', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.5.A2', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.5.A2', 4); -- Benutzer
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.5.A3', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.5.A4', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.5.A5', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.5.A6', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.5.A6', 16); -- Fachverantwortliche
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.5.A7', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.5.A7', 16); -- Fachverantwortliche
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.5.A8', 23); -- IT-Betrieb
insert into tom_rollen (TOMID, RoleID) values ('SYS.4.5.A9', 23); -- IT-Betrieb
end transaction;
