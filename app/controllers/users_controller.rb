class UsersController < ApplicationController
  def login
    user = User.find_by(email: params[:email])
    if user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.email}!"
      redirect_to '/dashboard'
    else
      flash[:error] = "Sorry, your credentials are bad."
      render :new
    end
  end

  def show
  end
end
