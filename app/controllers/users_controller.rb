class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = user_params
    user_email = user[:email].downcase
    new_user = User.create(user_params)
    if !new_user.save
      flash.now[:error] = "Please make sure the passwords match"
      # redirect_to register_path
      render :new
    else new_user.save
      session[:user_id] = new_user.id
      flash[:info] = "Welcome, #{new_user.email}!"
      redirect_to dashboard_index_path(user_email: "#{new_user.email}", user_id: "#{new_user.id}")
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
