class SessionsController < ApplicationController
  skip_before_action :authorized, only: %i[new create]

  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to dashboards_path
    else
      redirect_to login_path
      flash[:error] = 'Your email or password is Incorrect'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
    flash[:success] = 'You have successfully logged off.'
  end
end
