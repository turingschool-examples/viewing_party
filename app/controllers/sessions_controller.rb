class SessionsController < ApplicationController
  skip_before_action :check_login
  def new; end

  def create
    user = User.find_by(user_name: params[:user_name])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = 'You have logged in'
      redirect_to dashboard_path
    else
      flash[:error] = 'Your email or password are incorrect'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'You have been logged out'
    redirect_to root_path
  end
end
