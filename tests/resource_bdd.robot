*** Settings ***
Library    SeleniumLibrary

*** Variable ***
${BROWSER}             chrome
${URL}                 https://web-heroi.herokuapp.com/herois
${CRIAR}               xpath=.//*[@id="navbarTogglerDemo02"]/ul/li[2]/a
${CAMPO_NOME}          id=name
${CAMPO_NOME_CIVIL}    id=civil
${COMBO_UNIVERSO}      xpath=.//select[@id="universe"]
${SALVAR}              xpath=.//app-criar-heroi/div/div/div/button
${MENSAGEM_EXIBIDA}    xpath=.//app-criar-heroi/div/div/div/h4

*** Keywords ***
#### DADO
que desejo salvar um novo herói
    Open Browser                     ${URL}           ${BROWSER}
    Set Window Size                  ${1400}          ${600}
    Wait Until Element Is Visible    ${CRIAR}
    Title Should Be                  Web-Herói

#### QUANDO
clicar em "Criar"
    Click Element    ${CRIAR}

Inserir "${NOME}", "${NOME_CIVIL}" e "${UNIVERSO}"
    Input Text       ${CAMPO_NOME}                                     ${NOME}
    Input Text       ${CAMPO_NOME_CIVIL}                               ${NOME_CIVIL}
    Click Element    ${COMBO_UNIVERSO}/option[@value='${UNIVERSO}']

clicar em "Salvar"
    Click Element    ${SALVAR}

#### ENTÃO
apresentará a mensagem "${MENSAGEM}"
    Wait Until Element Is Visible    ${MENSAGEM_EXIBIDA}
    Page Should Contain              ${MENSAGEM}

#### TEARDOWN
Fechar Navegador
    Close Browser