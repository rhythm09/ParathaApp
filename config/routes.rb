Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :parathas, only: %i(new create index edit update destroy)
  # resources :users, only: %i(new create show edit update)
  # resources :sessions, only: %i(new create destroy)
  get 'add_quantity/:id', to: 'parathas#add_quantity', as: 'add_quantity'
  get 'carts_update/:id', to: 'carts#update_quantity', as: 'update_quantity' 
  get 'order_more_details/:id', to: 'orders#get_more_details', as: 'more_details'
  resources :carts, only: %i(index update destroy)
  resources :addresses, only: %i(new create index update destroy edit)
  get 'show_user/:id', to: 'users#show', as: 'show_user'
  resources :orders, only: %i(index)
  delete 'image/:paratha_id/:image_id', to: 'parathas#delete_image', as: 'image'
  get 'cart/:id', to: 'carts#add', as: 'add_to_cart'
  get 'show_addresses', to: 'addresses#show_addresses', as: 'show_addresses'
  post 'order/:id', to: 'orders#create', as: 'place_order'
  get 'delivery_address', to: 'addresses#add_delivery_address', as: 'add_delivery_address'
  post 'order', to: 'orders#place_order_address', as: 'order_address'
  get 'pending_orders', to: 'orders#pending_orders', as: 'pending_orders'
  put 'execute_order/:id', to: 'orders#execute_order', as: 'execute_order'
  get 'generate_pdf', to: 'orders#generate_pdf', as: 'generate_pdf'
  resources :charges
  get 'give_rating/:id', to: 'orders#give_rating', as: 'give_rating'
  get 'set_rating/:id', to: 'orders#set_rating', as: 'set_rating'
end
