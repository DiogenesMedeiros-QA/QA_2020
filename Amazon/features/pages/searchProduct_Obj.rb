class SearchProduct< SitePrism::Page
    
    element :inputSearch, 'input[id="twotabsearchtextbox"]'
    element :submitSeach, 'input[type="submit"]'
    element :addCar, '#add-to-cart-button'
    element :goCart, 'a[class="a-button-text"]'
    elements :list, 'h2 > a'
    
    def searchProduct(nameProduct)
        inputSearch.set nameProduct
        submitSeach.click
        
    end

    def validateReturnSearch
       return page 
    end

    def selectProduct(nameProductSelect)

        # Interact with all search results and click on the result that matches a comparison.
        # in whatever position it is.
        list.each do |positions|
            if positions.text.eql?(nameProductSelect)
                positions.click
                break
            end
        end
    end

    def addProductInCar
        addCar.click
    end

    def validateIfProductIsPresentInCart(nameProductSelect)        
      page.text.eql?('Adicionado ao carrinho')
      goCart.click
      page.text.strip.eql?(nameProductSelect)    
    end
end