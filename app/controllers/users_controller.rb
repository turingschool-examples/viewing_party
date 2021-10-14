class UsersController < ApplicationController
  def show
  end
  def new
    @user = User.new
  end
  def create
    user = user_params
    user[:email] = user[:email].downcase
    new_user = User.create(user)
    if new_user.save
      flash[:success] = "Welcome, #{new_user.email}!"
      redirect_to dashboard_path
    else
      redirect_to registration_path
      flash[:error] = "Error: #{error_message(new_user.errors)}"
    end
  end

  def show

  end

  def search

  end 

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
