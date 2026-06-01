*** Settings ***
Resource    ../resources/base.resource
Resource    ../resources/pages/login_page.resource

Test Setup    Start Yodapp Application
    
Test Teardown    Close Yodapp Application

*** Variables ***
${email}    yoda@qax.com
${password}    jedi

*** Test Cases ***
Deve logar com sucesso
    I am on the application home screen
    I navigate to "Formulários" via sidebar
    I navagate to login screen
    I type my username ${email}
    I type my password ${password}
    I click the enter button
    should see the message "Boas vindas, logado você está."
    
Não deve logar com senha incorreta
    I am on the application home screen
    I navigate to "Formulários" via sidebar
    I navagate to login screen
    I type my username ${email}
    I type my password "ahdasdasgd"
    I click the enter button
    should see the message "Oops! Credenciais incorretas."
    
