Rails.application.routes.draw do
  resources :friendships
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #Welcome
  get '/', to: 'welcome#index'

  #Users
  get '/register', to: 'users#new'
  post '/register', to: 'users#create'
  get '/dashboard', to: 'users#show'
  post '/login', to: 'users#login'

  #Movies
  get '/discover', to: 'movies#index'

  #Friendships
  post '/dashboard', to: 'friendships#new'

end
