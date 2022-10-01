*** Settings ***
Library     Browser


*** Test Cases ***
Login with correct data
    Open CarConfigurator
    Type Username    schulung01
    Type Password    @RBTFRMWRK@
    Click    id=button_login
    Verify Page    CarConfigurator    list


*** Keywords ***
Open CarConfigurator
    New Browser    headless=False
    New Context
    New Page    http://car.keyword-driven.de

Type Username
    [Documentation]    Types the given \${username} into the username input element.
    [Arguments]    ${username}
    Type Text    id=input_username    ${username}

Type Password
    [Documentation]    Types the given \${password} into the password input element.
    [Arguments]    ${password}
    Type Text    id=input_password    ${password}

Click Login Button
    Click    id=button_login

Verify Page
    [Arguments]    ${Title}    ${url}
    Get Title    ==    ${Title}
    Get Url    $=    ${url}

