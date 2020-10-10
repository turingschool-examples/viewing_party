Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'welcome#index'

  get :register, to: 'users#new'

  resources :users, only: [:create]

  get "/login", to: "sessions#new"
  post '/login', to: 'sessions#create'

  namespace :user do
    get '/dashboard', to: 'dashboard#show'
  end

  get '/discover', to: 'discover#index'
  post '/discover', to: 'discover#index'

  get '/movies', to: 'movies#search'

  post '/friendship/new', to: 'friendships#create'
end
