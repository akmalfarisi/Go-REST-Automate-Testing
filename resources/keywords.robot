*** Settings ***
Library    RequestsLibrary
Library    Process

*** Variables ***
${base_url}=    https://gorest.co.in/public/v2
${token}=    Bearer [YOUR_ACCESS_TOKEN_HERE]

*** Keywords ***
Get Users
    [Arguments]    ${param}    ${value}
    Create Session    gorest    ${base_url}
    ${url}=    Set Variable    ${base_url}/users?${param}=${value}
    ${headers}=    Create Dictionary    Authorization=${token}    Accept=application/json    Content-Type=application/json
    ${response}=    GET On Session    gorest    ${url}    headers=${headers}
    Should Be Equal As Numbers    ${response.status_code}    200
    Log    ${response.content}
    RETURN    ${response}

List Users
    Create Session    gorest    ${base_url}
    ${url}=    Set Variable    ${base_url}/users
    ${headers}=    Create Dictionary    Authorization=${token}    Accept=application/json    Content-Type=application/json
    ${response}=    GET On Session    gorest    ${url}    headers=${headers}
    Should Be Equal As Numbers    ${response.status_code}    200
    Log    ${response.content}
    RETURN    ${response}

Create User
    [Arguments]    ${user}
    ${name}=    Set Variable    ${user}[name]
    ${email}=    Set Variable    ${user}[email]
    ${gender}=    Set Variable    ${user}[gender]
    ${status}=    Set Variable    ${user}[status]
    ${data}=    Create Dictionary    name=${name}    email=${email}    gender=${gender}    status=${status}
    Create User With Data    ${data}

Create User With Data
    [Arguments]    ${data}
    &{headers}=    Create Dictionary    Authorization=${token}    Content-Type=application/json
    Create Session    gorest    https://gorest.co.in    headers=${headers}
    ${response}=    POST On Session    gorest    /public/v2/users    json=${data}
    Should Be Equal As Numbers    ${response.status_code}    201
    Log    User created with data: ${data}
    # Refresh list of users
    List Users
