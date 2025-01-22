***Settings***

Documentation    Configuração inicial capabilities app
Library    AppiumLibrary
Resource    helpers.robot

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
    Get Started
       
Teardown Actions
    [Documentation]    Realiza ações de teardown, incluindo screenshot e fechamento da aplicação.
    Capture Page Screenshot
    Close Application