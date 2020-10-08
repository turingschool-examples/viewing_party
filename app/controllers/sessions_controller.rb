class SessionsController < ApplicationController
  def new
    @user = User.find_by(email: session_params[:email])
    if @user && @user.authenticate(session_params[:password])
      flash[:success] = "Now logged in as #{@user.email}!"
      session[:current_user] = @user.id
      redirect_to '/dashboard'
    else
      flash[:error] = 'That email/password combonation does not exist in our records'
      redirect_to '/'
    end
  end

  private

  def session_params
    params.require(:user).permit(:email, :password)
  end
end
