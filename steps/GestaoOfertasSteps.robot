*** Settings ***
Library     SeleniumLibrary   timeout=10s  run_on_failure=Capture Page Screenshot
Resource    ../pages/PageGestaoOfertas.robot
Resource    ../resources/Config.robot

*** Keywords ***
#### DADO
que estou na página de login
    Open Browser    ${URL}    ${BROWSER}  options=${CHROME_OPTIONS_WARNINGS}
    Maximize Browser Window
    Sleep    3
    Title Should Be    ${TITLE}

#### E

### ENTÃO
devo ser direcionado a página Home de Gestão de Ofertas
    Title Should Be    ${TITLE_ANIMA}
    Page Should Contain Element    ${TOOLBAR_HOME}

Devo pesquisar se há ofertas disponíveis
    Wait Until Page Contains Element    ${BTN_BUSCAR_OFERTAS}
    Click Element    ${BTN_BUSCAR_OFERTAS}
    Sleep    3

Devo pesquisar se há ofertas disponíveis para a área de arquitetura e urbanismo
#    Wait For Condition   return document.readyState == "complete"
    Wait Until Page Contains Element    ${BTN_CONHECIMENTO}
    Click Element    ${BTN_CONHECIMENTO}
    Wait Until Element Is Visible    ${SELECT_ARQUITETURA}  timeout=50
    Click Element    ${SELECT_ARQUITETURA}
#    Press Keys        None    ESC
#    Wait Until Element Is Visible    ${BTN_MARCA}           timeout=50
#    Click Element    ${BTN_MARCA}
#    Wait Until Element Is Visible    ${SELECT_UNIBH}     timeout=50
#    Click Element    ${SELECT_UNIBH}
    Click Element    ${BTN_BUSCAR_OFERTAS}


#### QUANDO
Envio minhas credenciais
    Input Text       ${CAMPO_EMAIL}     ${USER_EMAIL}
    Click Element    ${BTN_AVANCAR}
    Wait Until Element Is Visible    ${CAMPO_SENHA}
    Input Text       ${CAMPO_SENHA}     ${USER_SENHA}
    Click Element    ${BTN_ENTRAR}
    Click Element    ${BTN_CONECTAR}
    Sleep    2

#### TEARDOWN
Fechar Navegador
    Run Keyword If Test Failed  Capture Page Screenshot
    Close Browser
