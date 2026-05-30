*** Settings ***
Library    AppiumLibrary

*** Variables ***

*** Keywords ***

*** Test Cases ***
Deve abrir a tela principal
    
    Open Application    http://localhost:4723    
    ...    platformName=Android    
    ...    deviceName=Android Emulator    
    ...    automationName=UIAutomator2    
    ...    app=${EXECDIR}/app/yodapp-beta.apk    
    ...    udid=emulator-5554    
    ...    autoGrantPermissions=true
    ...    disableWindowAnimation=true    
    ...    newCommandTimeout=3600    

    Wait Until Page Contains    text=Yodapp
    Wait Until Page Contains    text=Mobile Training
    Wait Until Page Contains    text=by Papito

    Close Application
    

*** Comments ***
"platformName": "Android",
  "appium:deviceName": "Android Emulator",
  "appium:automationName": "UIAutomator2",
  "appium:app": "D:\\Projetos\\Robot\\mobiletests\\projects\\yodapp\\app\\yodapp-beta.apk",
  "appium:udid": "emulator-5554",
  "appium:autoGrantPermissions": true,