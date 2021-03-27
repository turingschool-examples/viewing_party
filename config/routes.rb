Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html\

  root 'welcome#index'
  resources :users, only: [:new, :create]

  get '/login', to: 'session#new'
  post '/login', to: 'session#create'

  resource :dashboard, controller: 'users', only: :show
  resources :parties

  resources :movies, only: :show
  get '/discover', to: 'movies#index'
  post '/discover', to: 'movies#index'
  post '/movies/:id', to: 'parties#new'
end
