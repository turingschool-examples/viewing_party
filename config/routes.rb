Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "welcome#index"
  get '/register', to: 'users#new'
  post '/users', to: 'users#create'
  get '/login', to:'sessions#new'
  post '/login', to:'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/dashboard', to: 'authenticated/dashboard#show'
  get '/discover', to: 'authenticated/discover#index'
  get '/movies', to: 'authenticated/movies#index'
  get '/movies/details', to: 'authenticated/movies#show'
  post 'friends', to: 'authenticated/friends#create'

end
