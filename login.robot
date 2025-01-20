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

    #Tela inicial  
    Wait Until Page Contains    Entrar    
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="Entrar"]    
    Click Text    Entrar
    
    #Login page
    Wait Until Element Is Visible    xpath=//android.widget.EditText[@text="email@email.com"]    
    Input Text    xpath=//android.widget.EditText[@text="email@email.com"]    andersonfoliveira@yahoo.com
    Input Text    xpath=//android.widget.EditText[@text="Insira sua senha"]    User@123
    Click Text    Fazer Login    
    
    #Meu Perfil
    Wait Until Element Is Visible    //android.view.View[@content-desc="Acessar meu perfil"]    
    Click Element        xpath=//android.view.View[@content-desc="Acessar meu perfil"]
    Wait Until Element Is Visible    //android.view.View[@text="Olá, Pablo!"]    
    Element Text Should Be    //android.view.View[@text="Olá, Pablo!"]    Olá, Pablo! 

Não deve realizar login com e-mail inválido
    Open Session

    #Tela inicial  
    Wait Until Page Contains    Entrar    
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="Entrar"]    
    Click Text    Entrar
    
    #Login page
    Wait Until Element Is Visible    xpath=//android.widget.EditText[@text="email@email.com"]    
    Input Text    xpath=//android.widget.EditText[@text="email@email.com"]    teste@tst.com
    Input Text    xpath=//android.widget.EditText[@text="Insira sua senha"]    User@123
    Click Text    Fazer Login  

    ##VALIDAR A MENSAGEM DE ERRO DA APLICAÇÃO


*** Keywords ***
Open Session
    Set Appium Timeout    5
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