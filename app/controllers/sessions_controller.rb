class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if !user
      flash[:error] = "Incorrect login information"
      render :new
    else
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.email}!"
      redirect_to "/dashboard"
    end 
  end
end
