Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/registration", to: "users#new"
  post "/registration", to: "users#create"
  get "/dashboard", to: "authenticated/dashboard#show"

  get '/', to:'sessions#welcome', as: "welcome"
  post '/', to:'sessions#create'
  # get '/logout', to: 'sessions#logout_user'
  delete '/logout', to: 'sessions#destroy'

  # resources :movies, only: [:index, :show]
  get '/movies', to:'authenticated/movies#index'
  get '/movies/:movie_id', to:'authenticated/movies#show'
  get '/discover', to:'authenticated/movies#discover'
  post '/discover', to:'authenticated/movies#discover'
end
