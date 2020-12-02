class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    require "pry"; binding.pry
    user = User.new(user_params)
  end

  private

  def user_params
    params[:user].permit(:email, :password, :password_confirmation)
  end
end
