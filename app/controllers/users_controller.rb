class UsersController < ApplicationController
  def login
    user = User.find_by(email: params[:email])
    flash[:success] = "Welcome, #{user.email}!"
    redirect_to "/dashboard"
  end
end