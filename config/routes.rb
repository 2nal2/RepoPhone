Rails.application.routes.draw do
  resources :smartphones
  get '/catalogo', to: 'smartphones#catalogo'
  get '/catalogo/:id', to: 'smartphones#show' 
  root "smartphones#home"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
