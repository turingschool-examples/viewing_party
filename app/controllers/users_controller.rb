class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = user_params
    user[:email] = user[:email].downcase
    # @new_user = User.new(user)
    if user[:password] != "" && user[:password] == user[:password_confirmation]
      new_user = User.create(user)
      session[:user_id] = new_user.id
      flash[:success] = "Welcome, #{new_user.name}"
      redirect_to dashboard_path
    else
      flash[:error] = "Your credentials need soem work bruh"
      redirect_to new_user_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation)
  end
end
