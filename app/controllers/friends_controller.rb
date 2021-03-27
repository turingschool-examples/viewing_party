class FriendsController < ApplicationController
  def create
    user = User.find(params[:id])
    friend = User.find_by(email: params[:email])
    if friend
      user.followed << friend
    else
      flash[:message] = "#{params[:email].titleize} cannot be found. Search for another friend."
    end
    session[:user_id] = user.id
    redirect_to dashboard_index_path
  end
end
