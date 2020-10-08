Rails.application.routes.draw do
  root 'welcome#index'
  post '/login', to: 'sessions#create', as: :user_login
  get '/registration', to: 'users#new', as: :user_registration
  post '/users', to: 'users#create', as: :user_create
  post '/friends', to: 'friendships#create', as: :friend

  namespace :user do
    get '/dashboard', to: 'dashboard#index'
  end
end
