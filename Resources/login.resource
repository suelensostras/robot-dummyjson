*** Settings ***
Documentation    Este arquivo contera recursos para realizar o procedimento de login
Library    RequestsLibrary
Library    Collections

*** Keywords ***
Realizar login
    [Documentation]    Conectar na api do endpoint de login e realizar o acesso
    [Arguments]    ${username}    ${password}
    ${Body}=    Create Dictionary    username=${username}    password=${password}  
    ${RESPOSTA}=    POST On Session    login    /auth/login    json=${Body}    expected_status=anything
    [Return]    ${RESPOSTA}