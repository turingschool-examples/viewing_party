Rails.application.routes.draw do
  root 'welcome#index'

  get '/login', to:'sessions#new'
  post '/login', to:'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/registration', to: 'users#new'
  get '/dashboard', to: 'users#show'
  post '/users', to: 'users#create'

  post '/user_friendships', to: 'user_friendships#create'
end
