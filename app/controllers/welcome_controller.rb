class WelcomeController < ApplicationController
  def index
  end

  def login
    user = User.find_by(email: params[:email])
    if user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.first_name}!"

      redirect_to dashboard_path(user)
    else
      flash[:error] = 'Error: Please make sure your credentials are correct.'

      redirect_to root_path
    end
  end
end
