Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #Users
  get '/register', to: 'users#new'
  post '/register', to: 'users#create'
  get '/dashboard', to: 'users#show'

end
