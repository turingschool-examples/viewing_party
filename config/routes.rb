Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

   get '/registration', to: 'users#new'
   post '/login', to: 'users#login'
   get '/dashboard', to: 'users#dashboard'

   resources :movies, only: [:index, :show]
end
