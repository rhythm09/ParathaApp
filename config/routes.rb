Rails.application.routes.draw do
  root 'home#index'
  resources :parathas, only: %i(new create index edit update destroy)
  resources :users, only: %i(new create show edit update)
  resources :sessions, only: %i(new create destroy)
  resources :carts
  get 'image/:paratha_id/:image_id', to: 'parathas#show1', as: 'image'
  get 'cart/:id', to: 'carts#add', as: 'add_to_cart'
  resources :addresses
  get 'cart', to: 'orders#show_addresses', as: 'show_addresses'
  post 'order/:id', to: 'orders#create', as: 'place_order'
  get 'order', to: 'orders#add_delivery_address', as: 'add_delivery_address'
  post 'order', to: 'orders#place_order_address', as: 'order_address'
end
