#PageObject
*** Settings ***
Resource                   ../resource/resource.robot
Suite Setup                abrir navegador                   
Suite Teardown             fechar navegador     

*** Test Cases ***
Cenário 1 - Consulta de usuário que consta na base de dados
    #dado
    que estou na página home do LinkedIn deslogado
    #e
    clico no botão pessoas
    #e
    seleciono a opção “pessoas”
    #e
    seleciono a opção nome e escrevo um nome “Vanderlan” que consta na base de dados
    #e
    seleciono a opção sobrenome e escrevo um sobrenome “Alves” que consta na base de dados
    #quando
    realizo consulta
    #então
    site apresenta resposta de filtro realizado com sucesso

Cenário 2 - Consulta de usuário que não consta na base de dados
    #dado
    que estou na página home do LinkedIn deslogado
    #e
    clico no botão pessoas
    #e
    seleciono a opção “pessoas”
    #e
    seleciono a opção nome e escrevo um nome “Vanderlan” que consta na base de dados
    #e
    seleciono a opção sobrenome e escrevo um sobrenome “Alves da Silva” que NAO consta na base de dados
    #quando
    realizo consulta
    #então
    site apresenta resposta de filtro de que não consta resultado na base de dados