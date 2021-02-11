class UsersController < ApplicationController
  def index
    user = User.find_by(email:params[:query])

    if user
      Follow.create!(follower_id: current_user.id, followee_id: user.id)

      flash[:succes] = "You are now following #{user.email}!"
      redirect_to dashboard_path
    else
      flash[:error] = "User doesn't exist!"
      redirect_to dashboard_path
    end
  end
  
  def new
    if current_user
      redirect_to dashboard_path
    else
      @user = User.create
    end
  end

  def create
    new_user = User.new(user_params)
    if new_user.save
      session[:user_id] = new_user.id
      flash[:success] = "Welcome, #{new_user.email}"
      redirect_to dashboard_path
    else
      flash[:error] = new_user.errors.full_messages * ",\n"
      redirect_to dashboard_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
