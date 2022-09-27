*** Settings ***
Resource    functional_keywords.resource


*** Test Cases ***
Test
    FOR    ${i}    IN RANGE    1    21
        Open Web Page
        Set Username    schulung${{str($i).rjust(2, "0")}}
        Set Password    @RBTFRMWRK@
        Click Login Btn
        Wait For Condition    Element States     text=Neues Auto >> nth=0    contains    visible
        WHILE  True
            ${count}=    Get Element Count    .ng-star-inserted .fa
            IF    not $count   BREAK
            Click    .ng-star-inserted .fa >> nth=0
            Sleep   1s
        END
        Close Browser    ALL
    END
