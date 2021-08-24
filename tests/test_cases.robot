*** Settings ***
Resource         resource_bdd.robot
Resource         bdd_pt-br.robot
Suite Teardown   Fechar Navegador

*** Test Cases ***
Cenário: Salvando um novo herói - Hulk
    Dado que desejo salvar um novo herói
    Quando clicar em "Adicionar"
    E Inserir "Hulk", "Bruce Benner" e "Marvel"
    E clicar em "Salvar"
    Então apresentará a mensagem "Novo herói salvo!"