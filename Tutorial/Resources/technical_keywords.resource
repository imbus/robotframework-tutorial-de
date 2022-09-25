*** Settings ***
Library     Browser    timeout=10s    enable_presenter_mode=False    show_keyword_call_banner=True


*** Variables ***
${BASE-URL}=                http://car.keyword-driven.de
${btn_NewCar}=              a.HomeListButtonNewCar
${select_CarBaseModel}=     "Basismodell" >> ../.. >> select
${btn_LeftArrow}=           i.fa-chevron-left
${btn_RightArrow}=          i.fa-chevron-right
${txt_CarName}=             "Speichern:" >> ../.. >> input
${btn_Save}=                a >> "Speichern"


*** Keywords ***
Go To Next Page
    Click    ${btn_RightArrow}

Go To Prev Page
    Click    ${btn_LeftArrow}

Go To Accessories
    ${location}=    Get Url    then    value != '${BASE-URL}/config/extras'
    IF    $location    Click    css=[href="/config/extras"] >> nth=0

Click New_Car
    Wait For Elements State    ${btn_NewCar}    visible
    Click    ${btn_NewCar}

Save New_Car
    Click    ${btn_Save}

Get Options as Index
    [Documentation]    Returns the index of cars base model name.
    @{options}=    Get Elements    css=div.displayFlexStyleRow select option
    &{Option_dict}=    Create Dictionary
    FOR    ${index}    ${option}    IN ENUMERATE    @{options}
        ${Text}=    Get Text    ${option}
        ${index}=    Convert To String    ${index}
        &{Option_dict}=    Create Dictionary    &{Option_dict}    ${Text}=${index}
    END
    RETURN    ${Option_dict}

Get Options as Values
    @{options}=    Get Elements    css=div.displayFlexStyleRow select option
    &{Option_dict}=    Create Dictionary
    FOR    ${option}    IN    @{options}
        ${Text}=    Get Text    ${option}
        ${Value}=
        ...    Get Attribute
        ...    ${option}    value
        &{Option_dict}=    Create Dictionary    &{Option_dict}    ${Text}=${Value}
    END
    RETURN    ${Option_dict}

Get Element By Text
    [Arguments]    ${locator}    ${text}
    @{elements}=    Get Elements    ${locator}
    FOR    ${element}    IN    @{elements}
        ${act_text}=    Get Text    ${element}
        IF    $act_text == $text    RETURN    ${element}
    END

Set Username
    [Arguments]    ${user}
    Fill Text    id=input_username    ${user}

Set Password
    [Arguments]    ${password}
    Fill Secret    id=input_password    $password

Click Login Btn
    Click    id=button_login
