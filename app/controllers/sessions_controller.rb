class SessionsController < ApplicationController
  def new
  end

  def create
    require 'pry'; binding.pry
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
      # MISSING CODE?
      session[:user_id] = user.id
      flash[:success]= "Welcome, #{user.name}"
      redirect_to dashboard_path
    else
      flash[:error] = "Your credentials are no bueno amigo"
      render :new
    end
  end

  def destroy
    current_user.destroy
  end
end
