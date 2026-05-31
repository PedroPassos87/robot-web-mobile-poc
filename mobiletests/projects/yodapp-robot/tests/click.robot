*** Settings ***
Library    AppiumLibrary

*** Variables ***
${START}    QAX

${QAX_BUTTON}    //android.widget.Button[@text="${START}"]
${OPEN_NAVIGATION_DRAWER}    //android.widget.ImageButton[@content-desc="Open navigation drawer"]
${SIDEBAR_CLIQUE_EM_BOTOES}    //*[@resource-id="com.qaxperience.yodapp:id/navView"]//*[@text="Clique em Botões"]
${SIDEBAR_FORMULARIO}    //*[@resource-id="com.qaxperience.yodapp:id/navView"]//*[@text="Formulários"]

*** Keywords ***

*** Test Cases ***
Deve acessar o app e selecionar na sidebar a página "Clique em Botões"
    
    Open Application    http://localhost:4723    
    ...    platformName=Android    
    ...    deviceName=Android Emulator    
    ...    automationName=UIAutomator2    
    ...    app=${EXECDIR}/app/yodapp-beta.apk    
    ...    udid=emulator-5554    
    ...    autoGrantPermissions=true
    ...    disableWindowAnimation=true    
    ...    newCommandTimeout=3600    

    Wait Until Page Contains    ${START}    5
    
    Click Element    xpath=${QAX_BUTTON}
    
    Wait Until Element Is Visible    xpath=${OPEN_NAVIGATION_DRAWER}    5
    
    Click Element    ${OPEN_NAVIGATION_DRAWER}

    Wait Until Element Is Visible    xpath=${SIDEBAR_CLIQUE_EM_BOTOES}    5

    Click Element    ${SIDEBAR_CLIQUE_EM_BOTOES}

    Wait Until Page Contains    Clique simples    5
    Click Text    Clique simples
    Wait Until Page Contains    Botão clique simples

    Close Application

Deve acessar o app e selecionar na sidebar a página "Formulários"
    
    Open Application    http://localhost:4723    
    ...    platformName=Android    
    ...    deviceName=Android Emulator    
    ...    automationName=UIAutomator2    
    ...    app=${EXECDIR}/app/yodapp-beta.apk    
    ...    udid=emulator-5554    
    ...    autoGrantPermissions=true
    ...    disableWindowAnimation=true    
    ...    newCommandTimeout=3600    

    Wait Until Page Contains    ${START}    5
    
    Click Element    xpath=${QAX_BUTTON}
    
    Wait Until Element Is Visible    xpath=${OPEN_NAVIGATION_DRAWER}    5
    
    Click Element    ${OPEN_NAVIGATION_DRAWER}

    Wait Until Element Is Visible    xpath=${SIDEBAR_FORMULARIO}    5

    Click Element    ${SIDEBAR_FORMULARIO}

    Wait Until Page Contains    Login    5
    Click Text    Login
    Wait Until Page Contains    Olá Padawan, vamos testar o login?

    Close Application
    

*** Comments ***
