class FriendsController < ApplicationController
  def create
    friend = User.find_by(email: params[:email])

    if friend
      current_user.followers << friend
    else
      flash[:message] = "#{params[:email].titleize} cannot be found. Search for another friend."
    end

    redirect_to dashboard_path
  end
end
