*** Settings ***
Documentation    Preencher campos do formulário de diagnostico para prever chance de prever doença cardíaca

Library    Browser
Library    FakerLibrary    locale=pt_BR
Library    ../../../libs/IdadeGenerator.py



Resource    ../formulario_page.resource

*** Keywords ***
Preencher idade
    Wait For Elements State    xpath=//h2    visible    10
    ${idade}=    Gerar Idade    15    90
    Type Text    xpath=//input[@name='age']    ${idade}    delay=0.04

Selecionar sexo
    Select Options By    //select[@name="sex"]    value     F
    Sleep    1

Selecionar tipo de dor no peito
    Select Options By     //select[@name="chestPainType"]    value   ATA
    Sleep    1

Preencher pressao aterial
    ${pressao}    Set Variable    0
    Type Text    xpath=//input[@name='restingBP']    ${pressao}    delay=0.04
    Sleep    0.5

Preencher colesterol
    ${colesterol}    Set Variable    0
    Type Text    xpath=//input[@name='cholesterol']    ${colesterol}    delay=0.04
    Sleep    0.5

Preencher glicemia em jejum
    ${glicemia}    Set Variable    0
    Type Text    xpath=//input[@name='fastingBS']    ${glicemia}    delay=0.04
    Sleep    0.5

Selecionar eletrocardiograma em repouso
    Select Options By    xpath=//select[@name="restingECG"]    value    Normal
    Sleep    1

Preencher frequencia cardiaca
    ${frequencia}    Set Variable    120
    Type Text    xpath=//input[@name='maxHR']    ${frequencia}    delay=0.04
    Sleep     0.5

Selecionar angina induzida por exercício
    Select Options By    xpath=//select[@name="exerciseAngina"]    value    N
    Sleep    1
    
Preencher oldpeak
    ${oldpeak}    Set Variable    1.1
    Type Text    xpath=//input[@name='oldpeak']    ${oldpeak}    delay=0.04
    Sleep     0.5

Selecionar inclinacao do ST
    Select Options By    xpath=//select[@name="stSlope"]    value    Flat
    Sleep    1

Clicar em diagnosticar
    Click    xpath=//button[text()="Diagnosticar"]
    Sleep    1

Validar envio do formulario
    Wait For Elements State    xpath=//h2[text()="Resultado do Diagnóstico"]    visible    10
    Wait For Elements State    xpath=//p[text()="de chance de possuir doença cardíaca."]    visible    10


Preencher campos obrigatorios
    Preencher idade
    Selecionar sexo
    Selecionar tipo de dor no peito
    Preencher pressao aterial
    Preencher colesterol
    Preencher glicemia em jejum
    Selecionar eletrocardiograma em repouso
    Preencher frequencia cardiaca
    Selecionar angina induzida por exercício
    Preencher oldpeak
    Selecionar inclinacao do ST
    