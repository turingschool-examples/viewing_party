Rails.application.routes.draw do
  get '/', to: 'welcome#index'
  resources :movies, only: [:show]
  resources :viewing_party, only: [:new]
end
