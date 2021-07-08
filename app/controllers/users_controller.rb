class UsersController < ApplicationController
  def welcome
  end

  def new
      @user = User.new
  end

  def create
      user = user_params
      user[:email] = user[:email].downcase
      new_user = User.create(user)
      flash[:success] = "Welcome, #{new_user.email}!"
      redirect_to "/"
  end

  def show
    # require 'pry';binding.pry
    @user = User.all.first
    # @user = current_user  ##not in Session
    #my_string[/[^@]+/]
  end

  private

  def user_params
      params.require(:user).permit(:email, :password)
  end
end
