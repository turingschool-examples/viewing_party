Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/registration', to:'users#new'
  post '/registration', to:'users#create'
  get "/dashboard", to: "users#show"

  get '/', to:'sessions#welcome'  #login
  post '/', to:'sessions#create'
  # get '/logout', to: 'sessions#logout_user'
  delete '/logout', to: 'sessions#destroy'
  # get "/dashboard", to: "sessions#show"

end
