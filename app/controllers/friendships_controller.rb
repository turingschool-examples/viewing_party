class FriendshipsController < ApplicationController
  def create
    friend = User.where('email = ?', friendship_params[:friend_email]).first
    if friend && friend != current_user
      Friendship.create(user: current_user, friend: friend)
      flash[:success] = "#{friend.full_name} is now your friend!"
      redirect_to dashboard_path
    elsif friend == current_user
      flash[:error] = 'You cannot add yourself as a friend.'
      redirect_to dashboard_path
    else
      flash[:error] = 'Sorry, no user exists by that email.'
      redirect_to dashboard_path
    end
  end

  private

  def friendship_params
    params.require(:friendship).permit(:friend_email)
  end
end
