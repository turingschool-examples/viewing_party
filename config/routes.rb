Rails.application.routes.draw do
  get '/', to: 'welcome#index'
  get '/register', to: 'welcome#register', as: 'register'
  get 'dashboard', to: 'users#show'

  controller :users do
    post '/dashboard', action: :login
    post '/login', action: :login
  end
end
