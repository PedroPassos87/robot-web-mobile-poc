*** Settings ***
Documentation    Tudo deve começar nesse arquivo

Library    AppiumLibrary
Library    libs/mongo.py

Resource    screens/login.resource
Resource    screens/task.resource


*** Variables ***
${IP_INPUT_XPATH}         xpath=//android.widget.EditText[@resource-id="apiIp"]

*** Keywords ***
Start session
    Open Application    http://localhost:4723
    ...    automationName=uiautomator2
    ...    platformName=Android    
    ...    deviceName=Emulator
    ...    udid=emulator-5554
    ...    autoGrantPermissions=${True}
    ...    app=${EXECDIR}/apps/markx.apk
  
    ${warning_btn}=    Run Keyword And Return Status    Wait Until Page Contains    Don't Show Again    timeout=3s
    Run Keyword If    ${warning_btn}    Click Text    Don't Show Again

    Wait Until Element Is Visible    ${IP_INPUT_XPATH}    timeout=5s

Finish session
    Capture Page Screenshot
    Close Application