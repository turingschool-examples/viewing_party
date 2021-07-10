Rails.application.routes.draw do
  root 'welcome#index'

  get '/login', to:'sessions#new'
  post '/login', to:'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/registration', to: 'users#new'
  get '/dashboard', to: 'user#show'
  post '/users', to: 'users#create'

  get '/movie_details', to: 'movies#show'
end
