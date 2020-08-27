Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'
  get '/auth/:provider/callback', to: 'sessions#omniauth'

  post '/movies', to: 'movies#index'
  resources :movies, only:[:index, :show]
  #get '/movies', to: 'movies#index'
  #get '/movies', to: 'movies#show'

  namespace :dashboard do
    get '/', to: 'users#show'
    get '/discover', to: 'discover#index'
    post '/friendships', to: 'friendships#create'
    get '/viewing_parties/new', to: 'viewing_parties#new'
    post '/viewing_parties', to: 'viewing_parties#create'
    post '/calendar', to: 'calendar#create'
  end

end
