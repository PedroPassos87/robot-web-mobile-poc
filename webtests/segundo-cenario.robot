*** Settings ***
Library    SeleniumLibrary
Test Tags    grupoNovo


*** Variables ***

*** Keywords ***
Abrir navegador e acessar site
    Set Selenium Speed    value=0.5
    Open Browser    browser=edge    url=https://practicetestautomation.com/practice-test-login/
    
Preencher campo de usuario
    Input Text    locator=username    text=student

Preencher campo de senha
    Input Text    locator=password    text=Password123

Clicar no botão de submit
    Click Element    locator=submit

Verificar redirecionamento após inserir dados
    Location Should Be    url=https://practicetestautomation.com/logged-in-successfully/

Verificar mensagem "Logged in successfully"
    Element Text Should Be    xpath=//h1[@class='post-title']    Logged In Successfully

Inserir username inválido
    Input Text    locator=username    text=estudante

Inserir senha inválida
    Input Text    locator=password    text=senhainvalida

Verificar mensagem de usuario invalido
    Element Should Be Visible    locator=error    message=Your username is invalid!

Verificar mensagem de senha invalida
    Element Should Be Visible    locator=error    message=Your password is invalid!

*** Test Cases ***
TC01 - Efetuar login com sucesso
    Abrir navegador e acessar site
    Preencher campo de usuario
    Preencher campo de senha
    Clicar no botão de submit
    Verificar redirecionamento após inserir dados
    Verificar mensagem "Logged in successfully"
    Close Browser

TC02 - Efetuar login com credenciais inválidas
    Abrir navegador e acessar site
    Inserir username inválido
    Preencher campo de senha
    Clicar no botão de submit
    Verificar mensagem de usuario invalido
    Abrir navegador e acessar site
    Preencher campo de usuario
    Inserir senha inválida
    Clicar no botão de submit
    Verificar mensagem de senha invalida
    Close All Browsers


