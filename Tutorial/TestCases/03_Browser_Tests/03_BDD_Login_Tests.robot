*** Settings ***
Library    Browser
Documentation    A user shall login by giving correct credentials.


*** Test Cases ***
A User Logs In To CarConfig
    Given CarConfigurator has been opened
    When the Username 'schulung02' is set
    and the Password '@RBTFRMWRK@' is set
    and the Login Button is clicked
    Then the Page should have the Title 'CarConfigurator' and the URL 'car.keyword-driven.de/list'


** Keywords ***
CarConfigurator has been opened
    New Browser    headless=False
    New Context
    New Page    http://car.keyword-driven.de

the Username '${username}' is set
    [Documentation]    Types the given \${username} into the username input element.
    Type Text    id=input_username    ${username}

the Password '${password}' is set
    [Documentation]    Types the given \${password} into the password input element.
    Type Text    id=input_password    ${password}

the Login Button is clicked
    Click    id=button_login

the Page should have the Title '${Title}' and the URL '${url}'
    Get Title    ==    ${Title}
    Get Url    $=    ${url}

