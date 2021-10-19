class FriendshipsController < ApplicationController
  def create
    friend = User.where('email = ?', friendship_params[:friend_email]).first
    if friend && friend != current_user
      if current_user.current_friend(friend)
        flash[:error] = "#{friend.full_name} is already your friend."
      else
        Friendship.create(user: current_user, friend: friend)
        flash[:success] = "#{friend.full_name} is now your friend!"
      end
    elsif friend == current_user
      flash[:error] = 'You cannot add yourself as a friend.'
    else
      flash[:error] = 'Sorry, no user exists by that email.'
    end
    redirect_to dashboard_path
  end

  private

  def friendship_params
    params.require(:friendship).permit(:friend_email)
  end
end
