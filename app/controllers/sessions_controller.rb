class SessionsController < ApplicationController

  def omniauth
    access_token = request.env["omniauth.auth"]
    user = User.from_omniauth(access_token)
    #log_in(user)
    user.google_token = access_token.credentials.token
    refresh_token = access_token.credentials.refresh_token
    user.google_refresh_token = refresh_token if refresh_token.present?
    if user.save
      session[:user_id] = user.id
      redirect_to "/dashboard"
    else
      flash[:error] = "Credentials don't work"
      redirect_to "/"
    end 
  end
end