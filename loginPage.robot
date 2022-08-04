*** Settings ***
Resource         resource.robot
Test Setup       Preparar teste
Test Teardown    Finalizar teste

#robot -d /home/eduardo/Documentos/robotOutputFolder loginPage.robot

*** Test Cases ***
#positivo
#robot -d /home/eduardo/Documentos/robotOutputFolder --test "Cenário 01: Realizar login com usuário válido a partir do e-mail" loginPage.robot
Cenário 01: Realizar login com usuário válido a partir do e-mail
    Given que o usuário está na tela de login
    When informar credencias válidas usando e-mail
    Then deverá ser direcionado para a tela inicial com usuário logado

#negativo
#robot -d /home/eduardo/Documentos/robotOutputFolder --test "Cenário 02: Realizar login com usuário inválido" loginPage.robot
Cenário 02: Realizar login com usuário inválido
    Given que o usuário está na tela de login
    When informar credenciais inválidas
    Then deverá ser apresentada uma mensagem de erro
