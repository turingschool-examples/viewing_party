class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_dashboard_path(user.id)
    else
      flash[:error] = 'email or password is incorrect'
      redirect_to root_path
    end
  end
end
