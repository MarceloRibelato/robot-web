*** Settings ***
Resource        ../steps/LoginSteps.robot
Resource        ../resources/BDDpt-br.robot
Test Teardown   Fechar Navegador

*** Test Cases ***
Cenário 01: Login
    Dado que estou na página de login do site Caduh
    E preencho minhas credenciais
    Quando envio o formulário
    E faço as validações dos dados pessoais
    Então devo visualizar "Dione kele" na tela



