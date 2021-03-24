Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  get '/users/new' to: 'users#create'
   resources :users, only: [:create, :new]
   post '/login', to: 'users#login'
   get '/dashboard', to: 'users#dashboard'
   get '/discover', to: 'discover#index'
   resources :friends, only: [:create]

end
