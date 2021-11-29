class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    new_user = User.new(downcased_user_params)
    if new_user.save
      UserMailer.with(user: user).sign_up_email.deliver
      session[:user_id] = new_user.id
      flash[:success] = 'Success! Welcome to Viewing Party!'
      redirect_to dashboard_path
    else
      flash[:error] = "Account not created: #{error_message(new_user.errors)}"
      redirect_to new_user_path
    end
  end

  def show
    @friendship = Friendship.new
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name)
  end

  def downcased_user_params
    user = user_params
    user[:email] = user[:email].downcase
    user
  end
end
