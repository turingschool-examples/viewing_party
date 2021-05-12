class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = user_params
    user_email = user[:email].downcase
    new_user = User.create(user_params)
    if new_user.save
      session[:user_id] = new_user.id #session comes with rails
      flash[:info] = "Welcome, #{new_user.email}!"
      redirect_to dashboard_path(user_email: "#{new_user.email}")
    else
      flash[:error]
    end #make sad path error as well
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

  def login
    user = User.find_by(email: params[:email])
    flash[:success] = "Welcome, #{user.email}!"
    redirect_to "/dashboard"
  end
end

