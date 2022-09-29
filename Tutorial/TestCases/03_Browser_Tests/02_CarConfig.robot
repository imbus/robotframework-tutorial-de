*** Settings ***
Metadata    Conference    RoboCon

Resource    00_technical_keywords.resource


*** Variables ***
${TEST_URL}     http://car.keyword-driven.de


*** Test Cases ***
Configure Car with Pass
    [Setup]    Open Web Page    ${TEST_URL}
    Login User    admin    @RBTFRMWRK@
    Click New_Car
    Select Base Model    Minigolf
    Select Special Model    Jazz
    Select Accessories    ABS    Außenspiegel    Fußmatten    lenkrad    Radio
    Verify Total Price    17,453.00    €
    Set Car Name    My New Car
    Save New_Car


*** Keywords ***
Login User
    [Arguments]    ${user}    ${password}
    Set Username    ${user}
    Set Password    ${password}
    Click Login Btn

Select Base Model
    [Arguments]    ${basemodel}
    Wait For Elements State    ${select_CarBaseModel}
    Select Options By    ${select_CarBaseModel}    text    ${basemodel}

Select Accessories
    [Arguments]    @{accessory_list}
    Go To Accessories
    FOR    ${acc}    IN    @{accessory_list}
        Select Accessory    ${acc}
    END



