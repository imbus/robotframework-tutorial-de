*** Variables ***
${FIRST_NAME}    René
${LAST_NAME}    Rohner


*** Test Cases ***
Say My Name
    Log To Console    Hello, My Name is ${FIRST_NAME} ${LAST_NAME}
