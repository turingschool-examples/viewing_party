class FriendshipsController < ApplicationController
  def create
    # binding.pry
    wannabe_friend = User.find_by(email: params[:email])
    current_user.friendships.create!({friend_id: wannabe_friend.id})
    redirect_to dashboard_path
  end
end
