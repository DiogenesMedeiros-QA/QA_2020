Dado("que estou na página de login") do
    @pagelogin = PageLogin.new
    @pagelogin.load
    sleep(5)
  end
  
Quando("eu realizo informo usuario e senha válido") do
    @pagelogin.inputLogin
  end
  
Então("o retorno deve ser {string}") do |validacao|
    expect(@pagelogin.validateLoginSucess).to have_content($validacao, wait:10) 
  end