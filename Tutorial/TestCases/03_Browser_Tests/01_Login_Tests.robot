*** Settings ***
Library     Browser


*** Test Cases ***
Login with correct data
    New Browser    headless=False
    New Context
    New Page    http://car.keyword-driven.de
    Type Text    id=input_username    schulung01
    Type Text    id=input_password    @RBTFRMWRK@
    Click    id=button_login
    Get Title    ==    CarConfigurator
    Get Url    ==    http://car.keyword-driven.de/list

