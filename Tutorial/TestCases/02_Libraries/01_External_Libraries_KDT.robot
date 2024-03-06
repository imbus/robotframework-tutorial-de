*** Settings ***
Library     Browser


*** Variables ***
${BROWSER}      chromium
${HEADLESS}     False


*** Test Cases ***
Check RF 3.2 not supporting IF statement
    Open Browser    https://robotframework.org
    Select Demo Project    Advanced Example
    Select Robot Framework Version    3.2
    Run Demo Robot
    Verify Console Output Contains    'If' is a reserved keyword.
    Open log.html
    Verify Test Case Message    Robot Files.Test.Access Own Details With User Rights    'If' is a reserved keyword.


*** Keywords ***
Open Browser
    [Arguments]    ${url}
    New Browser    browser=${BROWSER}    headless=${HEADLESS}
    New Context    colorScheme=dark
    New Page    ${url}
    Set Assertion Formatters    formatters={'Get Text': ["strip"]}

Select Demo Project
    [Arguments]    ${project_name}
    Click    id=project-drop-down
    Click    id=project-dropdown-content >> "${project_name}"
    Wait For Condition    Text    id=project-drop-down    ==    ${project_name}

Select Robot Framework Version
    [Arguments]    ${version}
    Click    id=version-drop-down
    Click    id=version-dropdown-content >> "${version}"

Run Demo Robot
    [Arguments]    ${wait_for_finish}=True
    Click    id=run-button
    IF    ${wait_for_finish}
        Wait For Condition    Element States    id=log.html-button    contains    visible
    END

Verify Console Output Contains
    [Arguments]    ${text}=
    Get Text    id=console    contains    ${text}

Open log.html
    Click    id=log.html-button

Verify Test Case Message
    [Arguments]    ${test_case_long_name}    ${expected_message}
    ${test_case}=    Get Element    id=report >>> [title="${test_case_long_name}"] >> ../..
    Scroll To Element    ${test_case}
    ${id}=    Get Attribute    ${test_case}    id
    Evaluate JavaScript    ${test_case}    () => expandAll('${id}')
    Take Screenshot    selector=${test_case}
    ${message}=    Get Table Cell Element    ${test_case} >> > div > table.metadata    1    "Message:"
    Get Text    ${message}    ==    ${expected_message}
