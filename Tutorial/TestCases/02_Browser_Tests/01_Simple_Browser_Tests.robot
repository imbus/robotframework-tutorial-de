*** Settings ***
Library    Browser


*** Testfälle ***
Open CarConfig And Login
    New Browser    chromium    False
    New Context
    New Page    http://car.keyword-driven.de
    ${title}    Get Title
    Should Be Equal    ${title}    CarConfigurator
    Sleep    5s

