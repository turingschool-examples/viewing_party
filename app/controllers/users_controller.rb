class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = user_params
    user[:email] = user[:email].downcase
    new_user = User.create(user)
    if new_user.save
      flash[:success] = "Welcome, #{new_user.email}"
      session[:user_id] = new_user.id
      redirect_to '/'
    else
      flash[:error] = new_user.errors.full_messages.join(', ')
      redirect_to '/registration'
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
