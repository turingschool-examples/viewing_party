class SessionsController < ApplicationController

  def new

  end

  def create
    found_user = User.find_by(email: params[:email])
    if found_user && found_user.authenticate(params[:password])
        cookies.encrypted[:user_id] = found_user.id
        flash[:success] = "Welcome, #{found_user.email}!"
        redirect_to "/dashboard"
    else
        flash[:error] = "Your username or password are incorrect"
        redirect_to "/login"
    end
  end

  def destroy
    cookies.delete :user_id
    redirect_to '/'
  end

end