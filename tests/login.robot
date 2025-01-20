*** Settings ***

Resource    ../resources/base.robot

Test Setup    Open Session
Test Teardown    Close Application

***Test Cases***
Deve realizar o login com sucesso
    Open Session
    Get Started
    Login    andersonfoliveira@yahoo.com    User@123    
  
    #Meu Perfil
    Wait Until Element Is Visible    //android.view.View[@content-desc="Acessar meu perfil"]    
    Click Element        xpath=//android.view.View[@content-desc="Acessar meu perfil"]
    Wait Until Element Is Visible    //android.view.View[@text="Olá, Pablo!"]    
    Element Text Should Be    //android.view.View[@text="Olá, Pablo!"]    Olá, Pablo! 

Não deve realizar login com e-mail inválido
    Open Session
    Get Started
    Login    teste@teste.com    User@123 
    Validation Message

Não deve realizar login com password inválido   
    Open Session
    Get Started
    Login    andersonfoliveira@yahoo.com    Xpto 
    Validation Message