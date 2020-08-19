Rails.application.routes.draw do
  get '/', to: 'welcome#index'

  get '/dashboard', to: 'users#show'
  get '/discover', to: 'discover#index'
end
