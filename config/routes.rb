Rails.application.routes.draw do
  root 'home#index'
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
end
