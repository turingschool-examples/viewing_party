class UsersController < ApplicationController

  def login
    @user = User.find_by(email: params[:email].downcase)
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to dashboard_path
    else
      flash.now[:error] = "Invalid Email or Password"
      render "./welcome/index"
    end
  end

  def dashboard
  end

  def new
  end
end
