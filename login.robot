***Settings***

Library    AppiumLibrary

*** Variables ***
${URL}    http://localhost:4723/wd/hub
${APP_PATH}    ${EXECDIR}/gestores/gestores-hom-0.0.2.apk

***Test Cases***
Deve realizar o login com sucesso
    Open Application    ${URL}
    ...    platformName=Android
    ...    platformVersion=15
    ...    deviceName=Emulator
    ...    automationName=UIAutomator2
    ...    app=${APP_PATH}
    ...    udid=emulator-5554
    ...    newCommandTimeout=3600
    ...    connectHardwareKeyboard=false

    #Tela inicial  
    Wait Until Page Contains    Entrar    5
    Wait Until Element Is Visible    xpath=//android.widget.TextView[@text="Entrar"]    5
    Click Text    Entrar
    
    #Login page
    Wait Until Element Is Visible    xpath=//android.widget.EditText[@text="email@email.com"]    5
    Input Text    xpath=//android.widget.EditText[@text="email@email.com"]    andersonfoliveira@yahoo.com
    Input Text    xpath=//android.widget.EditText[@text="Insira sua senha"]    User@123
    Click Text    Fazer Login    5
    
    #Meu Perfil
    Wait Until Element Is Visible    //android.view.View[@content-desc="Acessar meu perfil"]    7
    Click Element        xpath=//android.view.View[@content-desc="Acessar meu perfil"]
    Wait Until Element Is Visible    //android.view.View[@text="Olá, Pablo!"]    5
    Element Text Should Be    //android.view.View[@text="Olá, Pablo!"]    Olá, Pablo! 
    
    #Fechar app
    Close Application