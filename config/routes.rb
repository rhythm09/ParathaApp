Rails.application.routes.draw do
  root 'home#index'
  resources :parathas, only: %i(new create index edit update destroy)
  resources :users, only: %i(new create show edit update)
  resources :sessions, only: %i(new create destroy)
  get 'parathas1/:id', to: 'parathas#add_quantity', as: 'add_quantity'
  get 'carts_update/:id', to: 'carts#update_quantity', as: 'update_quantity' 
  get 'order_more_details/:id', to: 'orders#get_more_details', as: 'more_details'
  resources :carts, only: %i(index update destroy)
  resources :addresses, only: %i(new create index update destroy edit)
  resources :orders, only: %i(index)
  delete 'image/:paratha_id/:image_id', to: 'parathas#delete_image', as: 'image'
  get 'cart/:id', to: 'carts#add', as: 'add_to_cart'
  get 'show_addresses', to: 'addresses#show_addresses', as: 'show_addresses'
  post 'order/:id', to: 'orders#create', as: 'place_order'
  get 'delivery_address', to: 'addresses#add_delivery_address', as: 'add_delivery_address'
  post 'order', to: 'orders#place_order_address', as: 'order_address'
end
