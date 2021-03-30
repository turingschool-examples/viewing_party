class FriendsController < ApplicationController
  def create
    friend = User.find_by(email: params[:email])
    user = current_user.id
    if friend.nil?
      flash[:error] = 'That User Does Not Exist'
    else
      Friend.create!(user_id: user, friend_id: friend.id)
    end
    redirect_to dashboard_path
  end
end
