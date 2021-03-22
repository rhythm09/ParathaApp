Rails.application.routes.draw do
  root 'home#index'
  resources :users, only: %i(new create show edit update)
  resources :sessions, only: %i(new create destroy)
end
