Rails.application.routes.draw do
    root "welcome#index"

    resources :users, only: [:new, :create, :index] do
      resources :dashboard, only: [:index]
    end
end
