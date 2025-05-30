*** Settings ***
Documentation    Realizar preenchimento do formulário e diagnosticar resultado de doença cardíaca

Resource    ../Resource/Page/base.resource


*** Test Cases ***
Preencher Formulario e diagnosticar chance de doença
    Acessar formulario
    Preencher campos obrigatorios
    Clicar em diagnosticar
    Validar envio do formulario