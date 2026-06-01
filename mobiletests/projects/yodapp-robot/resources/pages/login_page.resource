*** Settings ***
Library    AppiumLibrary
Library    String

*** Variables ***
${EMAIL_FIELD_ID}    com.qaxperience.yodapp:id/etEmail
${PASSWORD_FIELD_ID}    com.qaxperience.yodapp:id/etPassword
${ENTER_BUTTON_ID}    com.qaxperience.yodapp:id/btnSubmit



*** Keywords ***
I type my username ${email}
    Wait Until Page Contains    ${EMAIL_FIELD_ID}
    Input Text    ${EMAIL_FIELD_ID}    ${email}

I type my password ${password}
    Wait Until Page Contains    ${PASSWORD_FIELD_ID}
    Input Text    ${PASSWORD_FIELD_ID}    ${password}

I click the enter button
    Click Element    ${ENTER_BUTTON_ID}


