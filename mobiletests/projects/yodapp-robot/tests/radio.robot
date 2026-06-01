*** Settings ***
Resource    ../resources/base.resource
Resource    ../resources/pages/radio_page.resource

Test Setup    Start Yodapp Application
Test Teardown    Close Yodapp Application

*** Test Cases ***
Deve marcar as techs que usam appium   
    Given I am on the application home screen
    And I navigate to "Check e Radio" via sidebar
    When I select radio page
    Then I select the radio of "Python"    
    

    