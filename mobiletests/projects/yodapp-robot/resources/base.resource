*** Settings ***
Library    AppiumLibrary
Library    String

*** Variables ***
${START_TEXT}    QAX
${QAX_BUTTON}    //android.widget.Button[@text="${START_TEXT}"]

${OPEN_NAVIGATION_DRAWER}    //android.widget.ImageButton[@content-desc="Open navigation drawer"]

${SIDEBAR_MENU_ITEM}    //*[@resource-id="com.qaxperience.yodapp:id/navView"]//*[@text="REPLACE_ITEM"]
${LOGGIN_SUBMIT_BUTTON}              id=com.qaxperience.yodapp:id/btnSubmit

${LONG_CLICK_BUTTON}    com.qaxperience.yodapp:id/long_click

*** Keywords ***
Start Yodapp Application
    Open Application    http://localhost:4723    
    ...    platformName=Android    
    ...    deviceName=Android Emulator    
    ...    automationName=UIAutomator2    
    ...    app=${EXECDIR}/app/yodapp-beta.apk    
    ...    udid=emulator-5554    
    ...    autoGrantPermissions=true
    ...    disableWindowAnimation=true    
    ...    newCommandTimeout=3600 

I am on the application home screen
    Wait Until Page Contains    ${START_TEXT}    5
    Click Element    xpath=${QAX_BUTTON}

I navigate to "${menu_name}" via sidebar
    Wait Until Element Is Visible    xpath=${OPEN_NAVIGATION_DRAWER}    5
    Click Element    ${OPEN_NAVIGATION_DRAWER}

    ${dynamic_locator}=    Replace String    ${SIDEBAR_MENU_ITEM}    REPLACE_ITEM   ${menu_name}
    Wait Until Element Is Visible    xpath=${dynamic_locator}    timeout=5s
    Click Element    xpath=${dynamic_locator}    

I perform a simple click action
    Wait Until Page Contains    Clique simples    5
    Click Text    Clique simples
    Wait Until Page Contains    Botão clique simples
    Click Text    CLIQUE SIMPLES

I perform a long click action
    Wait Until Page Contains    Clique longo    5
    Click Text    Clique longo
    Wait Until Page Contains    Botão clique longo

    ${locator}    Set Variable    id=${LONG_CLICK_BUTTON}

    ${positions}    Get Element Location    ${locator}   

    Tap With Positions    1000    ${${positions}[x], ${positions}[y]}

I navagate to login screen
    Wait Until Page Contains    Login    5
    Click Text    Login
    Wait Until Page Contains    Olá Padawan, vamos testar o login?    5

I perform a login action without filling in the fields
    Wait Until Element Is Visible    ${LOGGIN_SUBMIT_BUTTON}    5              
    Click Element    ${LOGGIN_SUBMIT_BUTTON}

should see the message "${expected_message}"
    Wait Until Page Contains    ${expected_message}    5

Close Yodapp Application
    Close Application