class UsersController < ApplicationController
  def new
    @user = User.create
  end

  def create
    new_user = User.new(user_params)
    if new_user.save
      session[:user_id] = new_user.id
      flash["success"] = "Welcome, #{new_user.email}"
      redirect_to dashboard_path
    else
      flash[:error] = new_user.errors.full_messages * ",\n"
      render :new

    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
