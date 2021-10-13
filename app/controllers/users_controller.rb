class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = user_params
    user[:email] = user[:email].downcase
    new_user = User.new(user)
    if new_user.save
      session[:user_id] = new_user.id
      flash[:success] = "Success! Welcome to Viewing Party!"
      redirect_to dashboard_path
    else
      flash[:error] = "Account not created: #{error_message(new_user.errors)}"
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find(session[:user_id])
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name)
  end
end
