*** Settings ***
Documentation    Elementos e ações da tela de tarefas

Library    AppiumLibrary
Library    String

*** Variables ***
${TASK_INPUT_XPATH}    //*[@text="Informe a sua nova tarefa"]
${NEW_TASK_BUTTON_XPATH}    //*[@resource-id="createTask"]
${DELETE_TASK_BUTTON_XPATH}    //*[@text="TASK_NAME"]/../..//*[@resource-id="removeTask"]
${CONFIRM_DELETE}    //*[@resource-id="android:id/button2"]
${UPDATE_TASK_BUTTON_XPATH}    //*[@text="TASK_NAME"]/..
${COMPLETE_TASK_BUTTON_XPATH}    //*[@text="TASK_NAME"]/..//android.widget.ImageView

*** Keywords ***
Create a new task ${task}
    Wait Until Element Is Visible    xpath=${TASK_INPUT_XPATH}    5
    Input Text    xpath=${TASK_INPUT_XPATH}    ${task}
    Click Element    xpath=${NEW_TASK_BUTTON_XPATH}
    
Should've task ${task}
    Wait Until Element Is Visible    xpath=//*[@resource-id="taskText"][@text="${task}"]    5

Delete a task ${task}
    ${dynamic_xpath}=    Replace String    ${DELETE_TASK_BUTTON_XPATH}    TASK_NAME    ${task}
    Click Element    xpath=${dynamic_xpath}
    Wait Until Element Is Visible    xpath=${CONFIRM_DELETE}    5
    Click Element    xpath=${CONFIRM_DELETE}

Shouldn'tve task ${task}
    Wait Until Page Does Not Contain    ${task}

Complete a task ${task}
    ${dynamic_xpath}=    Replace String    ${UPDATE_TASK_BUTTON_XPATH}    TASK_NAME    ${task}
    Click Element    xpath=${dynamic_xpath}

Task ${task} should be completed
    ${dynamic_xpath}=    Replace String    ${COMPLETE_TASK_BUTTON_XPATH}    TASK_NAME    ${task}
    Wait Until Element Is Visible    xpath=${dynamic_xpath}    5

