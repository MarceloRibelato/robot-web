*** Settings ***
Library     SeleniumLibrary   timeout=20s  run_on_failure=Capture Page Screenshot
Library    Screenshot
Resource    ../pages/PageGestaoOfertas.robot
Resource    ../resources/Config.robot

*** Keywords ***
#### DADO
que estou na página de login
       Set Selenium Timeout    20s
    ${chrome options} =     Evaluate    selenium.webdriver.ChromeOptions()
    ...                     modules=selenium, selenium.webdriver
    Call Method    ${chrome_options}   add_argument    headless
    Call Method    ${chrome_options}   add_argument    --no-sandbox
    Call Method    ${chrome_options}   add_argument    disable-gpu
    Call Method    ${chrome_options}   add_argument    --ignore-certificate-errors
    ${var}=     Call Method     ${chrome_options}    to_capabilities
    Create Webdriver   driver_name=Chrome   alias=google   chrome_options=${chrome_options}
    Go To   ${URL}
    Maximize Browser Window

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
    Wait Until Page Contains Element    ${BTN_CONHECIMENTO}
    Click Element    ${BTN_CONHECIMENTO}
    Wait Until Element Is Visible    ${SELECT_ARQUITETURA}  timeout=50
    Click Element    ${SELECT_ARQUITETURA}
    Click Element    ${BTN_BUSCAR_OFERTAS}


#### QUANDO
Envio minhas credenciais
    Input Text       ${CAMPO_EMAIL}     ${USER_EMAIL}   timeout=40
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
