*** Settings ***
Library           SSHLibrary

*** Test Cases ***
connect
    ${index}    Open Connection    46.101.195.218
    ${output}    Login    studentwsb    lubieStudia@#
    @{items}    List Files In Directory    .
    ${zawartosc}    Execute Command    cat sprawdz_ten_plik
    Should Contain    ${zawartosc}    testowac
