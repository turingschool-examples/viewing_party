class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.new
  end

  def create
    user = user_params
    user[:email] = user[:email].downcase
    new_user = User.new(user)
    if new_user.save
      new_user = User.create(user)
      flash[:success] = "Welcome, #{new_user.email}!"
      session[:user_id] = new_user.id
      redirect_to dashboard_path
    else
      # find way to notify error for p.w. and email seperately 
      flash[:error] = "Wrong email/password"
      redirect_to new_user_path
    end
  end

  def login_form
  end

  def login
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
      flash[:success] = "Welcome, #{user.email}"
      redirect_to dashboard_path
    else
      flash[:error] = "Wrong email/password"
      render :login_form
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end