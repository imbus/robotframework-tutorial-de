language: de
*** Einstellungen ***
Dokumentation       Ein Benutzer soll in der Lage sein sich mit korrekten Benutzerdaten am System anmelden zu können.

Bibliothek          Browser


*** Testfälle ***
Ein Benutzer meldet sich am CarConfig an
    Angenommen der CarConfigurator wurde geöffnet
    Wenn als Benutzer 'user02' eingegeben wird
    und als Passwort 'password' eingegeben wird
    und der Login-Button gedrückt wird
    Dann soll die Seite den Titel 'CarConfigurator' und die URL 'car.keyword-driven.de/list' haben.


*** Schlüsselwörter ***
der CarConfigurator wurde geöffnet
    New Browser    headless=${HEADLESS}
    New Context
    New Page    http://car.keyword-driven.de

als Benutzer '${benutzer}' eingegeben wird
    Type Text    id=input_username    ${benutzer}

als Passwort '${passwort}' eingegeben wird
    Type Text    id=input_password    ${passwort}

der Login-Button gedrückt wird
    Click    id=button_login

soll die Seite den Titel '${Title}' und die URL '${url}' haben.
    Get Title    ==    ${Title}
    Get Url    $=    ${url}


*** Variablen ***
${HEADLESS} =    False