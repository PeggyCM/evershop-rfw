*** Settings ***
Resource    ../keywords/login_keywords.robot
Resource    ../../ressources/variables.robot
Resource    ../../ressources/constantes.robot
Resource    ../../ressources/librairies.robot   

*** Keywords ***
initialiser l'environnement
    Open Browser    ${url_login}    ${navigateur}
    login with    ${email}    ${password}
    Wait Until Page Contains    Dashboard
    Maximize Browser Window

clore environnement
    Close Browser

login with
    [Arguments]    ${email}    ${password}
    Go To   ${url_login}
    Input Text   name=email  ${email}
    Input Text   name=password  ${password}
    Click Button    css:.button.primary