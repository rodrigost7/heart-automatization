*** Settings ***
Library    Browser

*** Variables ***
${URL_BASE}    http://localhost:5173/

*** Keywords ***
Acessar formulario 
    New Browser        browser=chromium     headless=${False}
    New Context       viewport={'width': 1920, 'height': 1080}

    New Page    ${URL_BASE}
    Wait For Elements State    xpath=//h2    visible     10
    Sleep    1
