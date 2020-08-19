class SessionsController < ApplicationController

  def omniauth
    user_info = request.env["omniauth.auth"]
    user = User.from_omniauth(user_info)
    #log_in(user)
    user.google_token = user_info.credentials.token
    refresh_token = user_info.credentials.refresh_token
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