class FriendshipsController < ApplicationController
  def create
    if User.where(email: params['email']).first.nil?
      flash[:error] = "I'm sorry, #{params['email']} cannot be found."
    else
      friend = User.where(email: params['email']).first
      @new_friendships = Friendship.create_reciprocal_for_ids(current_user.id, friend.id)
    end
    redirect_to dashboard_path
  end

  # def destroy
  #   Friendship.destroy_reciprocal_for_ids(current_user_id, params[:friend_id])
  #   redirect_to(request.referer)
  # end
end
