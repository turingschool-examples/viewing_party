Rails.application.routes.draw do
  root "welcome#index"

  resources :users, only: [:new, :create, :index] do
    resources :dashboard, only: [:index]
    resources :followers, only: [:create]
  end

  resources :discover, only: [:index]
  resources :movies, only: [:index, :show]

  get "/movies/top_40_movies", to: 'movies#top_40', as: :top_40

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
