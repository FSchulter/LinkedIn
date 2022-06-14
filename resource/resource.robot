#PageObject
*** Settings ***    
Library                    SeleniumLibrary

*** Variables ***    
${nome_valido}
${sobrenome_valido}
${nome_invalido}
${sobrenome_invalido}

*** Keywords ***
abrir navegador
    Open Browser                             url:        chrome

fechar navegador
    Close Browser                       

que estou na página home do LinkedIn deslogado
    Go to                                    https://br.linkedin.com/    

clico no botão pessoas
    Click Element                            //span[contains(.,'Pessoas')]

seleciono a opção “pessoas”
    Click Element                            //button[contains(@class,'placeholder hide-on-mobile')] 

seleciono a opção nome e escrevo um nome ${nome_valido} que consta na base de dados
    Click Element                            //input[contains(@aria-label,'Nome')]
    Input Text                               //input[contains(@aria-label,'Nome')]         ${nome_valido}

seleciono a opção sobrenome e escrevo um sobrenome ${sobrenome_valido} que consta na base de dados
    Click Element                            //input[contains(@aria-label,'Sobrenome')]
    Input Text                               //input[contains(@aria-label,'Sobrenome')]    ${sobrenome_valido}

realizo consulta
    Click Element                            (//icon[contains(@aria-hidden,'true')])[6]   

site apresenta resposta de filtro realizado com sucesso
    Wait Until Page Contains Element         //div[contains(@class,'search-results-header')]    

seleciono a opção sobrenome e escrevo um sobrenome ${sobrenome_invalido} que NAO consta na base de dados
    Click Element                            //input[contains(@aria-label,'Sobrenome')]
    Input Text                               //input[contains(@aria-label,'Sobrenome')]    ${sobrenome_invalido}

site apresenta resposta de filtro de que não consta resultado na base de dados
    Wait Until Page Contains Element         //h1[contains(@class,'main-title main-title')]