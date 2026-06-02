*** Settings ***
Library    AppiumLibrary
Library    String

Resource    ../base.resource

*** Keywords ***
I navigate to Lista screen
    Wait Until Page Contains    Lista    5
    Click Text    Lista
    Wait Until Page Contains    Darth Vader    5

I am on the Lista screen
    I am on the application home screen
    I navigate to "Star Wars" via sidebar
    I navigate to Lista screen

I swipe left to delete the character "${character}"
    
    ${element_xpath}=    Set Variable    //*[@text="${character}"]
    Wait Until Element Is Visible    xpath=${element_xpath}    5

    ${element_location}=    Get Element Location    xpath=${element_xpath}/../../..
    ${element_size}=        Get Element Size        xpath=${element_xpath}/../../..

    ${start_x}=    Evaluate    ${element_location['x']} + (${element_size['width']} * 0.9)
    ${end_x}=      Evaluate    ${element_location['x']} + (${element_size['width']} * 0.1)

    ${start_y}=    Evaluate    ${element_location['y']} + (${element_size['height']} * 0.5)

    Swipe    start_x=${start_x}    start_y=${start_y}    end_x=${end_x}    end_y=${start_y}

    Wait Until Element Is Visible    id=com.qaxperience.yodapp:id/btnRemove    5
    Click Element                    id=com.qaxperience.yodapp:id/btnRemove

I should not see "${character}" on the screen
    ${element_xpath}=    Set Variable    //*[@text="${character}"]
    Wait Until Page Does Not Contain    xpath=${element_xpath}    5    