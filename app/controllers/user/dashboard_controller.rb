class User::DashboardController < ApplicationController
  def show
    @friends = User.where(id: Friendship.where(user_id: current_user.id).pluck(:friend_id)).or(User.where(id: Friendship.where(friend_id: current_user.id).pluck(:user_id)))


  end
end
