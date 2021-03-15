Rails.application.routes.draw do
  root 'home#index'
  get 'welcome', to: 'home#welcome'
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
end
