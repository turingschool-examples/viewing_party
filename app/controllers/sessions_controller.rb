class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
      # MISSING CODE?
      session[:user_id] = user.id
      flash[:success]= "Welcome, #{user.name}"
      redirect_to root_path
    else
      flash[:error] = "Your credentials are no bueno amigo"
      render :new
  end

  def destroy
    current_user.destroy
  end
end
