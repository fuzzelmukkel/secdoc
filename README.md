# SecDoc-WWU - Verzeichnis von Verarbeitungstätigkeiten der WWU Münster (VVT)

Webinterface zur Erfassung von Verarbeitungstätigkeiten und IT-Verfahren an der WWU im Rahmen der EU-Datenschutzgrundverordnung (DSGVO).

* Produktivsystem: https://www.uni-muenster.de/ZIV.CERT/secdoc
* Entwicklungssystem: https://www.uni-muenster.de/ZIVtest/secdoc
* Demosystem: https://www.uni-muenster.de/ZIVtest/secdoc-demo

## Features

- Basierte auf der Vorlage für das Verzeichnis von Verarbeitungstätigkeiten (VTT) von ZENDAS (https://www.zendas.de)
- Setzt das 3-Ebenen-Prinzip nach dem [Standard-Datenschutzmodell V2 (SDM-V2)](https://www.datenschutzzentrum.de/artikel/1300-Standard-Datenschutzmodell-V2.html) der Datenschutzbehörden des Bundes und der Länder (DSK) um
- Ermöglicht die Integration von Bausteinen und Anforderungen aus dem [BSI IT-Grundschutz](https://www.bsi.bund.de/DE/Themen/ITGrundschutz/itgrundschutz_node.html)
- Bietet integrierte Ausfüllhinweise
- Bietet Datenvorschläge aus vorhandenen Datenbanken (z.B. Nutzerdatenbank (WWUben), Netzdatenbank (LANbase), sowie CPE-Verzeichnis des NIST)
- Bietet ein integriertes Dokumentenmanagement
- Automatische Speicherung und einfache Verwaltung von Verarbeitungstätigkeiten, Fachapplikationen und IT-Verfahren
- Unterbrechung und spätere Fortsetzung oder Bearbeitung möglich
- Erstellt abschließend eine PDF-Dokumentation der Verarbeitungstätigkeit
- Verwendet Bootstrap Wizard für das HTML-Formular
- Speichert Daten in SQLite-Datenbank und als JSON zur späteren evtl. externen Weiterverarbeitung
- Eingetragene Informationen können einfach ergänzend zur Datenschutzerklärung auf Webseiten eingebunden werden
- Bietet eine Übersicht aller gemeldeten Verarbeitungstätigkeiten für Datenschutzbeauftragte (Einsicht, Kommentare und Bearbeitung möglich) sowie IT-Verfahren für IT-Sicherheitsbeauftragte
- Erzeugt das Verzeichnis von Verarbeitungstätigkeiten (VVT)

## SecDoc Wiki

Weiterführende Informationen zur Installation und Verwendung von SecDoc können im [SecDoc Wiki](https://zivgitlab.uni-muenster.de/secdoc/secdoc/-/wikis/home) gefunden werden. Das Wiki ist noch im Aufbau, enthält aber aktuellere Informationen bezüglich der Installation und Konfiguration als diese README-Datei.

## Abhängigkeiten

### Enthalten

- [jQuery v3.3.1](https://github.com/jquery/jquery)
   - [Bootstrap v3.3.5](https://github.com/twbs/bootstrap)
      - [Bootstrap Select v1.12.4](https://silviomoreto.github.io/bootstrap-select)
   - [Twitter Bootstrap Wizard v1.4.2](https://github.com/VinceG/twitter-bootstrap-wizard)
      - [Paper Bootstrap Wizard v1.0.1](https://github.com/creativetimofficial/paper-bootstrap-wizard)
   - [jQuery Validation Plugin v1.14.0](https://jqueryvalidation.org)
   - [jQuery Typeahead v2.10.4](http://www.runningcoder.org/jquerytypeahead)
   - [DataTables v1.10.18](https://datatables.net/)
      - [DataTables German](https://datatables.net/plug-ins/i18n/German)
- [Font-Awesome v4](https://github.com/FortAwesome/Font-Awesome)

### Benötigt

- [MPDF 7](https://github.com/mpdf/mpdf) (Für die PDF-Erstellung genutzt)
- [PHPMailer](https://github.com/PHPMailer/PHPMailer)

## Installation

Siehe [SecDoc Wiki](https://zivgitlab.uni-muenster.de/secdoc/secdoc/-/wikis/installation/Installation))

## Lizenz

Copyright (c) 2018-2020 Westfälische Wilhelms-Universität Münster (https://www.uni-muenster.de)  
Licensed under AGPL-3.0-or-later (https://www.gnu.org/licenses/agpl.html)  
