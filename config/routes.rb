Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  get '/registration', to: "users#new"
  post '/users', to: "users#create"
  get '/dashboard', to: "dashboard#index"
  get '/discover', to: "discover#index"
  resources :movies, only: [:index, :show]
end
