Rails.application.routes.draw do
  resources :friendships
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #Welcome
  get '/', to: 'welcome#index'

  #Users
  get '/register', to: 'users#new'
  post '/register', to: 'users#create'
  get '/dashboard', to: 'users#show'

  #Sessions
  post '/login', to: 'sessions#new'

  #Movies
  get '/discover', to: 'dashboard#index'
  resources :movies, only: [:index, :show]

  #Parties
  get '/parties/new', to: 'parties#new'
  post '/parties/new', to: 'parties#create'
  post '/parties/accept', to: 'parties#update'
  post '/parties/decline', to: 'parties#update'

  #Friendships
  post '/dashboard', to: 'friendships#new'

end
