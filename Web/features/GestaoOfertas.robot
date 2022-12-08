*** Settings ***
Resource       ../steps/GestaoOfertasSteps.robot
Resource       ../resources/BDDpt-br.robot
Test Teardown  Fechar Navegador

*** Test Cases ***

Cenário 01: Após logar com credenciais válidas, devo validar se estou na página home
    [Tags]    ct-001

    Dado que estou na página de login
    Quando envio minhas credenciais
    Então devo ser direcionado a página Home de Gestão de Ofertas

Cenário 02: Após logar com credenciais válidas, devo pesquisar as ofertas disponíveis
    [Tags]    ct-002

    Dado que estou na página de login
    Quando envio minhas credenciais
    Então devo pesquisar se há ofertas disponíveis

Cenário 03: Após logar com credenciais válidas, devo pesquisar ofertas disponíveis para a área de Arquitetura e Urbanismo
    [Tags]    ct-003

    Dado que estou na página de login
    Quando envio minhas credenciais
    Então devo pesquisar se há ofertas disponíveis para a área de arquitetura e urbanismo
