*** Settings ***
Library     String


*** Variables ***
${Redner}       René Rohner


*** Test Cases ***
Ich bin ein Testfall
    [Tags]    marker1    marker2
    [Setup]    Log To Console    Das ist der Anfang
    Ich bin ein Keyword    Ich bin ein Argument: ${Redner}
    Log    Das hier landet im Log
    Log To Console    Das ist mitten drin
    [Teardown]    Log To Console    Das ist das Ende


*** Keywords ***
Ich bin ein Keyword
    [Arguments]    ${Nachricht}
    Log    ${Nachricht}
