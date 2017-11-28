class AdministrationController < ApplicationController
    include SessionHelper
    
    before_action :authenticate_user!, only: %i[sales sale_detail]
    before_action :validate_admin, only: %i[sales sale_detail]

    def sales
        @sales = Sale.all.order('date desc')
    end

    def sale_detail
        @sale = Sale.find(params[:id])
        @details = @sale.sale_details


    end
end
