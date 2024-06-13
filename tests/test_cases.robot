*** Settings ***
Resource    ../resources/keywords.robot
Library    ExcelLibrary.py

*** Variables ***
${excel_file}=    ${CURDIR}/input_data.xlsx

*** Test Cases ***
Get User Details
    Get Users    name    akmal

Create Users From Excel
    [Documentation]    Create users by reading data from an Excel file and sending POST requests.
    ${users}=    Read Excel Data    ${EXCEL_FILE}
    FOR    ${user}    IN    @{users}
        Create User    ${user}
    END

Show User Lists
    List Users