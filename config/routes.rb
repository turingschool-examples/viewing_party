Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#index"

  get "/registration", to: 'users#new'
  post "/users", to: 'users#create'
  get "/dashboard", to: 'users#show'
  post '/dashboard', to: 'friendships#create'

  #login
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  resources :discover, only: :index
  #movies
  resources :movies, only: [:index, :show]

  #viewing party
  get '/movies/:id/party/new', to: 'movie_party#new'
  post '/party', to: 'movie_party#create'
end
