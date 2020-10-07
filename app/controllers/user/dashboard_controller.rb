class User::DashboardController < ApplicationController
  def show
    friendships = Friendship.where(user_id: current_user.id).pluck(:friend_id)
    friendships << Friendship.where(friend_id: current_user.id).pluck(:user_id)
    @friends = User.where(id: friendships.flatten)
  end
end
