class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = user_params
    user[:email] = user[:email].downcase
    new_user = User.new(user)

    if new_user.save
      flash[:message] = "Welcome to Viewing Party, #{new_user.email}"
      redirect_to dashboard_index_path
    else
      flash[:error] = 'Please enter valid information to create an acccount'
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
