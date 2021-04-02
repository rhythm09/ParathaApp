Rails.application.routes.draw do
  root 'home#index'
  resources :parathas, only: %i(new create index edit update destroy)
  resources :users, only: %i(new create show edit update)
  resources :sessions, only: %i(new create destroy)
  resources :carts, only: %i(index update destroy)
  delete 'image/:paratha_id/:image_id', to: 'parathas#delete_image', as: 'image'
  get 'cart/:id', to: 'carts#add', as:'add_to_cart'
  resources :addresses, only: %i(new create index update destroy edit)
end