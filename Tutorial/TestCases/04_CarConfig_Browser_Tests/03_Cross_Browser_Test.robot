*** Settings ***
Library     Browser


*** Test Cases ***
Mein Toller Test
    New Browser    chromium    headless=False    args=["--start-maximized"]
    New Context    viewport=None
    New Page    https://robocon.io

Starte Webkit
    New Browser    webkit    False
    New Context    viewport=None
    New Page    https://robocon.io

Starte Firefox
    New Browser    firefox    False
    New Context    viewport=None
    New Page    https://robocon.io
