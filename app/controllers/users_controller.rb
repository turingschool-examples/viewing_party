class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = user_params
    user[:email] = user[:email].downcase
    new_user = User.create(user)
    if new_user.save
      redirect_to dashboard_path
      flash[:success] = "Registration completed for #{new_user.email}. Please log in!"
    else
      flash[:error] = "Passwords do not match"
      redirect_to registration_path
    end
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
