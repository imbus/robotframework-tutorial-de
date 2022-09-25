*** Settings ***
Bibliothek      Browser


*** Test Cases ***
Mein Toller Test
    New Browser    chromium    headless=False    args=["--start-maximized"]
    New Context    viewport=None
    New Page    https://robocon.io
    Sleep    10s

Starte Webkit
    New Browser    webkit    False
    New Context    viewport=None
    New Page    https://robotframework.org
    Sleep    10s

Starte Firefox
    New Browser    firefox    False
    New Context    viewport=None
    New Page    http://car.keyword-driven.de
    Sleep    20s

