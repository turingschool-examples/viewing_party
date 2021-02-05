class FriendshipsController < ApplicationController
  def create
    friend = User.find_by(email: params[:email])
    current_user.friendships.create!({ friend_id: friend.id })
    redirect_to dashboard_path
  end
end
