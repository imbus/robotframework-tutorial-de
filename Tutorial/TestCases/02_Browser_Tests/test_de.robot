*** Einstellungen ***
Bibliothek    Browser


*** Testfälle ***
Test
    Angenommen Die Login-Seite ist geöffnet
    Wenn der Bentuzername "Admin" gesetzt wird
    Sleep    5s


*** Schlüsselwörter ***
Die Login-Seite ist geöffnet
    New Browser    headless=False
    New Page    http://car.keyword-driven.de

der Bentuzername "${name}" gesetzt wird
    Type Text    id=input_username    ${name}

