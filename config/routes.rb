Rails.application.routes.draw do
	root "welcome#index"

	get '/dashboard', to: 'dashboard#index', as: :dashboard
	get '/login', to: 'sessions#new'
	post '/login', to: 'sessions#create'

	resources :users, only: [:new, :create]
	resources :movies, only: [:index]
end
