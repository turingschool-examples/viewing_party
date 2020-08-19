Rails.application.routes.draw do
  get '/', to: 'welcome#index'
  get '/dashboard', to: 'users#show'
  get '/discover', to: 'discover#index'
  resources :movies, only: [:show]
  resources :view_party, only: [:new, :create]

end
