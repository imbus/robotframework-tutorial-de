*** Settings ***
Library     Browser    timeout=20 sec


*** Test Cases ***
Check RF 3.2 not supporting IF statement
    New Browser    browser=webkit    headless=False
    New Context    colorScheme=dark
    New Page    https://robotframework.org
    Set Assertion Formatters    formatters={'Get Text': ["strip"]}
    Click    "Getting Started"
    Click    id=project-drop-down
    Click    id=project-dropdown-content >> "Advanced Example"
    Wait For Condition    Text    id=project-drop-down    ==    Advanced Example
    Click    id=version-drop-down
    Click    id=version-dropdown-content >> "3.2"
    Click    id=run-button
    Wait For Condition    Element States    id=log.html-button    contains    visible
    Get Text    id=console    contains    'If' is a reserved keyword.
    Click    id=log.html-button
    ${test_case}=    Get Element
    ...    id=report >>> [title="Robot Files.Test.Access Own Details With User Rights"] >> ../..
    Scroll To Element    ${test_case}
    Take Screenshot    selector=${test_case}
    ${message}=    Get Table Cell Element    ${test_case} >> > div > table.metadata    1    "Message:"
    Get Text    ${message}    ==    'If' is a reserved keyword.
