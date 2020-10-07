class User::DashboardController < ApplicationController
  def show
    @friends = Friendship.where(user_id: current_user.id).or(Friendship.where(friend_id: current_user.id))
  end
end
