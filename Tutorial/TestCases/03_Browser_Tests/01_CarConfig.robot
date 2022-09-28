*** Settings ***
Resource    00_technical_keywords.resource


*** Test Cases ***
Configure Car with Pass
    [Setup]    Open CarConfig as User
    Click New_Car
    Select Base Model    Minigolf
    Select Special Model    Gomera
    Select Accessory    ABS
    Select Accessories    Außenspiegel    Fußmatten    lenkrad    Radio
    Unselect Accessory    ABS
    Show Keyword Banner    True
    Select Special Model    Jazz
    Verify Total Price    16,619.00    €
    Set Car Name    Hello Car
    Save New_Car

Configure Car with wrong Acc
    [Setup]    Open CarConfig as User
    Click New_Car
    Select Base Model    Minigolf
    Select Special Model    Gomera
    Select Accessory    ABS
    Select Accessories    Außenspiegel    Fußmatten    lenkrad    Radio
    Unselect Accessory    ABS
    Select Special Model    Jazz
    Verify Total Price    16,619.00    €
    Set Car Name    My New Car
    Save New_Car
