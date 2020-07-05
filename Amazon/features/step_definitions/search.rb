Quando('eu realizo a busca pelo produto {string}') do |nameProduct|
    @searchProduct = SearchProduct.new
    @searchProduct.searchProduct(String nameProduct)
  end
  
  Então('devo visualizar resultados que contenha contexto da palavra pesquisada') do
    expect(@searchProduct.validateReturnSearch).to have_content($nameProduct, wait:10)
    
  end
  
  Quando('escolho o produto {string} na listagem') do |productSelectFromCar|
 
    @searchProduct.selectProduct(String productSelectFromCar)

  end
  
  Quando('adiciono ao carrinho') do
    @searchProduct.addProductInCar
  end
  
  Então('o produto deverá estar no carrinho') do
    @searchProduct.validateIfProductIsPresentInCart($productSelectFromCar)
  end
  