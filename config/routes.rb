Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'welcome#index'

  get "/auth/google_oauth2", to: "sessions#create"
  #get "auth/:provider/callback", to: "sessions#create"

end
