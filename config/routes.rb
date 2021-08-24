Rails.application.routes.draw do
  get '/', to: 'welcome#index'
  get '/register', to: 'users#new', as: 'register'
  get '/dashboard', to: 'users#show', as: 'dashboard'
  post '/register', to: 'users#create'

  # controller :users do
  #   post '/dashboard', action: :login
  #   post '/login', action: :login
  # end
end
