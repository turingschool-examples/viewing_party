Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  get '/registration', to: 'users#new', as: :registration

  # resources :users, only: [:new, :create], path_names: {new: "registration"}
  resources :users, only: [:create]

  namespace 'user' do
    resource :dashboard, only: [:show], controller: :dashboard
  end
end
