Rails.application.routes.draw do

  get '/', to: 'welcome#index', as: :root

  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/failure', to: redirect('/')

  get '/dashboard', to: 'users#show'

  get '/movies', to: 'movies#index'

  post '/friendships', to: 'friendships#create'
end
