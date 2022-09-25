*** Settings ***
Suite Setup       Log Starttime
Suite Teardown    Log Endtime
Library           DateTime
Metadata          KomischerLink    http://www.google.de
Default Tags      TAG
...               DEFAULT
Force Tags        Car
Resource          functional_keywords.resource





*** Comments ***
(content) => {
    const kwCallBanner = document.getElementById('kwCallBanner');
    if (kwCallBanner) {
        kwCallBanner.textContent = content;
    } else {
        const kwCallBanner = document.createElement("style");
        kwCallBanner.setAttribute("id", 'kwCallBanner');
        kwCallBanner.textContent = content;
        document.head.appendChild(kwCallBanner);  
    }          
}



*** Variables ***
${BASE-URL}=      http://car.keyword-driven.de
${btn_NewCar}=    a.HomeListButtonNewCar
${select_CarBaseModel}=    "Basismodell" >> ../.. >> select
${btn_LeftArrow}=    i.fa-chevron-left
${btn_RightArrow}=    i.fa-chevron-right
${txt_CarName}=    "Speichern:" >> ../.. >> input
${btn_Save}=      a >> "Speichern"


*** Test Cases ***
Configure Car with Pass
    [Setup]    Open CarConfig as User
    Register Keyword To Run On Failure    Take Screenshot    EMBED
    Click New_Car
    Select Base Model       Minigolf
    Select Special Model    Gomera
    Get Title
    Get Url
    Select Accessory        ABS
    Select Accessories      Außenspiegel    Fußmatten    lenkrad    Radio
    Unselect Accessory      ABS
    Show Keyword Banner     True
    Select Special Model    Jazz
    Verify Total Price      16,619.00    €
    Show Keyword Banner     False
    Set Car Name            My New Car
    Save New_Car

    
New Persisistent Context
    New Browser    headless=False
    New Context    viewport={"width": 1000, "height": 600}    screen={"width": 1280, "height": 800}
    New Page
    ...    url=${BASE-URL}
    Get Title
    Get Url

Open Robocon.io
    Set Test Variable    ${BASE-URL}    https://qs-tag.de
    Open CarConfig
    ${count}    Get Element Count    text=FickeFuck
    ${states}    Get Element States    text=FickeFuck
    Record Selector    login

Configure Car with wrong Acc
    [Setup]    Open CarConfig as User
    Click New_Car
    Select Base Model       Minigolf
    Select Special Model    Gomera
    Select Accessory        aABS
    Select Accessories      Außenspiegel    Fußmatten    lenkrad    Radio
    Unselect Accessory      ABS
    Select Special Model    Jazz
    Verify Total Price      16,619.00    €
    Set Car Name            My New Car
    Save New_Car

Configure Car with car Acc
    [Setup]    Open CarConfig as User
    Click New_Car
    Select Base Model       Minigolf
    Select Special Model    Gomera
    Select Accessory        ABS
    Select Accessories      Außenspiegel    Fußmatten    lenkrad    Radio
    Unselect Accessory      ABS
    Select Special Model    Jazz
    Verify Total Price      16,619.00    €
    ${car}    Set Variable    My New Car
    Set wrong Car Name      ${car}
    Save New_Car
