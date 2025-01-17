***Settings***

Library    AppiumLibrary

*** Variables ***
${URL}    http://localhost:4723/wd/hub
${APP_PATH}    ${EXECDIR}/gestores/gestores-hom-0.0.2.apk

***Test Cases***
Deve abrir a tela principal
    Open Application    ${URL}
    ...    platformName=Android
    ...    platformVersion=15
    ...    deviceName=Emulator
    ...    automationName=UIAutomator2
    ...    app=${APP_PATH}
    ...    udid=emulator-5554
    ...    newCommandTimeout=3600
    ...    connectHardwareKeyboard=false

    Wait Until Page Contains    br.com.scrubin.gestores    5
    Wait Until Element Is Visible    //android.widget.ImageView    10s
    Element Should Be Visible    	//android.widget.ImageView    5
    Close Application