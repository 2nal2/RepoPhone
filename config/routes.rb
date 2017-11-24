Rails.application.routes.draw do
  get 'carts/show'

  devise_for :users
  resources :smartphones
  get '/catalogo', to: 'smartphones#catalogo'
  get '/catalogo/:id', to: 'smartphones#show'
  root "smartphones#home"

  resource :cart, only: [:show] do
    put 'add/:smartphone_id', to: 'carts#add', as: :add_to
    put 'remove/:smartphone_id', to: 'carts#remove', as: :remove_from
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
