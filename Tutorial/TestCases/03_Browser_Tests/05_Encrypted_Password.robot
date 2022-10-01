*** Settings ***
Library     Browser
Library     CryptoLibrary    variable_decryption=True    key_path=crypto_keys


*** Variables ***
${PASSWORD}    crypt:MhZu50+Q2tS4ykdlMXKwqGwKHxfjKpu/oCjFf/ZTNXGE1cLouYdOh+9w1vF90/ftI9O7XO6GoWgTdhM=


*** Test Cases ***
Login with correct data
    Open CarConfigurator
    Type Username    schulung01
    Type Password    ${PASSWORD}
    Click Login Button
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
    Type Secret    id=input_password    $password

Click Login Button
    Click    id=button_login

Verify Page
    [Arguments]    ${Title}    ${url}
    Get Title    ==    ${Title}
    Get Url    $=    ${url}
