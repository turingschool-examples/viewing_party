Rails.application.routes.draw do
  root 'welcome#index'

  get '/registration', to: 'users#new'
  # post '/registration', to: 'users#create'
  resources :users, only: [:create, :index]

  get '/dashboard', to: 'users#show'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  get '/discover', to: 'discover#index'

  get '/movies', to: 'movies#index'
  get '/movies/:id', to: 'movies#show'

  get '/viewing-party/new', to: 'parties#new'
end
