<!DOCTYPE html>
<html lang="de">
  <head>
    <meta name="author" content="Dustin Gawron <dustin.gawron@uni-muenster.de>" />
    <meta name="publisher" content="Westfälische Wilhelms-Universität Münster" />
    <meta name="copyright" content="(c) 2020 Universität Münster" />
    <meta name="viewport" content="width=device-width" />

    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />

    <title>SecDoc Installation</title>
  </head>

  <body>
    <?php
    require_once 'assets/ajax/config.inc.php';
    require_once 'assets/ajax/DBCon.class.php';

    $error = '';
    $phpOutput = '';
    $step = isset($_REQUEST['step']) ? filter_var($_REQUEST['step'], FILTER_SANITIZE_NUMBER_INT) : 0;
    $action = isset($_REQUEST['do']) ? filter_var($_REQUEST['do'], FILTER_SANITIZE_STRING) : '';

    ob_start();
    switch($action) {
      case 'init_demodb':
        if(!copy(__DIR__ . DIRECTORY_SEPARATOR . 'assets/demo.db', $db_dir . DIRECTORY_SEPARATOR . $db_name)) {
          $error = 'Konnte Demo-Datenbank nicht nach <code>' . $db_dir . DIRECTORY_SEPARATOR . $db_name . '</code> kopieren!';
        }
        break;

      case 'init_newdb':
        $dbcon = new DBCon($db_dir, $db_name);
        if(!$dbcon->isConnected()) {
          $error = 'Neue Datenbank konnte nicht erstellt werden!';
        }
        break;

      case 'del_install':
        if(!unlink(__DIR__ . DIRECTORY_SEPARATOR . 'install.php')) {
          $error = 'Konnte Installationsskript nicht löschen! Bitte manuell löschen oder verschieben!';
        }
        break;

      case 'update_db':
        $dbcon = new DBCon($db_dir, $db_name);
        if(!$dbcon->isConnected()) {
          $error = 'Update der Datenbank fehlgeschlagen!';
        }
        break;

      case 'load_suggestions':
        $opt = [
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_PERSISTENT => TRUE,
            PDO::ATTR_EMULATE_PREPARES => FALSE
        ];
        $pdo = new PDO('sqlite:' . $db_dir . DIRECTORY_SEPARATOR . $db_name, '', '', $opt);

        if(!file_exists(__DIR__ . DIRECTORY_SEPARATOR . 'assets/php/Default_Suggestions.sql')) {
          $error = 'Konnte Datei mit Standardvorschlägen (<code>' . __DIR__ . DIRECTORY_SEPARATOR . 'assets/php/Default_Suggestions.sql'. '</code>) nicht finden!';
        }
        else {
          $pdo->exec(file_get_contents(__DIR__ . DIRECTORY_SEPARATOR . 'assets/php/Default_Suggestions.sql'));
        }
        break;

      case 'load_toms':
        $opt = [
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_PERSISTENT => TRUE,
            PDO::ATTR_EMULATE_PREPARES => FALSE
        ];
        $pdo = new PDO('sqlite:' . $db_dir . DIRECTORY_SEPARATOR . $db_name, '', '', $opt);

        if(!file_exists(__DIR__ . DIRECTORY_SEPARATOR . 'assets/php/BSI_TOM_List.sql') || !file_exists(__DIR__ . DIRECTORY_SEPARATOR . 'assets/php/ENISA_TOM_List.sql') || !file_exists(__DIR__ . DIRECTORY_SEPARATOR . 'assets/php/BSI+ENISA_TOM_List.sql')) {
          $error = 'Konnte TOM Listen in <code>' . __DIR__ . DIRECTORY_SEPARATOR . 'assets/php/</code> nicht finden!';
        }
        else {
          switch(filter_var($_REQUEST['tomlist'], FILTER_SANITIZE_STRING)) {
            case 'enisa':
              $pdo->exec(file_get_contents(__DIR__ . DIRECTORY_SEPARATOR . 'assets/php/ENISA_TOM_List.sql'));
              break;

            case 'bsi':
              $pdo->exec(file_get_contents(__DIR__ . DIRECTORY_SEPARATOR . 'assets/php/BSI_TOM_List.sql'));
              break;

            case 'bsienisa':
              $pdo->exec(file_get_contents(__DIR__ . DIRECTORY_SEPARATOR . 'assets/php/BSI+ENISA_TOM_List.sql'));
              break;

            default:
              $error = 'Keine TOM Liste ausgewählt!';
              break;
          }
        }
        break;

      case 'process_templates':
        $templateFiles = [
          'index.template.html',
          'assets/html/pdf_titlepage.inc.template.html',
          'assets/html/wizapp.inc.template.html',
          'assets/html/wizit.inc.template.html',
          'assets/html/wizproc.inc.template.html',
        ];

        foreach($templateFiles as $tFile) {
          if(file_exists($tFile)) {
            $tFileContent = file_get_contents($tFile);
            foreach($htmlStrings as $placeholder => $string) {
              $tFileContent = str_replace('{{' . $placeholder . '}}', $string, $tFileContent);
            }
            file_put_contents(str_replace('.template', '', $tFile), $tFileContent);
          }
          else {
            echo "Template unter $tFile nicht gefunden! Überspringe...\n";
          }
        }
        break;

      default:
        break;
    }
    $phpOutput = ob_get_clean();
    ob_end_flush();
    ?>

    <div class="container-fluid">
      <div class="card">
        <h3>SecDoc Installations-Skript</h3>
        <p>
          Hier kann die Datenbank für SecDoc erstellt werden und mit den TOM-Listen und Ausfüllvorschlägen befüllt werden. Nach Abschluss sollte die Datei <code>install.php</code> unbedingt verschoben oder gelöscht werden!
          <form method="post">
            <input type="hidden" name="do" value="del_install" />
            <input class="btn btn-default" type="submit" value="Installationsskript löschen" />
          </form>
        </p>

        <?php if($error) {?>
          <div class="alert alert-danger">
            <p>
              Bei der letzten Aktion ist ein Fehler aufgetreten: <?= $error ?>
            </p>
          </div>
        <?php } ?>

        <?php if($phpOutput) {?>
          <div class="alert alert-info">
            <p>
              <h4>PHP Output:</h4>
              <pre>
                <code><?= $phpOutput ?></code>
              </pre>
            </p>
          </div>
        <?php } ?>

          <h4>HTML Templates ersetzen</h4>
          <p>
            Zur einfacheren Konfiguration von Texten und Links in der Oberfläche, können hier aus HTML Templates fertige HTML-Dateien zur Auslieferung erzeugt werden. Die notwendige Konfiguration findet in der der Variable <code>$htmlStrings</code> in <code>assets/ajax/config.inc.php</code> statt.
          </p>
          <div class="panel panel-default">
            <div class="panel-heading">Aktuelle Konfiguration der Texte und Links</div>
            <div class="panel-body">
              <pre>
                <code><?= print_r($htmlStrings, TRUE) ?></code>
              </pre>
            </div>
          </div>
          <div class="panel panel-default">
            <div class="panel-heading">Aktualisierte HTML-Dateien generieren</div>
            <div class="panel-body">
              <p>
                Wenn die Konfiguration stimmt, können die HTML-Dateien generiert werden:
                <form method="post">
                  <input type="hidden" name="do" value="process_templates" />
                  <input class="btn btn-default" type="submit" value="HTML generieren" />
                </form>
              </p>
            </div>
          </div>

        <?php if($step === 0 && !file_exists($db_dir . DIRECTORY_SEPARATOR . $db_name)) { ?>
          <h4>Keine Datenbank-Datei vorhanden</h4>
          <p>
            Unter dem Pfad <code><?= $db_dir . DIRECTORY_SEPARATOR . $db_name ?></code> existiert keine Datenbank-Datei.
          </p>
          <div class="panel panel-default">
            <div class="panel-body">
              <p>
                Wenn dies nicht der gewünscht Pfad ist, sollte dieser mit den Variablen <code>$db_dir</code> und <code>$db_name</code> in <code>assets/ajax/config.inc.php</code> angepasst werden. Anschließend kann diese Seite erneut geladen werden um fortzufahren.
              </p>
            </div>
          </div>
          <div class="panel panel-default">
            <div class="panel-body">
              <p>
                Wenn dies der gewünschte Pfad ist, kann die Demo-Datenbank mit einigen vorkonfigurierten Beispielen oder eine leere Datenbank erzeugt werden:
                <form method="post">
                  <input type="hidden" name="do" value="init_demodb" />
                  <input class="btn btn-default" type="submit" value="Demo-Datenbank verwenden" />
                </form>
                <form method="post">
                  <input type="hidden" name="do" value="init_newdb" />
                  <input class="btn btn-default" type="submit" value="Neue Datenbank anlegen" />
                </form>
              </p>
            </div>
          </div>
        <?php } else { ?>
          <h4>Datenbank-Datei bereits vorhanden</h4>
          <p>
            Unter dem Pfad <code><?= $db_dir . DIRECTORY_SEPARATOR . $db_name ?></code> existiert bereits eine SecDoc-Datenbank.
          </p>
          <div class="panel panel-default">
            <div class="panel-heading">Datenbank aktualisieren</div>
            <div class="panel-body">
              <p>
                Aktualisiert die Datenbank-Version, falls es sich um eine ältere Version handelt. Alle eingetragenen Verfahren bleiben erhalten und werden übernommen.
                Zur Sicherheit sollte vorher eine Kopie der Datenbank-Datei angelegt werden, um im Zweifelsfall auf die vorherige Version zurückkehren zu können.
                <form method="post">
                  <input type="hidden" name="do" value="update_db" />
                  <input class="btn btn-default" type="submit" value="Datenbank aktualisieren" />
                </form>
              </p>
            </div>
          </div>
          <div class="panel panel-default">
            <div class="panel-heading">Standardvorschläge für Eingabefelder laden</div>
            <div class="panel-body">
              <p>
                Sie können die mitgelieferten Vorschläge für dieverse der Eingabefelder in SecDoc in die Datenbank laden.
                <strong>Achtung:</strong> Dies leert die Tabelle der Vorschläge und befüllt sie neu. Eventuelle manuelle Ergänzungen gehen verloren!
                <form method="post">
                  <input type="hidden" name="do" value="load_suggestions" />
                  <input class="btn btn-default" type="submit" value="Standardvorschläge laden" />
                </form>
              </p>
            </div>
          </div>
          <div class="panel panel-default">
            <div class="panel-heading">TOM Listen laden</div>
            <div class="panel-body">
              <p>
                Es stehen aktuell TOM-Listen des BSI und der ENISA zur Verfügung. Sie benötigen mindestens eine Liste, damit SecDoc funktionieren kann.
                <strong>Achtung:</strong> Es findet kein Mapping zwischen den verschiedenen Listen statt! Sollte die TOM-Liste gewechselt werden, müssen die TOMs neu eingetragen werden.
                <form method="post">
                  <input type="hidden" name="do" value="load_toms" />
                  <div class="radio">
                    <label>
                      <input type="radio" name="tomlist" value="enisa" checked>
                      ENISA TOMs für IT-Verfahren und Verarbeitungstätigkeiten verwenden
                    </label>
                  </div>
                  <div class="radio">
                    <label>
                      <input type="radio" name="tomlist" value="bsi">
                      BSI TOMs für IT-Verfahren und Verarbeitungstätigkeiten verwenden
                    </label>
                  </div>
                  <div class="radio">
                    <label>
                      <input type="radio" name="tomlist" value="bsienisa">
                      BSI TOMs für IT-Verfahren und ENISA TOMs für Verarbeitungstätigkeiten verwenden
                    </label>
                  </div>
                  <input class="btn btn-default" type="submit" value="TOM Liste(n) laden" />
                </form>
              </p>
            </div>
          </div>
        <?php } ?>
      </div>
    </div>
  </body>
</html>
