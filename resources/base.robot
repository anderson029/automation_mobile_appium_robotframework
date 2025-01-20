***Settings***

Library    AppiumLibrary

*** Keywords ***
Open Session
    Set Appium Timeout    15
    Open Application    http://localhost:4723/wd/hub
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