Rails.application.routes.draw do
  root 'welcome#index'
  post '/login', to: 'sessions#create', as: :user_login
  get '/registration', to: 'users#new', as: :user_registration
  post '/users', to: 'users#create', as: :user_create
  post '/friends', to: 'friendships#create', as: :friend
  get '/discover', to: 'movies#index', as: :discover
  get '/movies/top_40', to: 'movies#top_movies', as: :top_movies
  get '/movies/search', to: 'movies#top_search', as: :movies_search
  get '/movies/:id', to: 'movies#show', as: :movies_show

  namespace :user do
    get '/dashboard', to: 'dashboard#index'
  end
end
