class SessionsController < ApplicationController
  def create
    access_token = request.env['omniauth.auth']
    user = User.from_omniauth(access_token)
    session[:id] = user.id
    redirect_to '/dashboard'
  end
end
