# SecDoc-WWU - Verzeichnis von Verarbeitungstätigkeiten der WWU Münster (VVT)

Webinterface zur Erfassung von Verarbeitungstätigkeiten, Fachapplikationen und IT-Verfahren an der WWU im Rahmen der EU-Datenschutzgrundverordnung (DSGVO).

* Demosystem: https://www.uni-muenster.de/ZIVtest/secdoc-demo

![SecDoc_Home](https://zivgitlab.uni-muenster.de/secdoc/secdoc/-/wikis/uploads/22fcf1750bf2b5471ccf9a516177676a/SecDoc_Home.png)

## Features

- Basierte auf der Vorlage für das Verzeichnis von Verarbeitungstätigkeiten (VTT) vom [ZENDAS](https://www.zendas.de)
- Setzt das 3-Ebenen-Prinzip nach dem [Standard-Datenschutzmodell V2 (SDM-V2)](https://www.datenschutzzentrum.de/artikel/1300-Standard-Datenschutzmodell-V2.html) der Datenschutzbehörden des Bundes und der Länder (DSK) um
- Ermöglicht die Integration von Bausteinen und Anforderungen aus dem [BSI IT-Grundschutz](https://www.bsi.bund.de/DE/Themen/ITGrundschutz/itgrundschutz_node.html)
- Geführte Abfrage der notwendigen Informationen in einem Wizard
- Bietet integrierte Ausfüllhinweise und Möglichkeiten zur Verwendung von Vorlagen
- Bietet Datenvorschläge aus vorhandenen Datenbanken (z.B. Nutzerdatenbank (WWUben), Netzdatenbank (LANbase), sowie CPE-Verzeichnis des NIST)
- Automatische Speicherung und einfache Verwaltung von Verarbeitungstätigkeiten, Fachapplikationen und IT-Verfahren
- Unterbrechung und spätere Fortsetzung oder Bearbeitung möglich
- Ex- und Import-Funktion für Dokumentationen und Kopier-Funktion
- Dokumentation von Revisionen
- Erstellt abschließend eine PDF-Dokumentation
- Information per E-Mail an Ansprechpartner
- Bietet ein integriertes Dokumentenmanagement
- Speicherung der Daten in einer SQLite-Datenbank im JSON-Format zur späteren evtl. externen Weiterverarbeitung
- Eingetragene Informationen können einfach ergänzend zur Datenschutzerklärung auf Webseiten eingebunden werden
- Bietet eine Übersicht aller gemeldeten Verarbeitungstätigkeiten für Datenschutzbeauftragte (Einsicht, Kommentare und Bearbeitung möglich) sowie IT-Verfahren für IT-Sicherheitsbeauftragte
- Erzeugt das Verzeichnis von Verarbeitungstätigkeiten (VVT)
- Rechteverwaltung anhand von Gruppen oder Nutzern
- Authentifzierung mittels AD/LDAP

## SecDoc Wiki

Weiterführende Informationen zur Installation und Verwendung von SecDoc können im [SecDoc Wiki](https://zivgitlab.uni-muenster.de/secdoc/secdoc/-/wikis/home) gefunden werden. Das Wiki ist noch im Aufbau, enthält aber aktuellere Informationen bezüglich der Installation und Konfiguration als diese README-Datei.

## Abhängigkeiten

### Enthalten

- [jQuery v3.4.1](https://github.com/jquery/jquery)
   - [Bootstrap v3.4.1](https://github.com/twbs/bootstrap)
      - [Bootstrap Select v1.13.9](https://silviomoreto.github.io/bootstrap-select)
   - [Twitter Bootstrap Wizard v1.4.2](https://github.com/VinceG/twitter-bootstrap-wizard)
      - [Paper Bootstrap Wizard v1.0.1](https://github.com/creativetimofficial/paper-bootstrap-wizard)
   - [jQuery Validation Plugin v1.14.0](https://jqueryvalidation.org)
   - [jQuery Typeahead v2.10.4](http://www.runningcoder.org/jquerytypeahead)
   - [DataTables v1.10.23](https://datatables.net/)
      - [DataTables German](https://datatables.net/plug-ins/i18n/German)
      - [DataTables Naturalsort](https://datatables.net/plug-ins/sorting/natural)
- [Font-Awesome v4](https://github.com/FortAwesome/Font-Awesome)

### Benötigt

- [MPDF v8](https://github.com/mpdf/mpdf) (Für die PDF-Erstellung genutzt)
- [PHPMailer v6.1](https://github.com/PHPMailer/PHPMailer) (Für den E-Mail-Versand genutzt)

## Installation

Siehe [SecDoc Wiki](https://zivgitlab.uni-muenster.de/secdoc/secdoc/-/wikis/installation/Installation)

## Entwicklung

Mithilfe bei der Weiterentwicklung ist jederzeit herzlich willkommen, ebenso wie das Teilen von eigenen Anpassungen und Erweiterungen, da diese möglicherweise für andere Nutzer interessant sein können.

### Code-Dokumentation

Automatisch generierte Dokumentationen des Quellcodes sind vorhanden:
* [JS Dokumentation](https://secdoc.zivgitlabpages.uni-muenster.de/secdoc/JSDoc/)
* [PHP Dokumentation](https://secdoc.zivgitlabpages.uni-muenster.de/secdoc/phpDoc/)

## Lizenz

Copyright (c) 2018-2021 [Westfälische Wilhelms-Universität Münster](https://www.uni-muenster.de)  
Licensed under [AGPL-3.0-or-later](https://www.gnu.org/licenses/agpl.html)  
