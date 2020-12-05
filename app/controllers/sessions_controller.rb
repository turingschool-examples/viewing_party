class SessionsController < ApplicationController
  def new
    return unless current_user

    flash[:notice] = 'You are already logged in.'
    redirect_to user_dashboard_path
  end

  def login
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Welcome, #{user.username}"
      redirect_to user_dashboard_path
    else
      flash[:failure] = 'Your e-mail or password was incorrect!'
      render :new
    end
  end

  def logout
    session.delete(:user_id)
    flash[:notice] = 'You have been logged out.'
    redirect_to root_path
  end
end
