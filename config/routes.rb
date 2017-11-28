Rails.application.routes.draw do
  get 'carts/show'

  devise_for :users
  resources :smartphones
  get '/catalogo', to: 'smartphones#catalogo'
  get '/catalogo/:id', to: 'smartphones#show'
  post '/get-smartphones', to: 'smartphones#get_smartphones'
  root "smartphones#home"

  resource :cart, only: [:show] do
    get 'pay', to: 'carts#pay', as: :payment
    post 'save-payment', to: 'carts#save_payment', as: :save_payment
    get 'success', to: 'carts#success', as: :success
  end

  resource :administration, only: [:show] do
    get 'sales', to: 'administration#sales'
    get 'sales/:id', to: 'administration#sale_detail'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
