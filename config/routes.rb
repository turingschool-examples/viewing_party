Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  resources :friends
  resources :users, only: [:new, :create]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  get '/logout', to: 'sessions#destroy'

  get "/dashboard", to: 'dashboard#index'

  get "/discover", to: 'discover#index'

  get "/movies/:id/new_viewing_party", to: 'viewing_parties#new', as: 'new_viewing_party'
  post "/movies/:id", to: 'viewing_parties#create', as: 'parties'

  resources :movies, only: [:index, :show]
end
