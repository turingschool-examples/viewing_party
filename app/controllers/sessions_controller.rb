class SessionsController < ApplicationController
  def new; end

  def create
    if user = User.find_by(email: params[:email])
      if user.authenticate(params[:password])
        session[:user_id] = user.id
        flash[:success] = 'Login Successful!'
        redirect_to '/dashboard'
      else
        flash[:error] = 'Incorrect password, please try again.'
        redirect_to root_path
      end
    else
      flash[:error] = 'Please enter a valid email address.'
      redirect_to root_path
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:success] = 'Logout Successful!'
    redirect_to root_path
  end
end
