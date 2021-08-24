class UsersController < ApplicationController
  def login
    user = User.find_by(email: params[:email])
    if user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.email}!"
      redirect_to '/dashboard'
    else
      flash[:error] = "Sorry, your credentials are bad."
      render :new
    end
  end

  def new
  end

  def create
    user = User.create(user_params)
    if user.save
      flash[:success] = "Welcome #{user.email}!"
      redirect_to dashboard_path
    end
  end

  def show
  end

  private

  def user_params
    params.permit(:email, :password)
  end
end
