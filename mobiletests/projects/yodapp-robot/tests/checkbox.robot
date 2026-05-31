*** Settings ***
Resource    ../resources/base.resource
Resource    ../resources/pages/checkbox_page.resource

Test Setup    Start Yodapp Application
Test Teardown    Close Yodapp Application

*** Variables ***
@{techs}    Ruby    Python    Java    Javascript    C#    Robot Framework

*** Test Cases ***
Deve marcar as techs que usam appium   
    Given I am on the application home screen
    And I navigate to "Check e Radio" via sidebar
    When I select checkbox page

    FOR    ${tech}    IN    @{techs}
        Then I check the box of "${tech}"    
    END
    

    