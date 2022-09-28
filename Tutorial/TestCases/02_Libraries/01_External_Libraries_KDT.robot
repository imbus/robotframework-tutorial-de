*** Settings ***
Library     OperatingSystem
Library     XML
Library     String
Library     FakerLibrary
Library     Browser


*** Test Cases ***
Denied Login
    Open Web Page    https://www.qs-tag.de/en
    Verify Title    Software-QS-Tag - Reinventing Quality
    Accept Cookie Banner
    Open RoboCon Link
    Verify Title    Software-QS-Tag - Reinventing Quality
    Switch To New Tab and verify    https://robocon.io/germany    RoboCon
    Screenshot Full Page


*** Keywords ***
Open Web Page
    [Arguments]    ${url}
    New Browser    browser=chromium    headless=False
    New Context    viewport=None
    New Page    ${url}

Verify Title
    [Arguments]    ${expected_title}
    Get Title    ==    ${expected_title}

Accept Cookie Banner
    Click    text=allow all cookies

Open RoboCon Link
    Click    a.button >> text=RoboCon 2022 Germany

Switch To New Tab and verify
    [Arguments]    ${url}    ${title}
    Switch Page    NEW
    Get Title    ==    ${title}
    Get Url    ==    ${url}

Screenshot Full Page
    Wait Until Network Is Idle
    Take Screenshot    EMBED    fullPage=True
