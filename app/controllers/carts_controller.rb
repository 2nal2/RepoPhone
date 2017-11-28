class CartsController < ApplicationController
  before_action :authenticate_user!, only: %i[pay save_payment]
  skip_before_action :verify_authenticity_token, only: %i[save_payment]
  
  def show
  end

  def success
  end

  def pay
  end

  # POST /cart/save-payment
  # POST /cart/save-payment.json
  def save_payment
      list = params[:listSmartphones]

      sale = Sale.new
      sale.date = Time.now
      sale.user_id = current_user.id
      sale.location = params[:location]
      sale.save

      list.each{|id, quantity|
          detail = SaleDetail.new
          temp = Smartphone.find(id)
          detail.smartphone_id = id
          detail.quantity = quantity
          detail.price = temp.price
          detail.save
      }

      response = {success: true}
      respond_to do |format|
        format.json { render json:response}
    end
  end
end

