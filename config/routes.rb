Rails.application.routes.draw do
  get '/registration', to: 'users#new'
  post '/users', to: 'users#create'
end
