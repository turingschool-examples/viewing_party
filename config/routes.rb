Rails.application.routes.draw do
  root 'welcome#index'
  get '/registration', to: 'users#new'
  post '/registration', to: 'users#create'
end
