class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    new_user_params = user_params
    new_user_params[:email] = new_user_params[:email].downcase

    user = User.create(new_user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to dashboard_path
    else
      flash[:error] = user.errors.full_messages.to_sentence
      render :new
    end
  end

  def show
    if session[:user_id]
      @user = User.find(session[:user_id])
    else
      flash[:error] = "You must be logged in to view your dashboard"
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
