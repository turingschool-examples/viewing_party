Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#index"
  post '/login', to: 'sessions#create', as: 'login'

  resources :users, only: [:new, :create]

  get '/dashboard', to: 'users#show', as: 'dashboard'

  get '/logout', to: 'sessions#destroy'
  delete '/logout', to: 'sessions#destroy'

  get '/movies', to: 'movies#index'
  post '/movies', to: 'movies#index'
  get '/movies/:movie_id', to: 'movies#show', as: 'movie'

  get '/discover', to:'movies#discover'
  post '/discover', to:'movies#discover'

  resources :parties, only: [:new, :create, :destroy]

  resources :friendships, only: [:create]
end
