class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to dashboard_path
    elsif !user && !params[:email].empty?
      flash[:error] = 'User does not exist with that email'
      render :new
    elsif params[:email].empty? || params[:password].empty?
      flash[:error] = 'Fields cannot be blank'
      render :new
    else
      flash[:error] = 'Your credentials are incorrect'
      render :new
    end
  end
end
