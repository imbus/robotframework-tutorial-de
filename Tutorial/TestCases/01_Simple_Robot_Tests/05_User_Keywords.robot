*** Test Cases ***
This is a Test with Keywords
    Say Hello
    Say Hello To a Person    Mikko


Test Sleeping for 5 Seconds
    ${Zeit}    Get Time Of Day
    Log To Console    ${Zeit}
    Sleep   5 sec
    ${Zeit}    Get Time Of Day
    Log To Console    ${Zeit}


*** Keywords ***
Say Hello
    Log To Console    \nHello World

Say Hello To a Person
    [Arguments]    ${name}
    Log To Console     \nHello, ${name}

Get Time Of Day
    ${hour}    ${min}    ${sec}    Get Time    hour min sec    UTC + 2hours
    RETURN    ${hour}:${min}:${sec}
