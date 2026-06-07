*** Settings ***
Documentation    Suite de testes do cadastro de tarefas

Resource    ../resources/base.resource

Test Setup    Start session
Test Teardown    Finish session

*** Test Cases ***
Deve poder cadastrar uma nova tarefa
    [Tags]    create

    ${task}    Set Variable    Estudar Robot
    Remove task from database    ${task}

    Do login
    Create a new task ${task}
    Should've task ${task}

Deve poder remover uma tarefa existente
    [Tags]    delete

    ${task}    Set Variable    Verificar emails
    Remove task from database    ${task}

    Do login
    Create a new task ${task}
    Should've task ${task}

    Delete a task ${task}
    Shouldn'tve task ${task}

Deve poder concluir uma tarefa existente
    [Tags]    update
    
    ${task}    Set Variable    Enviar documentação
    Remove task from database    ${task}

    Do login
    Create a new task ${task}
    Should've task ${task}

    Complete a task ${task}
    Task ${task} should be completed

    
    