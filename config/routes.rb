Rails.application.routes.draw do

  get '/', to: 'welcome#index', as: :root

  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/failure', to: redirect('/')

  get '/dashboard', to: 'users#show'

  get '/discover', to: 'movies#index'

  post '/friendships', to: 'friendships#create'

  get '/movies/top_rated', to: 'movies#top_rated'

  post '/movies/search', to: 'movies#search'

  get '/movies/:id', to: 'movies#show'

  get  '/parties', to: 'parties#new'
  post '/parties', to: 'parties#create'
end
