Rails.application.routes.draw do
  root 'welcome#index'

  get '/register', to: 'users#new'
  post '/users', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  get  '/dashboard', to: 'dashboard#index'

  get '/discover', to: 'discover#discover'
  get '/discover/movies', to: 'discover#index'
  get '/discover/movies/:movie_id', to: 'discover#show', as: 'movie_detail'

  get '/parties/new', to: 'parties#new', as: 'new_party'
  post '/parties/', to: 'parties#create'
  post '/friendships', to: 'friendships#create'
end
