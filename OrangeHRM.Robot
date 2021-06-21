*** Settings ***
Library        SeleniumLibrary

*** Variables ***
${url}        https://opensource-demo.orangehrmlive.com/        

*** Test Cases ***
realizar login com sucesso
    digitar usuario{Admin} e senha{admin123}
    acesso ao sistema
    
    apertar botao pra troca de senha
    troca de senha

fracasso de login
    digitar usuario{admin123} e senha{Admin}
    acesso negado invalid credentials

    digitar somente usuario{admin123}
    acesso negado password cannot be empty

    digitar senha{Admin}
    acesso negado username cannot be empty
    
    digitar usuario invalido{123} e senha{admin123}
    acesso negado username invalid

    digitar usuario{Admin} e senha{pepino} invalida
    acesso negado password invalid

    digitar usuario{ADMIN} e senha{ADMIN123} no capslock
    acesso negado invalid credential

*** Keywords ***
digitar usuario{${usuario}} e senha{${senha}}
    Open Browser        ${url}        chrome
    Maximize Browser Window        
    Input Text    id=txtUsername    ${usuario}
    Input Text    id=txtPassword    ${senha}
    Capture Page Screenshot
    Click Button    id=btnLogin

acesso ao sistema
    Wait Until Element Is Visible    id=welcome        10
    Capture Page Screenshot
    Close Browser

apertar botao pra troca de senha
    Open Browser        ${url}        chrome
    Maximize Browser Window
    Capture Page Screenshot
    Click Button    id=forgotPasswordLink

troca de senha
    Wait Until Element Is Visible    value=Reset Pasword        10
    Capture Page Screenshot
    Close Browser

digitar usuario{${usuario}} e senha{${senha}} invertidos
    Open Browser
    Maximize Browser Window
    Input Text    id=txtUsername    ${usuario}
    Input Text    id=txtPassword    ${senha}
    Capture Page Screenshot
    Click Button    id=btnLogin

acesso negado invalid credential
    Wait Until Element Is Visible    id=spanMessage        10
    Capture Page Screenshot
    Close Browser

digitar somente usuario{${usuario}}
    Open Browser        ${url}        chrome
    Maximize Browser Window
    Input Text    id=txtUsername    ${usuario}
    Capture Page Screenshot
    Click Button    id=btnLogin

acesso negado password cannot be empty
    Wait Until Element Is Visible    id=spanMessage        10    
    Capture Page Screenshot
    Close Browser

digitar senha{${senha}}
    Open Browser        ${url}        chrome
    Maximize Browser Window
    Input Text    id=txtPassword    ${senha}
    Capture Page Screenshot
    Click Button    id=btnLogin

acesso negado username cannot be empty
    Wait Until Element Is Visible    id=spanMessage        10
    Capture Page Screenshot
    Close Browser

digitar usuario invalido{${usuario}} e senha{${senha}} 
    Open Browser        ${url}        chrome
    Maximize Browser Window
    Input Text    id=txtUsername    ${usuario}
    Input Text    id=txtPassword    ${senha}
    Capture Page Screenshot
    Click Button    id=btnLogin

acesso negado username invalid
    Wait Until Element Is Visible    id=spanMessage        10
    Capture Page Screenshot
    Close Browser

digitar usuario{${usuario}} e senha{${senha}} invalida
    Open Browser        ${url}        chrome
    Maximize Browser Window
    Input Text    id=txtUsername    ${usuario}
    Input Text    id=txtPassword    ${senha}
    Capture Page Screenshot
    Click Button    id=btnLogin

acesso negado password invalid
    Wait Until Element Is Visible    id=spanMessage        10
    Capture Page Screenshot
    Close Browser     
     
digitar usuario{${usuario}} e senha{${senha}} no capslock
    Open Browser        ${url}        chrome
    Maximize Browser Window
    Input Text    id=txtUsername    ${usuario}
    Input Text    id=txtPassword    ${senha}
    Capture Page Screenshot
    Click Button    id=btnLogin

acesso negado invalid credentials
    Wait Until Element Is Visible    id=spanMessage        10
    Capture Page Screenshot
    Close Browser