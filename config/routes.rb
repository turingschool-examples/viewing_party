Rails.application.routes.draw do
  # Welcome Controller
  get '/', to: 'welcome#index'
  # Users Controller
  get '/register', to: 'users#new', as: 'register'
  get '/dashboard', to: 'users#show', as: 'dashboard'
  post '/register', to: 'users#create'
  post '/login', to: 'users#login'
  # Movies Controller
  get '/discover', to: 'movies#discover', as: 'discover'
end
