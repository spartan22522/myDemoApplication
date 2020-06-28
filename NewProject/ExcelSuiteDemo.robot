*** Settings ***
Library           ExcelLibrary
Library           FakerLibrary

*** Variables ***
${count}          ${EMPTY}
${var}            ${EMPTY}

*** Test Cases ***
Excel_TC01
    Open Excel    E:/Robot Framework/New_Demo_Project/NewProject/POEMS_Demo/WriteExcel.xls
    Check Cell Type    Sheet1    2    1
    ${count}    Get Column Count    Sheet1
    ${count}    Get Column Values    Sheet1    2
    FOR    ${var}    IN    ${count}
        Log    ${count}
    END
        ${/}
