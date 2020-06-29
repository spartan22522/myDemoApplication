*** Settings ***
Library           ExcelLibrary
Library           SeleniumLibrary
Resource          UserDefinedKeyWord.txt    # My first resource file
Resource          flightResources.txt
Library           String
Library           random2
Library           random
Library           Faker
Library           Faker

*** Variables ***
${url}            https://ngendigital.com/demo-application
${error_Flight}    ${EMPTY}
${random}         ${EMPTY}
${randomDigit}    ${EMPTY}

*** Test Cases ***
TC_01
    Open Browser    https://ngendigital.com/practice    Chrome
    Maximize Browser Window
    Select Frame    id=iframe-015
    Sleep    4
    Select From List    id=FromCity
    Sleep    4
    Input Text    css=input[name=FirstName]    SeleniumFName
    Sleep    4
    Close Browser

TC_02_AXpath
    Open Browser    https://ngendigital.com/practice    Chrome
    Maximize Browser Window
    Select Frame    id=iframe-015
    Sleep    4
    Click Element    xpath=//input[@name='car' and @value='bmw']
    Sleep    4
    Input Text    css=input[name=FirstName]    SeleniumFName
    Sleep    4
    [Teardown]    Close Browser

TC_FlightApplication
    Open Browser    ${url}    Chrome
    Maximize Browser Window
    Select Frame    id=iframe-015
    Sleep    4
    Wait Until Keyword Succeeds    1 min    5 sec    login to Flight Application    support@ngendigital.com    abc123
    Page Should Contain    Fly with peace...
    ${error_Flight}    Get Text    ${getPeace}
    Log To Console    ${error_Flight}
    Generate Random String
    [Teardown]    Close Browser

testString
    ${random}    Generate Random String    80    [UPPER]
    Log To Console    ${random}
    Log    ${getPeace}
