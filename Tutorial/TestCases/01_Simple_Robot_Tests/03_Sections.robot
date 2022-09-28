*** Comments ***
Hallo liebe Teilnehmenden,

Das ist eine Detsche Suite.


*** Settings ***
Library      String


*** Variables ***
${Redner}       René Rohner


*** Test Cases ***
Testfall 1
    [Tags]    marker1    marker2
    [Timeout]    10 s
    [Setup]    Log To Console    Das ist der Anfang
    Sag mal    Hallo
    Log    Bitte das hier auch in die Console    console=Ja
    Log To Console    Das ist mitten drin
    [Teardown]    Log To Console    Das ist das Ende


*** Keywords ***
Sag mal
    [Arguments]    ${Nachricht}
    Log    ${Nachricht}    html=ja

