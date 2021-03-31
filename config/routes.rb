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
  get 'order1', to: 'orders#show_orders', as: 'show_order'
  get 'parathas1/:id', to: 'parathas#add_quantity', as: 'add_quantity'
  get 'carts_update/:id', to: 'carts#update_quantity', as: 'update_quantity' 
  get 'order_more_details/:id', to: 'orders#get_more_details', as: 'more_details'
end
