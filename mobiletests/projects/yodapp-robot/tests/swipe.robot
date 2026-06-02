*** Settings ***
Resource    ../resources/base.resource
Resource    ../resources/pages/swipe_page.resource

Test Setup    Start Yodapp Application
Test Teardown    Close Yodapp Application

*** Test Cases ***
Deve poder remover o Darth Vader
    Given I am on the Lista screen
    When I swipe left to delete the character "Darth Vader"
    Then I should not see "Darth Vader" on the screen

Deve poder remover a Princesa Leia
    Given I am on the Lista screen
    When I swipe left to delete the character "Princesa Leia"
    Then I should not see "Princesa Leia" on the screen    
    
