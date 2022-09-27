*** Settings ***
Library    mylib.py


*** Test Cases ***
Test Case 1
    Log To Console    Hello World
    Should Be Equal    Hello    Hello

Test Case 2
    Check String Length    Hallo    5

Test Case 3
    Check String Length    Welt      5
