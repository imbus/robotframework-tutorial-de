*** Settings ***
Resource          technical_keywords.resource


*** Variables ***
${car_name}    [href="/config/summary/wrong"]

*** Keywords ***
Verify Base Mode Page
    Get Url    ==    ${BASE-URL}/config/basemodel

Select ${basemodel} as model
    Wait For Elements State    ${select_CarBaseModel}
    Select Options By    ${select_CarBaseModel}    text    ${basemodel}

Select Base Model
    [Arguments]    ${basemodel}
    Wait For Elements State    ${select_CarBaseModel}
    Select Options By    ${select_CarBaseModel}    text    ${basemodel}

Select Special Model
    [Arguments]    ${special}
    Click    css=[href="/config/edition"] >> nth=0
    Click    //div[@id='editionNames']//div[contains(text(),'${special}')]

Select Accessories
    [Arguments]    @{accessory_list}
    Go To Accessories
    #Click Link    css=[href="/config/extras"]
    FOR    ${acc}    IN    @{accessory_list}
        Select Accessory    ${acc}
    END

Select Accessory
    [Arguments]    ${accessory}
    Go To Accessories
    #Click Link    css=[href="/config/extras"]
    Check Checkbox    //span[contains(text(),'${accessory}')]/../input

Unselect Accessory
    [Arguments]    ${accessory}
    Go To Accessories
    #Click Link    css=[href="/config/extras"]
    Uncheck Checkbox    //span[contains(text(),'${accessory}')]/../input

Set Car Name
    [Arguments]    ${Name}
    Click    [href="/config/summary"]
    Type Text    ${txt_CarName}    ${Name}

Set wrong Car Name
    [Arguments]    ${Name}
    Click    ${car_name}
    Type Text    ${txt_CarName}    ${Name}


Verify Total Price
    [Arguments]    ${expected_price}    ${unit}
    Click    [href="/config/summary"]
    ${pricestr}    Get Text    css=span.summaryTotalPriceStyle > h6
    # Log Many    @{{$pricestr.split(' ')}}
    ${exc_price}    Regexp Escape    ${expected_price}
    Run Keyword And Continue On Failure    Should Match Regexp    ${pricestr}    .*(${exc_price}).*
    Run Keyword And Continue On Failure    Should Match Regexp    ${pricestr}    .*(${unit}$)

Verify Price
    [Arguments]    ${expected_price}
    ${price_text}=    Get Text    css=span.summaryTotalPriceStyle
    Should Contain    ${price_text}    ${expected_price}

Open CarConfig As User
    Open CarConfig
    Set Username    admin
    Set Password    @RBTFRMWRK@
    Click Login Btn

Open CarConfig
    New Browser    chromium    headless=False
    New Context    colorScheme=dark   viewport={'width': 1000, "height": 500}    tracing=${OUTPUTDIR}/trace.zip    recordVideo={"dir": "videos", "size": {"width": 1000, "height": 500}}
    New Page    ${BASE-URL}