class PageLogin < SitePrism::Page
    set_url 'ap/signin?openid.pape.max_auth_age=0&openid.return_to=https%3A%2F%2Fwww.amazon.com.br%2F%3Fref_%3Dnav_em_hd_re_signin&openid.identity=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0%2Fidentifier_select&openid.assoc_handle=brflex&openid.mode=checkid_setup&openid.claimed_id=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0%2Fidentifier_select&openid.ns=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0&&ref_=nav_em_hd_clc_signin'
    
    element :name, '#ap_email'
    element :buttonProceed, 'input[id="continue"]'
    element :pass, '#ap_password'
    element :buttonGoLogin, '#signInSubmit'

    def inputLogin
        name.set 'vegeta2131@netmail9.com'
        buttonProceed.click
        sleep(2)
        pass.set 'Test123456'
        buttonGoLogin.click
    end

    def validateLoginSucess
       return page
        
    end
end