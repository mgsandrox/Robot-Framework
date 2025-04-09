***Settings***
Library    SeleniumLibrary
Library    BuiltIn

***Variables***
${Site_UTI}   http://177.93.104.6:1007/uti/suporte/
${Site_URL}   https://automationpratice.com.br/
${login}      xpath=//a[@href="/login"]
${user}         qazando@teste.com
${password}     123456

***Keywords***
Abrir Navegador
    Open Browser    ${Site_URL}    firefox
    Maximize Browser Window
    # Maximiza a janela do navegador

Abrir Navegador UTI
    Open Browser    ${Site_UTI}    edge
    Maximize Browser Window

Tempo de espera
    [Arguments]    ${Tempo de espera}
    Set Selenium Implicit Wait    ${Tempo de espera}
Timer
    Sleep   3s
    # Aguarda 3 segundos para o carregamento da página

Clicar em login
    Click Element    ${login}   
    Tempo de espera   2s

Inserir o usuário e senha
    Input Text  xpath=//input[@id="user"]   ${user}
    Input Text  xpath=//input[@id="password"]   ${password}
    Click Element  xpath=//button[@id="btnLogin"]
    Tempo de espera  3s
    # Inserindo o usuário e senha e clicando no botão de login

Verificação de texto alert
    ${visivel}     Run Keyword And Return Status    Element Should Be Visible    //div[@id="swal2-html-container"]
    Log to Console   v:${visivel}
    IF   ${visivel}
        Log to Console   O elemento está visível.
        # Verifica se o elemento está visível e obtém o texto do alerta
    ELSE
        Log to Console    O elemento não está visível.
        # Caso o elemento não esteja visível, registra a mensagem
    END
    Tempo de espera  3s
    # Aguarda 3 segundos para o carregamento da página
***Test Cases***
Cenário 1 - Acessar o site e fazer login
    [Tags]  Suite1
    Abrir Navegador
    Clicar em login
    Inserir o usuário e senha 
    Verificação de texto alert
    Close Browser
