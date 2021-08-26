class SessionsController < ApplicationController
  # def index

  # end

  def show
    if current_user && !current_user.friendships.nil?
      @friends = current_user.friends
    end
  end

  # def new

  # end

  def create
    user = User.find_by(email: params[:email])
    if !user.nil? && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.email}!"
      redirect_to '/dashboard'
    else
      flash[:error] = "Sorry, your credentials are bad."
      redirect_to '/'
    end
  end

  # def edit

  # end

  # def update

  # end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end
private
  # def _params
  #   params.permit(:)
  # end
end
