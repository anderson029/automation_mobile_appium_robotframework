*** Settings ***

Documentation    Aqui teremos as KWS helpers
Library    AppiumLibrary
*** Variables ***
${INPUT}    Entrar
${LOGIN}    Fazer Login 
${INPUT_EMAIL}    xpath=//android.widget.EditText[@text="email@email.com"]
${INPUT_PASSWORD}    xpath=//android.widget.EditText[@text="Insira sua senha"]
${MY_PROFILE}    //android.view.View[@content-desc="Acessar meu perfil"] 

*** Keywords ***
Get Started
    Wait Until Page Contains    ${INPUT}    
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="Entrar"]    
    Click Text    ${INPUT}  

Login
    [Arguments]    ${email}    ${senha}
    Wait Until Element Is Visible    ${INPUT_EMAIL}   
    Input Text    ${INPUT_EMAIL}    ${email}
    Input Text    ${INPUT_PASSWORD}        ${senha}
    Click Text    ${LOGIN} 

Profile
    Wait Until Element Is Visible    ${MY_PROFILE}    
    Click Element        ${MY_PROFILE}