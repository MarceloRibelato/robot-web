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
  #Call Method    ${chrome_options}   add_argument    headless
    Call Method    ${chrome_options}   add_argument    --no-sandbox
    Call Method    ${chrome_options}   add_argument    disable-gpu
    Call Method    ${chrome_options}   add_argument    --ignore-certificate-errors
    ${var}=     Call Method     ${chrome_options}    to_capabilities
    Create Webdriver   driver_name=Chrome   alias=google   chrome_options=${chrome_options}
    Go To   ${URL}
    Maximize Browser Window

#### E
Preencho minhas credenciais
    Sleep               10s
    Input Text          ${INPUT_EMAIL}                  ${USER_LOGIN}
    Click Element       ${BTN_AVANÇAR}
    Sleep               10s
    Input Text          ${INPUT_PWD}                    ${USER_SENHA}
    Click Element       ${BTN_AVANÇAR}


Faço as validações dos dados pessoais
    Sleep               2s

#### QUANDO
Envio o formulário
 #   Click Element       ${BTN_LOGIN}
    Sleep               2s

### ENTÃO
Devo visualizar "${NOME_USER}" na tela
    Wait Until Page Contains        ${NOME_USER}

#### TEARDOWN
Fechar Navegador
    Close Browser
