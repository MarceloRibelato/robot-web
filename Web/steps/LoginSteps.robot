*** Settings ***
Library         SeleniumLibrary
Resource        ../pages/LoginPage.robot
Resource        ../resources/Config.robot

*** Keywords ***
#### DADO
Que estou na página de login do site Caduh
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
    Wait Until Element Is Visible   ${CABEÇALHO}
    Title Should Be                 ${TITLE}

#### E
Preencho minhas credenciais
    Input Text          ${CAMPO_CODIGO}                  ${USER_CODIGO}
    Input Text          ${CAMPO_SUBCODIGO}               ${USER_SUBCODIGO}
    Input Text          ${CAMPO_LOGIN1}                  ${USER_LOGIN1}
    Input Text          ${CAMPO_LOGIN2}                  ${USER_LOGIN2}
    Input Text          ${CAMPO_SENHA}                   ${USER_SENHA}

Faço as validações dos dados pessoais

    ${CampoEmail}=      Run Keyword And Return Status    Input Text       ${CAMPO_EMAIL}       ${USER_EMAIL}
    ${CampoCpfInicio}=  Run Keyword And Return Status    Input Text       ${CAMPO_CPF_INICIO}  ${CPF_INICIO}
    ${CampoCpfFim}=     Run Keyword And Return Status    Press Keys       ${CAMPO_CPF_FINAL}   ARROW_LEFT${CPF_FINAL}
    Run Keyword If      ${CampoEmail}                    Click Element    ${BTN_VALIDAR}
    ...  ELSE IF        ${CampoCpfInicio}                Click Element    ${BTN_VALIDAR}
    ...  ELSE IF        ${CampoCpfFim}                   Click Element    ${BTN_VALIDAR}
    Sleep               2s

#### QUANDO
Envio o formulário
    Click Element       ${BTN_LOGIN}
    Sleep               2s

### ENTÃO
Devo visualizar "${NOME_USER}" na tela
    Wait Until Page Contains        ${NOME_USER}

#### TEARDOWN
Fechar Navegador
    Close Browser
