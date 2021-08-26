class FriendshipsController < ApplicationController
  def create
    friend = User.find_by(email: params[:friend])
    Friendship.create(user_id: params[:user_id], friend: friend)

    redirect_to '/dashboard'
  end
end
