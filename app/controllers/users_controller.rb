class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = user_params
    user[:email] = user[:email].downcase
    user[:name] = user[:name].downcase
    new_user = User.create!(user)
    session[:user_id] = new_user.id
    flash[:success] = "Welcome, #{new_user.name}"
    redirect_to dashboard_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :password)
  end
end
