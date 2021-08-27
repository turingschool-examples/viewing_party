Rails.application.routes.draw do
  root "welcome#index"
  resources :users, only: [:new, :create]
  resources :dashboard, only: :index
  resources :sessions, only: [:new, :create, :destroy]
  resources :discover, only: :index
  resources :friends, only: :create
end
