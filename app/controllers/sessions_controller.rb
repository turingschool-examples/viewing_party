class SessionsController < ApplicationController
  def create
    found_user = User.find_by(email: params[:email])
    if found_user.authenticate(params[:password])
      session[:user_id] = found_user.id
      flash[:success] = "Welcome, #{found_user.email}!"
      redirect_to '/dashboard'
    else
      flash[:alert] = "No matching account!"
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
