*** Variables ***
${FIRST_NAME}    René
${LAST_NAME}    Rohner
@{LIST_VARIABLE}

*** Test Cases ***
Say My Name
    Log To Console    \nHello, My Name is ${FIRST_NAME} ${LAST_NAME}
