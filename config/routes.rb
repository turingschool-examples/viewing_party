Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "welcome#index"
  get '/register', to: 'users#new'
  post '/users', to: 'users#create'
  get '/login', to:'sessions#new'
  post '/login', to:'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/dashboard', to: 'users#show'
  get '/discover', to: 'discover#index'
  get '/movies', to: 'movies#index'
  get '/movies/details', to: 'movies#show'

end
