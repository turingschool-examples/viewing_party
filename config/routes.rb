Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :users, only: [:new]
  resources :movies, only: [:index]
  
  root 'welcome#index'
  get '/login', to: 'users#login_form'
  post '/login', to: 'users#login'
  get '/discover', to: 'discover#index'
end
