Rails.application.routes.draw do

  get '/', to: 'welcome#index', as: :root

  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/failure', to: redirect('/')

  get '/dashboard', to: 'users#show'
end
