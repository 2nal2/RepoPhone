module CartsHelper
    def cart_count
        if session[:cart]
            session[:cart].sum{|id, quantity| quantity} | 0
        else
            0
        end
    end
end
