Rails.application.routes.draw do
  root 'welcome#index'
  get '/register', to: 'users#new'
  post '/users', to: 'users#create'
  get '/dashboard', to: 'users#show'
  get '/login', to:'sessions#new'
  post '/login', to:'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  post '/friendships', to: 'friendships#create'
end
