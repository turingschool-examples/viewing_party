Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html\

  root 'welcome#index'

  resource :dashboard, controller: 'user', only: :show do
    resources :parties, only: [:new, :create]
  end

  resources :movies, only: [:index, :show]
  get '/discover', to: 'movies#search'
end
