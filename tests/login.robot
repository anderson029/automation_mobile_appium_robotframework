*** Settings ***

Resource    ../resources/base.robot

Test Setup    Open Session
Test Teardown    Close Application
*** Variables ***
${TEXT_VIEW}    //android.widget.TextView[@text="Login inválido, tente novamente ou recupere sua senha."]

***Test Cases***
Deve realizar o login com sucesso
    Open Session
    Login    andersonfoliveira@yahoo.com    User@123    
    Profile

Não deve realizar login com e-mail inválido
    Open Session
    Login    teste@teste.com    User@123 
 
    Wait Until Element Is Visible    ${TEXT_VIEW} 
    Element Text Should Be    ${TEXT_VIEW}     Login inválido, tente novamente ou recupere sua senha.

Não deve realizar login com password inválido   
    Open Session
    Login    andersonfoliveira@yahoo.com    Xpto 

    Wait Until Element Is Visible    ${TEXT_VIEW} 
    Element Text Should Be    ${TEXT_VIEW}     Login inválido, tente novamente ou recupere sua senha.