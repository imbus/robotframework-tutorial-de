Hier ist die übersetzte Version des Textes gemäß deinen Vorgaben:

-----------------------

# Robot Framework Tutorial (de)
Repository für das Robot Framework Webinar auf Deutsch

Dieses Tutorial enthält mehrere kleine Beispiele, wie Robot Framework verwendet wird. Es kann entweder lokal auf dem eigenen Rechner oder in einer Cloud-Entwicklungsumgebung genutzt werden.

Falls Fragen zu Robot Framework bestehen oder die Installation nicht funktioniert, kann dem Robot Framework Slack-Channel **#newbies** beigetreten werden oder eine Schulung bei imbus gebucht werden.
[Hier klicken für Slack-Einladung](https://slack.robotframework.org)

## Vorbereitung

Zur Entscheidung, welche Art der Nutzung gewählt werden sollte, hier ein paar Hinweise:

- Cloud-Umgebung (Github Codespaces): Diese Option ist geeignet, wenn lediglich ein Einblick in Robot Framework gewonnen werden soll und eine weitere Nutzung nach dem Workshop eher unwahrscheinlich ist. Auch wenn lokale Installationen nicht möglich sind oder fehlgeschlagen sind, ist diese Option empfehlenswert.
- Lokale Installation: Diese Option ist geeignet, wenn die Absicht besteht, sich intensiver mit Robot Framework zu befassen und nach dem Workshop tiefer einzutauchen.

## Github Codespaces Cloud-Umgebung

Github Codespaces bietet schnell einsatzbereite, dockerbasierte, cloudgehostete Entwicklungsumgebungen.
Alles läuft im Browser, sodass keine lokale Installation notwendig ist.

Github Codespaces kann aktiv für ~60 Stunden pro Monat kostenlos genutzt werden, und die Arbeitsumgebung kann jederzeit gestoppt werden, ähnlich einem Ruhezustand.

### Anforderungen

- Ein Github.com-Konto

### Einrichtung:

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/imbus/robotframework-tutorial-de)

1. Dieses Repository in GitHub Codespaces öffnen, indem der obige Button geklickt wird.
2. Die Standardeinstellungen beibehalten (Standard class) und auf **Create Codespace** klicken.
3. Unten rechts wird "Setting up remote connection: Building codespace..." angezeigt.
4. Über einen klick auf "Building codespace..." kann der Vortschritt beobachtet werden.
5. Nachdem die Installation abgeschlossen ist, wird in VSCode die README.md angezeigt und die Farben ändern sich.
6. Im Terminal sollte nun "Running postCreateCommand..." zu lesen sein. Du bist startklar.

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
