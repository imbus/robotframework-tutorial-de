*** Settings ***
Bibliothek      Browser


*** Test Cases ***
Mein Toller Test
    New Browser    chromium    headless=False    args=["--start-maximized"]
    New Context    viewport=None
    New Page    https://robocon.io
    Sleep    5s

Starte Webkit
    New Browser    webkit    False
    New Context    viewport=None
    New Page    https://robotframework.org

Starte Firefox
    New Browser    firefox    False
    New Context    viewport=None
    New Page    http://car.keyword-driven.de

