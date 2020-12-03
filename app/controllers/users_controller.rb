class UsersController < ApplicationController

  def new
  end

  def create
    @user = User.create(user_params)
    redirect_to "/dashboard"
  end

  private
  def user_params
    params.permit(:email, :password, :password_confirmation)
  end

end
