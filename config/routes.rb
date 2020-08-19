Rails.application.routes.draw do
  get '/', to: 'welcome#index'
  resources :movies, only: [:show]
  resources :view_party, only: [:new]
end
