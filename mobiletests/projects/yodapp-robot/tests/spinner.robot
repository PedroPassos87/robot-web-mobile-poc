*** Settings ***
Resource    ../resources/base.resource
Resource    ../resources/pages/spinner_page.resource

Test Setup    Start Yodapp Application
Test Teardown    Close Yodapp Application

*** Test Cases ***
Deve criar um usuario Jedi   
    Given I am on the registration screen
    When I submit the registration form as a "Jedi" with valid data
    And I click the register button
    Then should see the message "Tudo certo, boas vindas ao Yodapp!"

Deve criar um usuario Sith 
    Given I am on the registration screen
    When I submit the registration form as a "Sith" with valid data
    And I click the register button
    Then should see the message "Tudo certo, boas vindas ao Yodapp!"

