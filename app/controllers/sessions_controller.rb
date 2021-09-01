class SessionsController < ApplicationController
  def show
    @friends = current_user.friends if current_user && !current_user.friendships.nil?
  end

  def create
    user = User.find_by(email: params[:email])
    if !user.nil? && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.email}!"
      redirect_to '/dashboard'
    else
      flash[:error] = 'Sorry, your credentials are bad.'
      redirect_to '/'
    end
  end

  def destroy
    session[:user_id] = nil
    session[:movies] = nil

    redirect_to '/'
  end
end
