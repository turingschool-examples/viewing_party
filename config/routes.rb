Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#index"
  post "/", to: "welcome#login"

  resources :users, only: [:new, :create]

  get '/dashboard', to: 'users#show', as: 'dashboard'

  get '/logout', to: 'users#destroy'
  delete '/logout', to: 'users#destroy'
end
