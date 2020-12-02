class SessionsController < ApplicationController
  def new; end

  def create
    if user = User.find_by(email: params[:email])
      if user.authenticate(params[:password])
        session[:user_id] = user.id
        flash[:success] = 'Login Successful!'
        redirect_to '/dashboard'
      else
        flash[:error] = 'Invalid email or password, try again.'
        redirect_to root_path
      end
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:success] = 'Logout Successful!'
    redirect_to root_path
  end
end
