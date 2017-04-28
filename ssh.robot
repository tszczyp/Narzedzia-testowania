*** Settings ***
Library           SSHLibrary
Library           Collections
Library           C:/Python27/Lib/site-packages/RequestsLibrary/RequestsKeywords.py

*** Test Cases ***
connect
    ${index}    Open Connection    46.101.195.218
    ${output}    Login    studentwsb    lubieStudia@#
    @{items}    List Files In Directory    .
    ${zawartosc}    Execute Command    cat sprawdz_ten_plik
    Should Contain    ${zawartosc}    testowac

Check content
    ${index}    Open Connection    46.101.195.218
    ${output}    Login    studentwsb    lubieStudia@#
    @{items}    List Directory    /
    @{items}    List Directories In Directory    /home/
    @{items}    List Files In Directory    /home/studentwsb
    ${zawartosc}    Execute Command    cat sprawdz_ten_plik

request
    Create Session    polaczenie    http://wsb4it.getsandbox.com/users
