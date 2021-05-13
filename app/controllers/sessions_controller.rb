class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.email}!"
      redirect_to dashboard_path(user_email: "#{user.email}")
    else
      flash[:error] = "Sorry, your credentials are bad."
      render root_path
    end
  end
end
