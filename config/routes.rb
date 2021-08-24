Rails.application.routes.draw do
  get '/', to: 'welcome#index'

  controller :users do
    post '/dashboard', action: :login
    post '/login', action: :login
  end
end
