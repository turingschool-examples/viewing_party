Rails.application.routes.draw do
  root 'welcome#index'
  get '/register', to: 'users#new'
  post '/users', to: 'users#create'
  get '/login', to:'sessions#new'
  post '/login', to:'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  namespace :admin do
    get '/dashboard', to: 'dashboard#index'
  end

end
