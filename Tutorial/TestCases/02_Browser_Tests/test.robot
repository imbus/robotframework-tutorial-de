*** Einstellungen ***
Bibliothek    Browser


*** Testfälle ***
Mein Toller Test
    New Browser    chromium    headless=False
    New Page    https://robocon.io

    New Browser    webkit    False
    New Page    https://robotframework.org

    New Browser    firefox    False
    New Page     http://car.keyword-driven.de

    Sleep     20s