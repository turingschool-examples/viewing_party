class FriendshipsController < ApplicationController

  def create
    if params.include?(:friend_id)
      @new_friendships = Friendship.create_reciprocal_for_ids(current_user_id, params[:friend_id])
    else
      friend_id = User.where(email: params["email"]).ids.pop
      @new_friendships = Friendship.create_reciprocal_for_ids(current_user.id, friend_id)
    end
    redirect_to dashboard_path
  end

  def destroy
    Friendship.destroy_reciprocal_for_ids(current_user_id, params[:friend_id])
    redirect_to(request.referer)
  end
end
