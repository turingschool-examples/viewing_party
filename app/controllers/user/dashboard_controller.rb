class User::DashboardController < ApplicationController
  def show
    cu_id = current_user.id
    @friends = User.where(id: Friendship.where(user_id: cu_id).pluck(:friend_id)).or(User.where(id: Friendship.where(friend_id: cu_id).pluck(:user_id)))
    @parties = Party.where(id: PartyUser.where(user_id: cu_id).pluck(:party_id)).or(Party.where(user_id: cu_id))
  end
end
