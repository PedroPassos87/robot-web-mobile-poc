*** Settings ***
Library    AppiumLibrary
Library    String

*** Variables ***
${RADIO_XPATH}    //android.widget.RadioButton[contains(@text, "REPLACE_ITEM")]

*** Keywords ***
I select radio page
    Wait Until Page Contains    Botões de radio    5
    Click Text    Botões de radio
    Wait Until Page Contains    Escolha sua linguagem preferida    5

I select the radio of "${tech_name}"
    ${dynamic_locator}=    Replace String    ${RADIO_XPATH}    REPLACE_ITEM   ${tech_name}
    Click Element    xpath=${dynamic_locator}



