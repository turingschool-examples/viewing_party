Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "welcome#index"

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  get '/users', to: 'users#new', as: '/registration'
  resources :users, only: [:create]

  get '/dashboard', controller: :users, action: :show
end
