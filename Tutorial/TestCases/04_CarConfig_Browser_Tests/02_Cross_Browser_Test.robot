*** Settings ***
Library     Browser
Suite Setup    Get Browser Catalog


*** Test Cases ***
Starte Chrome
    New Browser    chromium    headless=${HEADLESS}
    New Context
    New Page    https://www.imbus.de
    Get Title    ==    Software-Qualitätssicherung und Softwaretest

Starte Webkit
    New Browser    webkit    headless=${HEADLESS}
    New Context
    New Page    https://www.imbus.de
    Get Title    ==    Software-Qualitätssicherung und Softwaretest

Starte Firefox
    New Browser    firefox    headless=${HEADLESS}
    New Context
    New Page    https://www.imbus.de
    Get Title    ==    Software-Qualitätssicherung und Softwaretest


*** Variables ***
${HEADLESS} =    False