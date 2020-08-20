class FriendshipsController < ApplicationController
  def create
    friend = User.find_by(email: params[:friend_email])
    friendship = Friendship.create!(user_id: current_user.id, friend_id: friend.id) if friend
    if friendship
      flash[:success] = 'You have a new Friend.'
    else
      flash[:error] = 'Sorry your friend cannot be found.'
    end
    redirect_to request.referer
  end
end
