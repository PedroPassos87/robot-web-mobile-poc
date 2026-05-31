*** Settings ***
Library    AppiumLibrary
Library    String

*** Variables ***
${CHECKBOX_XPATH}    //android.widget.CheckBox[contains(@text, "REPLACE_ITEM")]
*** Keywords ***
I select checkbox page
    Wait Until Page Contains    Checkbox    5
    Click Text    Checkbox
    Wait Until Page Contains    Marque as techs que usam Appium    5

I check the box of "${tech_name}"
    ${dynamic_locator}=    Replace String    ${CHECKBOX_XPATH}    REPLACE_ITEM   ${tech_name}
    Click Element    xpath=${dynamic_locator}



