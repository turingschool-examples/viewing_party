class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "You are now logged in"
      redirect_to dashboard_path
    else
      flash[:notice] = "Incorrect login"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You are now logged out."
    redirect_to root_path
  end
end
