Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  get '/register', to: 'users#new'
  post '/users', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  get  '/dashboard', to: 'dashboard#index'
  get '/discover', to: 'discover#discover'
  get '/discover/movies', to: 'discover#index'
  get '/discover/movies/:id', to: 'discover#show', as: 'movie_detail'
end
