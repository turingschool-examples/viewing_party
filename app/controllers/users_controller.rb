class UsersController < ApplicationController
  skip_before_action :check_login
  def new
    @user = User.new
  end

  def create
    user = user_params
    user[:user_name] = user[:user_name].downcase
    new_user = User.create(user)

    if new_user.save
      flash[:info] = 'Registration Succesful'
      session[:user_id] = new_user.id
      redirect_to dashboard_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :password, :password_confirmation)
  end
end
