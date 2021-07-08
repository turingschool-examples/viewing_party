Rails.application.routes.draw do
  root 'welcome#index'

  get '/login', to:'sessions#new'
  post '/login', to:'sessions#create'

  get '/registration', to: 'users#new'
  post '/users', to: 'users#create'
end
