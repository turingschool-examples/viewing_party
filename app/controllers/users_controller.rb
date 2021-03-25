class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.new
  end

  def create
    user = user_params
    user[:email] = user[:email].downcase
    new_user = User.new(user)
    if new_user.save
      flash[:success] = "Welcome, #{new_user.email}!"
      session[:user_id] = new_user.id
      redirect_to dashboard_path
    else
      # find way to notify error for p.w. and email seperately
      flash[:error] = 'Wrong email/password'
      redirect_to new_user_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
