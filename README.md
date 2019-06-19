# SecDoc - WWU Verzeichnis von Verarbeitungstätigkeiten (VVT)

Webinterface zur Erfassung von Verarbeitungstätigkeiten und IT-Verfahren an der WWU im Rahmen der EU-Datenschutzgrundverordnung (DSGVO).

* Produktivsystem: https://www.uni-muenster.de/ZIV.CERT/secdoc
* Entwicklungssystem: https://www.uni-muenster.de/ZIVtest/secdoc
* Demosystem: https://www.uni-muenster.de/ZIVtest/secdoc-demo

## Features

- Basiert auf Vorlage für das Verzeichnis von Verarbeitungstätigkeiten (VTT) von ZENDAS (https://www.zendas.de)
- Bietet integrierte Ausfüllhinweise
- Bietet Datenvorschläge aus vorhandenen Datenbanken (z.B. Nutzerdatenbank (WWUben), Netzdatenbank (LANbase), sowie CPE-Verzeichnis des NIST)
- Automatische Speicherung und einfache Verwaltung von Verarbeitungstätigkeiten
- Spätere Fortsetzung oder Bearbeitung möglich
- Erstellt abschließend eine PDF-Version der Verarbeitungstätigkeit
- Verwendet Bootstrap Wizard für HTML-Formular
- Speichert Daten in SQLite-Datenbank und als JSON zur späteren evtl. externen Weiterverarbeitung
- Eingetragene Informationen können einfach ergänzend zur Datenschutzerklärung auf Webseiten eingebunden werden
- Bietet eine Übersicht aller gemeldeten Verarbeitungstätigkeiten für Datenschutzbeauftragte (Einsicht, Kommentare und Bearbeitung möglich)
- Erzeugt das Verzeichnis von Verarbeitungstätigkeiten

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

## Verwendung - Docker

Eine Demo-Version kann einfach mittels Docker gestartet werden über die Konfigurationsdatei [Dockerfile](Dockerfile). Hierfür kann mit `docker build -t secdoc . ` ein Image gebaut werden und mit `docker run -d --name secdoc-app secdoc` der Container gestartet werden. Hierfür wird eine Demo-Datenbank geladen.

Bis auf den E-Mail Versand können alle Funktionen in der Docker-Version ausprobiert werden (ein allgemein nutzbares Skript für den E-Mail Versand wurde noch nicht eingebaut). Die eingegebenen Daten bleiben bestehen, bis der Container gelöscht wird. Die Datenbank-Datei ist im Container zu finden unter `/var/www/secdoc/demo.db`.

## Verwendung - Normale Installation

### Voraussetzungen

Das Backend benötigt einen Webserver mit PHP (Version 7 oder höher). Zur Speicherung wird eine lokale SQLite Datenbank verwendet, hierfür muss der entsprechende PDO-Treiber `pdo_sqlite` geladen sein (siehe [SQLite Functions](https://secure.php.net/manual/de/ref.pdo-sqlite.php)). Darüber hinaus benötigt das MPDF Plugin die beiden PHP Erweiterungen `mbstring` und `gd`.

Die Nutzeroberfläche benötigt lediglich einen aktuellen Browser mit aktiviertem Javascript zur Nutzung.

### Installation

Zur Installation muss nur das GIT Repository auf den Webserver geklont werden und eventuell einige Anpassungen in den Einstellungen bzw. im PHP-Code vorgenommen werden.
Beim ersten Aufruf der Anwendung wird automatisch eine neue Datenbank mit den notwendigen Tabellen angelegt, wenn sie nicht vorhanden ist.

Zur Nutzung der PDF-Ausgabe muss zusätzlich noch das MPDF Plugin installiert werden. Dies geschieht über [Composer](https://getcomposer.org/) mit der Konfigurationsdatei [composer.json](/assets/composer.json) (`php composer.phar install -d <Pfad zur composer.json>`). Das Backend erwartet den Autoloader `autoload.php` im Pfad [/assets/vendor](/assets/vendor). Sollte MPDF bereits vorhanden sein oder an einer anderen Stelle installiert werden, kann der Pfad über `$vendor_dir` in [config.inc.php](/assets/ajax/config.inc.php) angepasst werden.

**Achtung:** Das System bietet keinen allgemeinen Zugriffsschutz (z.B. durch Registrierung und Login-Mechanismus), sondern hat nur die Möglichkeit, die Anzeige von Verarbeitungstätigkeiten zu unterbinden, wenn eine Nutzerkennung oder Nutzergruppen bereitsgestellt wurden, die überprüft werden können. Dies geschieht in unserem System mittels SSO-Mechanismus (Single Sign On) und einem externen Funktionsaufruf zum Erlangen der Nutzergruppen, die im PHP-Skript überprüft werden. Der allgemeine Zugriffsschutz wird über `.htaccess`-Dateien mit Nutzergruppeneinschränkungen realisiert.

### Notwendige Anpassungen

Zur Vereinfachung der Anpassungen und zur Fehlersuche sollte das Debugging mit der Variable `$debug` in der [config.inc.php](/assets/ajax/config.inc.php) aktiviert werden. Darüber hinaus kann die Oberfläche mit dem Paramter `?debug=true` aufgerufen werden, um zusätzliche Debug-Meldung für die JS-Ausführung zu erhalten. Bei aktiviertem Debug-Modus werden auch eventuelle Debug-Ausgaben des Backends in einem Debug-Fenster unterhalb des Webseiteninhalts angezeigt.

Um das System in der eigenen Umgebung zu nutzen, sind einige Anpassungen bzw. Datenimports notwendig:

1. **Aussehen und allgemeine Verfahrensangaben**

    Die Logos, Links und das Hintergrundbild auf der Hauptseite sollten an die eigene Hochschule angepasst werden (siehe [index.html](index.html)).
    Darüber hinaus werden dort auch die allgemeinen Informationen für Verarbeitungstätigkeiten, wie z.B. Anschrift der Hochschule, Angaben zum Datenschutzbeauftragten, etc., festgelegt. Diese müssen auch angepasst werden und sind hier zu finden [index.html#L168-188](index.html#L168-188).

    Die Logos in der PDF sollten ebenfalls angepasst werden. Dafür können zwei Logos (`logo1.png` und `logo2.png`) in [/assets/img](/assets/img) hinterlegt werden, die genutzt werden.
    Alternativ können die Pfade angepasst werden in der Funktion `generatePDF()` in [/assets/ajax/verwaltung.php](/assets/ajax/verwaltung.php). Zu Beginn dieser Funktion können auch die PDF-Metadaten angepasst werden.

    Sollte die E-Mail-Funktion genutzt werden wollen, sollte auch der E-Mail-Inhalt in der Funktion `generateEmail()` in [/assets/ajax/verwaltung.php](/assets/ajax/verwaltung.php) angepasst werden.

2. **Anpassung des Backends**

    Die wichtigsten Einstellungen können in der Datei [config.inc.php](/assets/ajax/config.inc.php) durchgeführt werden. Besonders beachtet werden sollten hierbei die Einstellungen der Pfade.
    Die Variable `$debugGroups` enthält Nutzergruppen, die die Debug-Funktionen nutzen dürfen, während die Variable `$dsbIDs` ein Array an einzelnen Nutzerkennung enthält, die Zugriff auf die Funktionen für Datenschutzbeauftragte haben sollen.

    Das Backend benötigt einige Funktionen, die spezifisch zu unserem System sind und müssen angepasst werden. Diese sind in der Datei [Utils.class.php](/assets/ajax/Utils.class.php) zu finden.
    Insbesondere zählen hierzu:
    - `searchipdns($term)` Durchsucht die Netzdatenbank nach Servern (für Eingabehilfe im Formular der Systeme)
    - `imapSendMimeMail($to, $cc, $bcc, $subject, $body, $attachments)` Verschickt eine signierte E-Mail mit Anhängen (für den Abschluss der Verarbeitungstätigkeit)
    - `getUserGroups($userId)` Fragt die aktuellen Nutzergruppen zu einer Kennung ab (zur Überprüfung von Berechtigungen beim Zugriff auf eine Verarbeitungstätigkeit)
    - `getCurrentUserId()` Fragt die Nutzerkennung des aktuell eingeloggten Nutzers ab (zur Überprüfung von Berechtigungen beim Zugriff auf eine Verarbeitungstätigkeit und Logging von Bearbeitungen)
    - `getUserAnrede($userId)` Fragt die Anrede zu einer Nutzerkennung ab (für den E-Mail-Versand genutzt)
    - `getUserAlias($userId)` Fragt den primären Alias-Namen des Nutzers ab (für den E-Mail-Versand genutzt)

3. **Datenimport**

    Für einige Eingafelder stellt das Tool Vorschläge für den Nutzer zur Verfügung. Diese werden, bis auf die aktuellen Nutzergruppen und Systeme, alle aus der SQLite Datenbank ausgelesen.
    Zu diesen Daten zählen Personen, Organisationseinheiten, IVVen und CPE-Einträge. Die benötigten Tabellen werden beim ersten Start der Anwendung angelegt und müssen nur befüllt werden.
    Die Tabellendefinitionen können in [DBCon.class.php](/assets/ajax/DBCon.class.php) gefunden werden. Diese können dafür genutzt werden, um die Tabelle z.B. mittels einer SQL-Importdatei über das CLI von SQLite zu befüllen und regelmäßig aktuell zu halten.

### Weitere Anpassungen

Zur weiteren Anpassung des Systems sollten die Dokumentationen der JS- und PHP-Skripte eingesehen werden.
Die Dokumentation des JS-Codes ist zu finden in [JSDoc](/docs/JSDoc) und die des PHP-Backends in [phpDoc](/docs/phpDoc).

## Lizenz

Copyright (c) 2018 Westfälische Wilhelms-Universität Münster (https://www.uni-muenster.de)  
Licensed under AGPL-3.0-or-later (https://www.gnu.org/licenses/agpl.html)  
