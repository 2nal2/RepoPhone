class CartsController < ApplicationController
  def show
    cart_ids = $redis.smembers current_user_cart
    @cart_movies = Smartphone.find(cart_ids)
  end

  #edit this part for detaching the cart from the user
  def add
    $redis.sadd current_user_cart, params[:smartphone_id]
    render json: current_user.cart_count, status: 200
  end

  def remove
    $redis.srem current_user_cart, params[:smartphone_id]
    render json: current_user.cart_count, status: 200
  end

  private

  def current_user_cart
    "cart#{current_user.id}"
  end
end
