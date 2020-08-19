Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'
  get '/auth/:provider/callback', to: 'sessions#omniauth'

  get '/movies', to: 'movies#index'

  namespace :dashboard do
    get '/', to: 'users#show'
    get '/discover', to: 'discover#index'
  end
end
