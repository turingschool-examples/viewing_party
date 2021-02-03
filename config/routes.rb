Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   root 'welcome#index'

   resources :users, only: [:new]

   get '/login', to: 'sessions#new'
   post '/login', to: 'sessions#create'

   get '/logout', to: 'sessions#destroy'

   get '/dashboard', to: 'dashboard#index'
  #  post '/movies', to: 'moviedb#search'
end
