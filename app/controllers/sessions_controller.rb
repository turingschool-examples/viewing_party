class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
      # MISSING CODE?
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.name}"
      redirect_to dashboard_path
    else
      flash[:error] = 'Your credentials are bad, and you should feel bad'
      render :new
    end
  end

  def destroy
    current_user.destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Log Out Successful'
  end
end
