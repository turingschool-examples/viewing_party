class FriendshipsController < ApplicationController
  def create
    user = User.find(session[:user_id])
    friend = find_friend(params[:friend_email])

    if !friend.nil?
      Friendship.create!(user_id: user.id, friend_id: friend.id )
      redirect_to dashboard_path
    else
      flash[:error] = "I'm sorry your friend cannot be found"
    end
  end

  def find_friend(email)
    User.find_by(email: email)
  end
end
