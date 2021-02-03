Rails.application.routes.draw do
  resources :friends
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create]
end
