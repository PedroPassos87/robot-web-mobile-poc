*** Settings ***
Documentation    Elementos e ações da tela de login

Library    AppiumLibrary
Variables    ../../env_vars.py

*** Variables ***
${IP_INPUT_XPATH}         xpath=//android.widget.EditText[@resource-id="apiIp"]
${SIGNIN_BUTTON_XPATH}    xpath=//android.view.ViewGroup[@resource-id="signInButton"]

*** Keywords ***
Do login    
    Input Text       ${IP_INPUT_XPATH}         ${API_IP}    
    Click Element    ${SIGNIN_BUTTON_XPATH} 

