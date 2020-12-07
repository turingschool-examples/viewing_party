class SessionsController < ApplicationController
  def login
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = 'You have successfully logged in!'
      redirect_to user_dashboard_path(user.username)
    else
      flash[:failure] = 'Your e-mail or password was incorrect!'
      redirect_to root_path
    end
  end

  def logout
    session.delete(:user_id)
    flash[:notice] = 'You have been logged out.'
    redirect_to root_path
  end
end
