*** Settings ***
Resource          wsb resource.tsv
Library           RequestsLibrary

*** Test Cases ***
REST call 1
    ${stdout}    Wsb Resource.Log to console    test
    Should Contain    ${stdout}    test
    Should Match Regexp    ${stdout}    test WSB\\d{3}

Rest call 200
    ${url}    Set Variable    http://maps.googleapis.com
    ${resource}    Set Variable    /maps/api/geocode/xml
    ${address}    Set Variable    Gdynia.Poland
    RequestsLibrary.Create Session    GoogleRest    ${url}
    ${params}    Create Dictionary    address1=${address}    sensor=false
    ${response}    RequestsLibrary.Get Request    GoogleRest    ${resource}    params=${params}
    ${code}    Set Variable    ${response.status_code}
    #&{response}{status_code}
    log    ${code}
    Should Be Equal As Integers    200    ${code}

Rest call 400
    ${url}    Set Variable    http://maps.googleapis.com
    ${resource}    Set Variable    /maps/api/geocode/xml
    ${address}    Set Variable    Gdynia.Poland
    RequestsLibrary.Create Session    GoogleRest    ${url}
    ${params}    Create Dictionary    address1=${address}    sensor=false
    ${response}    RequestsLibrary.Get Request    GoogleRest    ${resource}    params=${params}
    ${code}    Set Variable    ${response.status_code}
    #&{response}{status_code}
    log    ${code}
    Run Keyword And Continue On Failure    Should Not Be Equal As Integers    200    ${code}
    Run Keyword And Continue On Failure    Should Be Equal As Integers    400    ${code}

Rest call 200 google
    ${url}    Set Variable    http://maps.googleapis.com
    ${resource}    Set Variable    /maps/api/geocode/json
    ${address}    Set Variable    Gdynia.Poland
    RequestsLibrary.Create Session    GoogleRest    ${url}
    ${params}    Create Dictionary    address=${address}    sensor=false
    ${response}    RequestsLibrary.Get Request    GoogleRest    ${resource}    params=${params}
    ${code}    Set Variable    ${response.status_code}
    #&{response}{status_code}
    Run Keyword And Continue On Failure    Should Be Equal As Integers    200    ${code}
    ${content}    To Json    ${response.content}
    ${status}    Set Variable    &{content}[status]
    log    ${content}
