*** Settings ***
Library    OperatingSystem
Library    XML
Library    String
Library    FakerLibrary
Library    Browser

*** Test Cases ***
Denied Login
    New Browser    browser=chromium    headless=False
    New Context    viewport=None
    New Page       https://www.qs-tag.de/en
    ${title}    Get Title
    Should Be Equal    ${title}    Software-QS-Tag - Reinventing Quality
    Click    text=allow all cookies
    Click    a.button >> text=RoboCon 2022 Germany
    ${title}    Get Title
    Should Be Equal    ${title}    Software-QS-Tag - Reinventing Quality
    Switch Page    NEW
    ${new_title}    Get Title
    ${new_url}    Get Url
    Should Be Equal    ${new_title}    RoboCon
    Should Be Equal    ${new_url}      https://robocon.io/germany
    Wait Until Network Is Idle
    Take Screenshot    EMBED