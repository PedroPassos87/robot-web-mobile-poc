*** Settings ***
Resource    ../resources/base.resource

Test Setup    Start Yodapp Application
Test Teardown    Close Yodapp Application


*** Test Cases ***
Deve realizar um clique simples    
    [Tags]    TC01
    Given I am on the application home screen
    And I navigate to "Clique em Botões" via sidebar
    When I perform a simple click action
    Then should see the message "Isso é um clique simples"

Deve realizar um clique longo    
    [Tags]    TC03
    Given I am on the application home screen
    And I navigate to "Clique em Botões" via sidebar
    When I perform a long click action
    Then should see the message "Isso é um clique longo"


Deve tentar realizar login sem preencher os campos na pagina de formulário
    [Tags]    TC02 
    Given I am on the application home screen
    When I navigate to "Formulários" via sidebar
    And I navagate to login screen
    And I perform a login action without filling in the fields
    Then should see the message "Email válido você deve informar!"
        

*** Comments ***
