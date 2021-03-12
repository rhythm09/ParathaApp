Rails.application.routes.draw do
  root 'home#index'
  resources :users
  resources :sessions
 
  # get 'home/welcome'
  # root 'users#home'
  # get 'sessions/new'
  # get 'sessions/create'
  # get 'sessions/login'
  # get 'sessions/welcome'
  # get 'users/new'
  # get 'users/create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
