Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/registration", to: "users#new"
  post "/registration", to: "users#create"
  get "/dashboard", to: "users#show"

  get '/', to:'sessions#welcome', as: "welcome"
  post '/', to:'sessions#create'
  # get '/logout', to: 'sessions#logout_user'
  delete '/logout', to: 'sessions#destroy'

  resources :movies, only: [:index, :show]
  get '/discover', to:'movies#discover'
  post '/discover', to:'movies#discover'
end
