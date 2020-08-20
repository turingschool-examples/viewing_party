Rails.application.routes.draw do

  get '/', to: 'welcome#index'

  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/failure', to: redirect('/')

end
