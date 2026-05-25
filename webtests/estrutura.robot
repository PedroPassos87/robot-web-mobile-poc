*** Settings ***
Library    SeleniumLibrary
Library    String
Test Setup
Test Teardown
Test Tags
Documentation

*** Variables ***
${variavel}    valor1
${variavel2}    teste2
${variavel3}    carro

@{lista1}    teste1    teste2    teste3

&{dicionario}
...    chave=valor
...    chave2=valor2

&{pessoa}
...    nome=pedro
...    idade=23
...    cpf=12345677
...    veiculo= ${variavel3}

*** Keywords ***
minha keyword
    Open Browser
    
acessar site
    Open Browser    browser=firefox    url=https://demoqa.com/automation-practice-form

preencher nome no campo firstname
    Input Text    locator=firstName    text=Pedro

preencher sobrenome no campo lastname
    Input Text    locator=lastName    text=Passos

    
*** Test Cases ***
meu test case
    acessar site
    preencher nome no campo firstname
    preencher sobrenome no campo lastname
    Close Browser

