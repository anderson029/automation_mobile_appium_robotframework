*** Settings ***

Resource    ../resources/base.robot

Test Setup    Open Session
Test Teardown    Close Application
*** Variables ***
${TEXT_VIEW}    //android.widget.TextView[@text="Login inválido, tente novamente ou recupere sua senha."]
${USER_NAME}    //android.view.View[@text="Olá, Pablo!"] 

***Test Cases***
Deve realizar o login com sucesso
    [Tags]    smoke
    Open Session
    Login    andersonfoliveira@yahoo.com    User@123    
    Profile

    Wait Until Element Is Visible    ${USER_NAME}    
    Element Text Should Be    ${USER_NAME}    Olá, Pablo! 

Não deve realizar login com e-mail inválido
    [Tags]    negative    
    Open Session
    Login    teste@teste.com    User@123 
 
    Wait Until Element Is Visible    ${TEXT_VIEW} 
    Element Text Should Be    ${TEXT_VIEW}     Login inválido, tente novamente ou recupere sua senha.
    
    #ideal para fazer swipe independente da resolução da tela 
    # Documentaion (https://serhatbolsu.github.io/robotframework-appiumlibrary/AppiumLibrary.html#Swipe%20By%20Percent) 
    Swipe By Percent    start_x=48.51    start_y=98.50    end_x=49.25    end_y=48.07
    Sleep    5

Não deve realizar login com password inválido   
    [Tags]    negative    
    Open Session
    Login    andersonfoliveira@yahoo.com    Xpto 
  
    Wait Until Element Is Visible    ${TEXT_VIEW} 
    Element Text Should Be    ${TEXT_VIEW}     Login inválido, tente novamente ou recupere sua senha.