class UsersController < ApplicationController
  def new; end

  def show; end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to '/dashboard'
    else
      render :new
    end
  end

  private

  def user_params
    params.permit(:username, :email, :password, :password_confirmation)
  end
end
