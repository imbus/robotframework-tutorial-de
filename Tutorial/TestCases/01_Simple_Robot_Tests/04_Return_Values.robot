*** Settings ***
Library     String


*** Test Cases ***
Tests with Time
    ${time}=    Get Time
    Log To Console    Hello, Folks!
    Log To Console    It is ${time}.

Test a Text Contains
    Log To Console    one,two,three
    ${list}=    Split String    one,two,three    ,
    Log Many    @{list}
    FOR    ${item}    IN    @{list}
        Log To Console    ${item}
    END
