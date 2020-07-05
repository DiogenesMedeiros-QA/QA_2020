#language: pt

Funcionalidade: Realizar pesquisa por produto, escolher na lista, adicionar o carrinho e validar o produto no carrinho

Cenario: Fazer busca e adicionar o produto no carrinho
    Quando eu realizo a busca pelo produto "alexa echo dot" 
    Então devo visualizar resultados que contenha contexto da palavra pesquisada
    Quando escolho o produto "Echo (3ª geração) - Smart Speaker com Alexa - Cor Preta" na listagem
    E adiciono ao carrinho
    Então o produto deverá estar no carrinho