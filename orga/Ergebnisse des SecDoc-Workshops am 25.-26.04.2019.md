# Ergebnisse des SecDoc-Workshops am 25./26.04.2019 

Stand: 06.05.2019, TKü

## Feedback zu Installation und Betrieb

* Einrichtung/Konfiguration vereinfachen

   * Zentraler Ordner für Konfigurationsdateien, Logos, hochschulspezifische Anpassungen, Feld- oder Textbezeichner, …
* Verschiedene Methoden zur Authentifizierung unterstützen (AD, LDAP (via Code von TU Ilmenau), Shibboleth, OpenID Connect, IDM,….)
* Datenbankalternativen für SQLite
  - Durch PHP PDO-Anbindung einfach möglich
* Nutzerrechte und –Rollenverwaltung verfeinern
  * Verfahrensweitergabe an anderen Bearbeiter (Workflow á la Ticketsystem?) auch technisch/fachlich (ggf. „Share“-Button)
  * Mandantenfähigkeit bei SecDoc (Admins, Ausfüllende, Verantwortliche, …)
  * Rollenbezeichnungen anstatt konkrete Ansprechpartner zulassen?

- Upload-Download für zusätzliche Dokumente (ggf. via Links, URL’s, ...)
  
  - Anbindung an DMS möglich?
  
- Erweiterung der SecDoc-Funktionalitäten über Plugins/Module? Bessere Anpassbarkeit für andere HSen

- Definition und Generierung von Basisdiensten via Admin-Interface

- Verarbeitungstätigkeiten über Prozesslandkarten definieren und ggf. passende Prozesse für die HSen schneiden, Schnittmengen?

  - Verarbeitungstätigkeiten als Templates oder Prototypen via Admin hochschulbezogen erstellen und anbieten

  - TU Ilmenau würde bei den Verarbeitungstätigkeiten gerne unterstützen

- VVT’s für Umfragen – sollen wir „VVT’s light“ einführen oder anbieten?

### Umsetzung der technischen und organisatorischen Maßnahmen

* Abhängigkeiten vom Risiko/Risikoanalysen
  * Definition und Implementation von Risikoklassen und Begründung
    - DSFA und Nutzung der Risikoklassen für eine Begründung? 
    - DSFA und Risikoanalyse als Plugin oder angeflanschtes Modul mit einfachen Rückgabewerten und URL bzw. Link zur Quelle?
* Wie wird die Anwendung bzw. Nichtanwendung in SecDoc umgesetzt (ja/nein-Button reicht nicht)?
* Wie gehen wir mit generellen TOM’s um (z.B. zentrale Sicherheitsrichtlinien)? Müssen die in jeder VVT erneut bearbeitet werden?
* Kataloge für TOM’s (ENISA, BSI, eigene) via Admin-Interface importieren, bearbeiten

### Konfiguration via Admin-Interface

* Erzeugung von Gesamt-VVT mit Deckblättern, Anhängen, ggf. Risikoanalysen
* Auswertungsmöglichkeiten, Analysen, Statistiken etc.
* Vereinfachte Schnittstellen für den Datenimport und –Export
  * Daten können jetzt schon per Kommandozeile in SQLite DB importiert werden
  * Vorlagen/Templates für Verarbeitungstätigkeiten und Basis-Dienste
  * Kataloge für TOM’s inkl. Risikoklassen, Kataloge frei erzeugbar, hochschulspezifische Kataloge?
  * Rechtsgrundlagen
  * Kategorien betroffener Personen
  * Personendaten, Organisationseinheiten, …

## Organisatorisches

* Gitlab der WWU für Gäste öffnen oder entsprechenden anderen Hochschul-Provider (Konstanz, HH) für Projekt suchen.
  * Issues und Workflows in Gitlab anlegen und diskutieren (Herr Ulber würde unterstützen).
    * https://zivgitlab.uni-muenster.de/wwu-cert/secdoc/milestones
  * sciebo-Daten in Gitlab als zentrale Entwicklungsplattform umziehen

- Wording, Glossar erstellen mit Begriffsdefinitionen als Basis für einheitliche Verständigung
  - Servicekatalog <-> Geschäftsprozesse <–> Verarbeitungstätigkeiten <–> IT-Verfahren <-> IT-Dienste/Basisdienste/Basissysteme
  - "Eine Verarbeitungstätigkeit nutzt mehrere IT-Verfahren"
- TU Ilmenau will evtl. eigenen Förderantrag in Thüringen stellen.

- DH NRW Förderantrag: Wird von allen befürwortet. Unterstützung ggf. durch Hochschule Ruhr-West, Uni Wuppertal). Herr Feuerstein will die Datenschützer in NRW auf dem nächsten Treffen in Hagen (06.06.2019) mobilisieren (Unterstützung für den Antrag bei der DH NRW).
  - Letter of Intent von NRW-Hochschulen nötig

  - Wichtig für alle ist die Beibehaltung der Lizensierung als freie Software

- Der DFN-Verein (Herr Sander) steht der Sache ausgesprochen positiv gegenüber, wir sollen beim DFN Unterstützung einfordern. Er will uns ggf. die Möglichkeit zu einem kleinen Workshop in Verbindung mit der nächsten Datenschutzkonferenz (Achtung: voraussichtlich in Berlin, nicht Hamburg) anbieten.

- Herr Ulber braucht für die weitere Verbreitung in BW und zur Argumentation gegenüber ZENDAS weitere konkrete Vorgaben und Perspektiven.

- Zwei Workshops/Jahr wären wünschenswert (WWU richtet einen weiteren Workshop zum Ende des Jahres 2019 aus)

