class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(user_name: params[:user_name])
    require 'pry'; binding.pry
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:info] = "Welcome, #{user.user_name}!"
      redirect_to dashboard_path
    else
      render :new
      flash[:error] = 'Your email or password are incorrect'
    end
  end

  # def destroy
  #   session[:user_id] = nil
  #   redirect_to root_path
  # end
end
