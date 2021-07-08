Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#index"
  get '/register', to: 'users#new'
  post '/users', to: 'users#create'

  get '/users/:user_id/dashboard', to: 'dashboard#index'
  post '/login', to: 'session#create'
end
