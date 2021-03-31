Rails.application.routes.draw do
  root "welcome#index"

  resources :users, only: [:new, :create, :index] do
    resources :dashboard, only: [:index]
    resources :followers, only: [:create]
    member do
      get :confirm_email, as: :registration_confirmation
    end
  end

  resources :discover, only: [:index]
  resources :movies, only: [:index, :show]
  resources :parties

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
