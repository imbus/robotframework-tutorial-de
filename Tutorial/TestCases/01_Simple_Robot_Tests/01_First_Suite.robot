*** Test Cases ***
Test Case 1
    [Documentation]    This test will check if "Hello" is "Hello" and pass.
    Log     Hello World
    Should Be Equal    Hello    Hello

Test Case that fails
    [Documentation]    This test will check if "Hello" is equal to "World" and therefore fail.
    Log    Hello This will Fail...
    Should Be Equal    Hello    World
