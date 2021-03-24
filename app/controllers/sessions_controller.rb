class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email].downcase)

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:message] = "Welcome, #{user.email}!"
      redirect_to dashboard_index_path
    else
      flash[:message] = "email or password is incorrect"
      redirect_to root_path
    end
  end
end
