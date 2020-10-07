Rails.application.routes.draw do
  get 'session/create'
  get 'welcome/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  post '/login', to: 'sessions#create', as: :user_login

  namespace :user do
    get '/dashboard', to: 'dashboard#index'
  end
end
