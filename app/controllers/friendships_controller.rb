class FriendshipsController < ApplicationController
  def create
    friend = User.find_by(email: params[:email])
    if !friend.nil?
      Friendship.create_reciprocal_for_ids(current_user.id, friend.id)
    else
      flash[:error] = "I'm sorry. You're friend cannot be found."
    end
    redirect_to user_dashboard_path(current_user.id)
  end
end
