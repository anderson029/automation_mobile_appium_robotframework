***Settings***

Library    AppiumLibrary

#Abre a seção antes de cada teste
Test Setup    Open Session

#Fecha o app após cada teste
Test Teardown    Close Application

*** Variables ***
${URL}    http://localhost:4723/wd/hub
  
***Test Cases***
Deve realizar o login com sucesso
    #Carrega config do app 
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

*** Keywords ***
Open Session
    Set Appium Timeout    10
    Open Application    ${URL}
    ...    platformName=Android
    ...    platformVersion=15
    ...    deviceName=Emulator
    ...    automationName=UIAutomator2
    ...    app=${EXECDIR}/gestores/gestores-hom-0.0.2.apk
    ...    udid=emulator-5554
    ...    newCommandTimeout=3600
    ...    connectHardwareKeyboard=false
         
Close Session
    Close Application

Get Started
    Wait Until Page Contains    Entrar    
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="Entrar"]    
    Click Text    Entrar  

Login
    [Arguments]    ${email}    ${senha}
    Wait Until Element Is Visible    xpath=//android.widget.EditText[@text="email@email.com"]
    Input Text    xpath=//android.widget.EditText[@text="email@email.com"]    ${email}
    Input Text    xpath=//android.widget.EditText[@text="Insira sua senha"]    ${senha}
    Click Text    Fazer Login


Validation Message
    Wait Until Element Is Visible    //android.widget.TextView[@text="Login inválido, tente novamente ou recupere sua senha."]
    Element Text Should Be    //android.widget.TextView[@text="Login inválido, tente novamente ou recupere sua senha."]    Login inválido, tente novamente ou recupere sua senha.