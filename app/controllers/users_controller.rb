class UsersController < ApplicationController 

  def new
    @user = User.new
  end

  def create
    user = user_params 
    user[:email] = user[:email].downcase 
    new_user = User.create(user)
    redirect_to dashboard_path 
    flash[:success] = "Welcome, #{new_user[:email]}!"
  end

  private
    def user_params 
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end