Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#index"
  resources :users, only: [:new, :create]
  resources :dashboard, only: :index
  resources :discover, only: [:index]
  resources :friends, only: :create

  get "/registration", to: "users#new"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"


  resources :movies, only: [:index, :show]
  # resources :viewing_events, only: [:new, :create]
  post "/movies", to: "movies#search", as: "movies_search"

  get "/viewing_events", to: "viewing_events#new"
  post "/viewing_events", to: "viewing_events#create_movie", as: "create_movie"
end
