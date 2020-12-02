class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/dashboard'
    else
      flash.now[:error] = user.errors.full_messages.to_sentence
      user.email = nil if User.find_by(email: user.email)
      render :new
    end
  end

  def show
    @user = User.find(session[:user_id])
  end

  private

  def user_params
    params[:user].permit(:email, :password, :password_confirmation)
  end
end
