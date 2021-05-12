Rails.application.routes.draw do
  root 'welcome#index'
  get '/registration', to: 'users#new'
  # post '/registration', to: 'users#create'
  resources :users, only: [:create, :index]
  get '/dashboard', to: 'users#show'
end
