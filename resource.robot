*** Settings ***
Library    SeleniumLibrary    

*** Variables ***
${browser}      chrome
${url}          https://reclameaqui.obviostaging.com.br/
${btnlogin}     id:btn-signin
${username}     id:username
${userpass}     id:password
${btnenter}     id:kc-login
${hometitle}    Reclame Aqui - Pesquise antes de comprar. Reclame. Resolva

*** Keywords ***
Que o usuário está na tela de login
    Location Should Contain    auth-reclameaqui.obviostaging.com.br

Informar credencias válidas usando e-mail
    Preencher credenciais válidas
    Clicar no botão de entrar

Deverá ser direcionado para a tela inicial com usuário logado
    Validar se o usuário foi logado com sucesso

Preparar teste
    Open Browser                        ${url}            ${browser}    
    Wait Until Page Contains Element    id:header-logo
    Title Should Be                     ${hometitle}
    Clicar no botão de login

Clicar no botão de login
    Click Element    ${btnlogin}

Preencher credenciais válidas
    Preencher usuário válido "lua.arcanjo+julia@reclameaqui.com.br"
    Preencher senha válida "Reclam12"

Preencher usuário válido "${usernameexample}"
    Input Text    ${username}    ${usernameexample}

Preencher senha válida "${userpassexample}"
    Input Password    ${userpass}    ${userpassexample}

Clicar no botão de entrar
    Click Element    ${btnenter}

Validar se o usuário foi logado com sucesso
    Wait Until Element Contains    ${btnlogin}    Júlia

Finalizar teste
    Capture Page Screenshot
    Close Browser

Informar credenciais inválidas
    Preencher credenciais inválidas
    Clicar no botão de entrar

Preencher credenciais inválidas
    Preencher usuário inválido "emailaleatorio@reclameaqui.com.br"
    Preencher senha inválida "senhaaleatoria"

Preencher usuário inválido "${usernameexample}"
    Input Text    ${username}    ${usernameexample}

Preencher senha inválida "${userpassexample}"
    Input Password    ${userpass}    ${userpassexample}

Deverá ser apresentada uma mensagem de erro
    Wait Until Page Contains    Alguma informação incorreta.
