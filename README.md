Hier ist die übersetzte Version des Textes gemäß deinen Vorgaben:

-----------------------

# Robot Framework Tutorial (de)
Repository für das Robot Framework Webinar auf Deutsch

Dieses Tutorial enthält mehrere kleine Beispiele, wie Robot Framework verwendet wird. Es kann entweder lokal auf dem eigenen Rechner oder in einer Cloud-Entwicklungsumgebung genutzt werden.

Falls Fragen zu Robot Framework bestehen oder die Installation nicht funktioniert, kann dem Robot Framework Slack-Channel **#newbies** beigetreten werden oder eine Schulung bei imbus gebucht werden.
[Hier klicken für Slack-Einladung](https://slack.robotframework.org)

## Vorbereitung

Zur Entscheidung, welche Art der Nutzung gewählt werden sollte, hier ein paar Hinweise:

- Cloud-Umgebung (Gitpod.io): Diese Option ist geeignet, wenn lediglich ein Einblick in Robot Framework gewonnen werden soll und eine weitere Nutzung nach dem Workshop eher unwahrscheinlich ist. Auch wenn lokale Installationen nicht möglich sind oder fehlgeschlagen sind, ist diese Option empfehlenswert.
- Lokale Installation: Diese Option ist geeignet, wenn die Absicht besteht, sich intensiver mit Robot Framework zu befassen und nach dem Workshop tiefer einzutauchen.

## Gitpod.io Cloud-Umgebung

Gitpod.io bietet schnell einsatzbereite, dockerbasierte, cloudgehostete Entwicklungsumgebungen.
Alles läuft im Browser, sodass keine lokale Installation notwendig ist.

Gitpod.io kann aktiv für 50 Stunden pro Monat kostenlos genutzt werden, und die Arbeitsumgebung kann jederzeit gestoppt werden, ähnlich einem Ruhezustand.

### Anforderungen

- Ein Github.com-Konto
- Telefonnummer zur Registrierungsverifizierung (Zur Aktivierung des Kontos muss eine Telefonnummer angegeben werden, um Missbrauch zu vermeiden)

### Einrichtung:

[![In Gitpod öffnen](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/imbus/robotframework-tutorial-de)

1. Dieses Repository in GitPod öffnen, indem der obige Button geklickt wird.
2. Die Standardeinstellungen beibehalten (Standard class) und auf **Continue** klicken.
3. Nach der **Vorbereitung** erscheint VSCode im Browser.
4. VSCode wird neu geladen, und die Installation aller Abhängigkeiten ist im Terminal zu sehen.
5. Nachdem die Installation abgeschlossen ist, wird VSCode ein zweites und letztes Mal neu geladen.
6. Nun sollten alle Dateien des Repositorys im Explorer sichtbar sein, und alles ist bereit für den Workshop.

## Lokale Installation

Um Robot Framework mit der auf Playwright basierenden "Robot Framework Browser" Bibliothek zu nutzen, werden Python und NodeJS benötigt, da Playwright auf NodeJS basiert.
Diese Installation beeinflusst keine bereits vorhandenen Playwright- oder Robot Framework-Installationen.

### Anforderungen

- [Python (3.9 - 3.13)](https://www.python.org/downloads/) (Für macOS wird dringend [**pyenv**](https://github.com/pyenv/pyenv) empfohlen, um zu steuern, welche Python-Version verwendet wird.)
- [NodeJS >= 18](https://nodejs.org/en/download/prebuilt-installer)
- [VSCode (stark empfohlen)](https://code.visualstudio.com/download)
- [RobotCode](https://robotcode.io/) [(VSCode Erweiterung)](https://marketplace.visualstudio.com/items?itemName=d-biehl.robotcode)

### Installation

Nachdem alle oben aufgeführten Anforderungen installiert sind, kann dieses Projekt in einen Ordner geklont oder das Repository heruntergeladen und entpackt werden.
In einem Terminal nach Wahl zum Stammverzeichnis dieses Repositorys navigieren, wo sich die bootstrap.py befindet.

Folgenden Befehl ausführen:
```bash
> python bootstrap.py
```

Dieses Script installiert alle benötigten Abhängigkeiten in einer virtuellen Umgebung und initialisiert die Browser-Bibliothek im selben Verzeichnis (`.venv`) im Stammverzeichnis des Repositories.
Nach Abschluss des Scripts wird angezeigt, wie diese virtuelle Umgebung "aktiviert" wird.

Beim Öffnen des Stammverzeichnisses in VSCode wird normalerweise automatisch diese virtuelle Umgebung aktiviert.
Falls dies nicht funktioniert, die Taste `F1` drücken und den Befehl `>Python: Select Interpreter` ausführen und die Umgebung im `.venv` Ordner auswählen.

## Testen der Einrichtung

Zum Testen der Installation den 'Testing'-Explorer (Ansicht > Testing) öffnen und die `Tutorial`-Suite ausführen.
Das Ergebnis sollte wie folgt aussehen: `32 tests, 29 passed, 3 failed`.

Nun ist alles bereit für die Teilnahme am Workshop.
