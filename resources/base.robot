***Settings***

Library    AppiumLibrary
*** Variables ***
${INPUT}    Entrar
${LOGIN}    Fazer Login 
${INPUT_EMAIL}    xpath=//android.widget.EditText[@text="email@email.com"]
${INPUT_PASSWORD}    xpath=//android.widget.EditText[@text="Insira sua senha"]
${MY_PROFILE}    //android.view.View[@content-desc="Acessar meu perfil"]
${USER_NAME}    //android.view.View[@text="Olá, Pablo!"]   

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
    Wait Until Element Is Visible    ${USER_NAME}    
    Element Text Should Be    ${USER_NAME}    Olá, Pablo! 