*** Settings ***
Library    SeleniumLibrary
Test Tags    SetandoNomes

Test Setup    Abrir navegador e acessar o site
Suite Setup

Test Teardown    Close Browser
Suite Teardown

*** Variables ***
#Configuração
${BROWSER}    firefox
${URL}    https://demoqa.com/automation-practice-form
${SELENIUM_SPEED}    0.5

#Locators
${INPUT_FIRST_NAME}    firstName
${INPUT_LAST_NAME}    lastName
${INPUT_EMAIL}    userEmail
${INPUT_PHONE_NUMBER}    userNumber
${INPUT_GENDER_MALE}    //input[@id="gender-radio-1"]

#Dados de teste
${NOME}    pedro   
${SOBRENOME}    passos
${EMAIL}    teste@gmail.com
${NUMERO}    426868273


*** Keywords ***
Abrir navegador e acessar o site
    Set Selenium Speed    value=${SELENIUM_SPEED}
    Open Browser    browser=${BROWSER}    url=${URL}

Escrever o nome ${nome}
    Input Text    locator=${INPUT_FIRST_NAME}    text=${nome}

Escrever sobrenome
    Input Text    locator=${INPUT_LAST_NAME}    text=${SOBRENOME}

Escrever email
    [Arguments]    ${email}
    Input Text    locator=${INPUT_EMAIL}   text=${email}

Escrever telefone
    [Arguments]    ${telefone}
    Input Text    locator=${INPUT_PHONE_NUMBER}   text=${telefone}

Selecionar o genero ${genero}
    Click Element    locator=//input[@id="gender-radio-${genero}"]

*** Test Cases ***
TC01 - Preencher nome e sobrenome
    [Tags]    TC01    grupo1
    Escrever o nome Pedro
    Escrever sobrenome

TC02 - Preencher nome, sobrenome e email
    [Tags]    TC02    grupo1
    Escrever o nome Eugenia
    Escrever sobrenome
    Escrever email    email=teste@teste.com

TC03 - Preencher nome, sobrenome, email e telefone
    [Tags]    TC03    grupo2
    Escrever o nome Bilbo
    Escrever sobrenome
    Escrever email    email=teste@teste.com
    Escrever telefone    telefone=338838382

TC04 - Clicar no genero masculino
    [Tags]    TC04    grupo2
    Selecionar o genero 1

*** Comments ***