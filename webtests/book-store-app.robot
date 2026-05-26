*** Settings ***
Library    SeleniumLibrary
Resource    PTBT-gherkin.robot

Test Setup    abro o navegador e acesso o site
Test Teardown    Close Browser


*** Variables ***
${BROWSER}    edge
${LOGIN_URL}    https://demoqa.com/login
${PROFILE_URL}    https://demoqa.com/profile
${SELENIUM_SPEED}    0.5
   

${INPUT_USERNAME}    //input[@id="userName"]
${INPUT_PASSWORD}    //input[@id="password"]
${LOGIN_BUTTON}    //button[@id="login"]
${INVALID_CREDENTIALS_MESSAGE}    //p[contains(text(),"Invalid username or password!")]

${USERNAME}    robotKickoff
${VALID_PASSWORD}    @Robot123
${INVALID_PASSWORD}    @Robot


*** Keywords ***
abro o navegador e acesso o site
    Set Selenium Speed    value=${SELENIUM_SPEED}
    Open Browser    browser=${BROWSER}    url=${LOGIN_URL}

digito meu nome de usuario ${username}
    Wait Until Element Is Visible    ${INPUT_USERNAME}    10s
    Input Text    locator=${INPUT_USERNAME}    text=${username}

digito a senha ${password}
    Input Text    locator=${INPUT_PASSWORD}    text=${password}

clico em logar
    Click Element    locator=${LOGIN_BUTTON}

uma mensagem de erro é exibida
    Wait Until Element Is Visible    locator=${INVALID_CREDENTIALS_MESSAGE}    timeout=5s

acesso a página do meu perfil
    Wait Until Location Is    ${PROFILE_URL}    10s

*** Test Cases ***
TC01 - Realizar login inválido
    [Tags]    TC01    login
    Dado que     digito meu nome de usuario ${USERNAME}
    E     digito a senha ${INVALID_PASSWORD}
    Quando    clico em logar
    Então    uma mensagem de erro é exibida 

TC02 - Realizar login válido
    [Tags]    TC02    login
    Dado que     digito meu nome de usuario ${USERNAME}
    E     digito a senha ${VALID_PASSWORD}
    Quando    clico em logar
    Então    acesso a página do meu perfil