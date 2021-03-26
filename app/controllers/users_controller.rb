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
      session[:user_id] = new_user.id
      redirect_to dashboard_index_path
    elsif new_user.errors[:email].empty?
      flash[:error] = new_user.errors.full_messages.to_sentence
      @user = User.new(email: new_user.email)
      render :new
    else
      flash[:error] = new_user.errors.full_messages.to_sentence
      @user = User.new
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
