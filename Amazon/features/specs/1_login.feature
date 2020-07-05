#language: pt

Funcionalidade: Realizar login no Amazon ecommerce

Cenario: Realizar login
    Dado que estou na página de login
    Quando eu realizo informo usuario e senha válido
    Então o retorno deve ser "Olá, User"
