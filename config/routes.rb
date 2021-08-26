Rails.application.routes.draw do
  root "welcome#index"
  resources :users, only: [:new, :create]
  resources :dashboard, only: :index

  post '/login', to: 'users#login_form'

  get '/logout', to: 'users#logout'
end
