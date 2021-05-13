class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    new_user_params = user_params
    new_user_params[:email] = new_user_params[:email].downcase

    user = User.create(new_user_params)
    if user.save
      redirect_to dashboard_path
    else
      flash[:error] = user.errors.full_messages.to_sentence
      render :new
    end
  end

  def show
    # @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
