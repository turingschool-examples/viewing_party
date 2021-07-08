class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = user_params
    user[:email] = user[:email].downcase
    new_user = User.new(user)
    if new_user.save
      redirect_to "/users/#{new_user.id}/dashboard"
      flash[:success] = "Welcome, #{new_user.email}!"
    else
      flash[:error] = new_user.errors.full_messages.join + "! Please try again!"
      redirect_to '/register'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
