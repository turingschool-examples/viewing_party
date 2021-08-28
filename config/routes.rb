Rails.application.routes.draw do
  # Welcome Controller
  get '/', to: 'welcome#index', as: 'login'
  # sessions Controller
  get '/dashboard', to: 'sessions#show', as: 'dashboard'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: 'logout'
  # Users Controller
  get '/register', to: 'users#new', as: 'register'
  post '/register', to: 'users#create'
  # Movies Controller
  get '/discover', to: 'movies#discover', as: 'discover'
  get '/movies', to: 'movies#index'
  get '/movies/:movie_id', to: 'movies#show'
  # Friendships Controller
  post '/friendships', to: 'friendships#create'
  # Viewing_parties Controller
  get '/viewing_parties/new', to: 'viewing_parties#new'
  post '/viewing_parties', to: 'viewing_parties#create'
end
