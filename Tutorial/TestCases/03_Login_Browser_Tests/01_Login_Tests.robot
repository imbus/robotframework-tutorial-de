*** Settings ***
Library     Browser


*** Variables ***
${HEADLESS} =    False


*** Test Cases ***
Login with correct data
    New Browser    headless=${HEADLESS}
    New Context
    New Page    http://car.keyword-driven.de
    Type Text    id=input_username    user01
    Type Text    id=input_password    password
    Click    id=button_login
    Get Title    ==    CarConfigurator
    Get Url    ==    http://car.keyword-driven.de/list
