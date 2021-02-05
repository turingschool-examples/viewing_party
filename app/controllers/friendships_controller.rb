class FriendshipsController < ApplicationController
  def create
    friend = User.find_by(email: params[:email])
    if friend
      if friend.id == current_user.id
        redirect_to dashboard_path, notice: 'Failed Friend Request. Cannot Friend Yourself!'
      elsif current_user.friends.include?(friend)
        redirect_to dashboard_path, notice: "Failed Friend Request. Already Friended User: #{friend.name}"
      else
        current_user.friendships.create!({ friend_id: friend.id })
        redirect_to dashboard_path
      end
    else
      redirect_to dashboard_path, notice: "Failed Friend Request. Unable to find user with email: #{params[:email]}'"
    end
  end
end
