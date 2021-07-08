class SessionsController < ApplicationController
  def new
  end
  
  def create
    found_user = User.find_by(email: params[:email])
    if found_user && found_user.authenticate(params[:password])
      session[:user_id] = found_user.id
      flash[:success] = "Welcome back, #{found_user.email}!"
      redirect_to dashboard_path
    else
      flash[:error] = "Your username or password are incorrect. Please try again."
      redirect_to login_path
    end
  end
end
