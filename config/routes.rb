Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "sessions#welcome"
  get '/login', to:'sessions#welcome'
  post '/login', to:'sessions#create'
  # get '/logout', to: 'sessions#logout_user'
  delete '/logout', to: 'sessions#destroy'
end
