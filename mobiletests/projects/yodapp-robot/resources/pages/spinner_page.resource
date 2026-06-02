*** Settings ***
Library    AppiumLibrary
Library    String

Resource    ../base.resource

*** Variables ***
${SPINNER_ID}    com.qaxperience.yodapp:id/spinnerJob
${NAME_FIELD_ID}    com.qaxperience.yodapp:id/etUsername
${EMAIL_FIELD_ID}    com.qaxperience.yodapp:id/etEmail
${PASSWORD_FIELD_ID}    com.qaxperience.yodapp:id/etPassword
${SPINNER_LISTVIEW_XPATH}    //android.widget.ListView
${REGISTER_BUTTON_ID}    com.qaxperience.yodapp:id/btnSubmit

*** Keywords ***
I navigate to register screen
    Wait Until Page Contains    Cadastro    5
    Click Text    Cadastro
    Wait Until Page Contains    Crie sua conta.    5

I type my name ${name}
    Wait Until Page Contains    ${NAME_FIELD_ID}
    Input Text    ${NAME_FIELD_ID}    ${name}

I type my email ${email}
    Wait Until Page Contains    ${EMAIL_FIELD_ID}
    Input Text    ${EMAIL_FIELD_ID}    ${email}

I type my password ${password}
    Wait Until Page Contains    ${PASSWORD_FIELD_ID}
    Input Text    ${PASSWORD_FIELD_ID}    ${password}

I select my level "${level}" on spinner
    Click Element    ${SPINNER_ID}
    Wait Until Element Is Visible    xpath=${SPINNER_LISTVIEW_XPATH}
    Click Text    ${level}

I submit the registration form as a "${level}" with valid data
    I type my name name
    I type my email email@email.com
    I type my password senha123
    I select my level "${level}" on spinner
    
    
I click the register button
    Click Element    ${REGISTER_BUTTON_ID}

I am on the registration screen
    I am on the application home screen
    I navigate to "Formulários" via sidebar
    I navigate to register screen