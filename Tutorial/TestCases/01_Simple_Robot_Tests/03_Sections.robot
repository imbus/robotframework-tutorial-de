*** Comments ***
Dear Participants,

This is a Comment.


*** Settings ***
Library      String


*** Variables ***
${Redner}       René Rohner


*** Test Cases ***
Testfall 1
    [Tags]    marker1    marker2
    [Timeout]    10 s
    [Setup]    Log To Console    Das ist der Anfang
    Ich bin ein Keyword    Hallo
    Log    Bitte das hier auch in die Console    console=Ja
    Log To Console    Das ist mitten drin
    [Teardown]    Log To Console    Das ist das Ende


*** Keywords ***
Ich bin ein Keyword
    [Arguments]    ${Nachricht}
    Log    ${Nachricht}

