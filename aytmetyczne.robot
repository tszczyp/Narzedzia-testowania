*** Settings ***
Library           Collections

*** Test Cases ***
średnia
    [Documentation]    Obliczanie sredniej
    ${wynik}    srednia    1    2    3
    Should Be Equal As Numbers    ${wynik}    2

*** Keywords ***
srednia
    [Arguments]    ${wartosc1}    @{wartosci}
    append to list    ${wartosci}    ${wartosc1}
    ${suma}    sumowanie    @{wartosci}
    ${ilosc_argumentow}    Get Length    ${wartosci}
    ${wynik}    Evaluate    ${suma}/${ilosc_argumentow}
    [Return]    ${wynik}

sumowanie
    [Arguments]    @{wartosci}
    ${suma}    Set Variable    ${0.0}
    :FOR    ${wartosc}    IN    @{wartosci}
    \    ${suma}    Evaluate    ${suma} + ${wartosc}
    [Return]    ${suma}
