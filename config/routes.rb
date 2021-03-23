Rails.application.routes.draw do
  root "welcome#index"

  resources :users, only: [:new, :create, :index] do
    resources :dashboard, only: [:index]
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
