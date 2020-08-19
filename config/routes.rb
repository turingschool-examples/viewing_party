Rails.application.routes.draw do
  get '/', to: 'welcome#index'

  get '/dashboard', to: 'users#show'
end
