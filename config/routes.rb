Rails.application.routes.draw do
  root 'welcome#index'

  get '/login', to:'sessions#new'
  post '/login', to:'sessions#create'

  get '/registration', to: 'users#new'
  get '/dashboard', to: 'user#show'
  post '/users', to: 'users#create'
end
