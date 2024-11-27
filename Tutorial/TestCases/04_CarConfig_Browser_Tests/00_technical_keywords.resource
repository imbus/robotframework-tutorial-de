*** Settings ***
Library     Browser    timeout=10s    enable_presenter_mode=False    show_keyword_call_banner=True
Library     FakerLibrary


*** Variables ***
${BASE-URL}                 http://car.keyword-driven.de
${HEADLESS}                 False
${btn_NewCar}               a.HomeListButtonNewCar
${select_CarBaseModel}      "Basismodell" >> ../.. >> select
${btn_LeftArrow}            i.fa-chevron-left
${btn_RightArrow}           i.fa-chevron-right
${txt_CarName}              "Speichern:" >> ../.. >> input
${btn_Save}                 a >> "Speichern"
${car_name}                 [href="/config/summary/wrong"]


*** Keywords ***
Verify Base Model Page
    Get Url    ==    ${BASE-URL}/config/basemodel

Select ${basemodel} as model
    Wait For Elements State    ${select_CarBaseModel}
    Select Options By    ${select_CarBaseModel}    text    ${basemodel}

Select Car Base Model
    [Arguments]    ${basemodel}
    Wait For Elements State    ${select_CarBaseModel}
    Select Options By    ${select_CarBaseModel}    text    ${basemodel}

Select Special Model
    [Arguments]    ${special}
    Click    css=[href="/config/edition"] >> nth=0
    Click    div#editionNames div >> text=${special}

Select Accessory
    [Arguments]    ${accessory}
    Go To Accessories
    Check Checkbox    span >> text=${accessory} >> ../input

Unselect Accessory
    [Arguments]    ${accessory}
    Go To Accessories
    Uncheck Checkbox    span >> text=${accessory} >> ../input

Set Car Name
    [Arguments]    ${Name}
    Click    [href="/config/summary"]
    Type Text    ${txt_CarName}    ${Name}

Verify Total Price
    [Arguments]    ${expected_price}    ${unit}
    Click    [href="/config/summary"] >> nth=0
    ${exc_price}=    Regexp Escape    ${expected_price}
    ${pricestr}=    Get Text    css=span.summaryTotalPriceStyle > h6
    Run Keyword And Continue On Failure    Should Match Regexp    ${pricestr}    .*(${exc_price}).*
    Run Keyword And Continue On Failure    Should Match Regexp    ${pricestr}    .*(${unit}$)

Verify Price
    [Arguments]    ${expected_price}
    ${price_text}=    Get Text    css=span.summaryTotalPriceStyle
    Should Contain    ${price_text}    ${expected_price}

Open CarConfig As User
    Open Web Page
    Set Username    user03
    Set Password    password
    Click Login Btn

Open Web Page
    [Arguments]    ${url}=${BASE-URL}    ${browser}=chromium    ${headless}=${HEADLESS}
    IF    $browser=="chromium"
        ${args}=    Set Variable    ["--start-maximized"]
    ELSE
        ${args}=    Set Variable    ${None}
    END
    New Browser    ${browser}    headless=${headless}    args=${args}
    New Context
    ...    colorScheme=dark
    ...    viewport=${None}
    ...    tracing=True
    New Page    ${url}

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


