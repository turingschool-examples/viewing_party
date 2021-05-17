class FriendshipsController < ApplicationController
  def create
    @user = current_user
    friend = User.find_by(user_name: params[:search])
    Friendship.create(user_id: @user.id, friend_id: friend.id)
    flash[:notice] = 'You made a friend!'
    binding.pry
    redirect_to dashboard_path
  end
end
