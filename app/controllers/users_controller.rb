class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if user_params[:password] == user_params[:password_confirm]
      user = user_params.slice(:email, :password)
      user[:email] = user[:email].downcase
      new_user = User.create(user)
      flash[:success] = "Welcome, #{new_user.email}!"
      redirect_to root_path
    else
      flash[:error] = "Passwords do not match, please try again."
      redirect_to new_user_path
    end
  end

  def login_form
  end

  def login
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.email}!"
      redirect_to root_path
    else
      flash[:error] = "Incorrect email or password."
      render :login_form
    end
  end

  def logout
    session.clear
    redirect_to root_path
  end

  def follow
    @user = User.find(params[:id])
    current_user.followees << @user
    redirect_back(fallback_location: user_path(@user))
  end

  def unfollow
    @user = User.find(params[:id])
    current_user.followed_users.find_by(followee_id: @user.id).destroy
    redirect_back(fallback_location: user_path(@user))
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirm)
  end
end
