*** Settings ***
Documentation    suite de teste de login
Resource    ../Resources/login.resource

Suite Setup    Create Session    login     https://dummyjson.com

*** Test Cases ***
Realizar login com usuario e senha com sucesso
    ${RESPOSTA}=   Realizar login    hbingley1    CQutx25i8r
    Status Should Be   200   ${RESPOSTA}
    ${DATA}    Set Variable    ${RESPOSTA.json()}
    Should Be Equal As Strings    ${DATA['username']}    hbingley1
    Dictionary Should Contain Key    ${DATA}    token 

Realizar falha de login com usuario e senha invalida 
    ${RESPOSTA}=    Realizar login    hbingley1    12345abcde 
    Status Should Be    400    ${RESPOSTA}
    ${DATA}    Set Variable    ${RESPOSTA.json()}
    Should Be Equal As Strings    ${DATA['message']}    Invalid credentials 

