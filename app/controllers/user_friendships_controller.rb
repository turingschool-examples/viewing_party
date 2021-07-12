class UserFriendshipsController < ApplicationController
  def create
    user = User.find(session[:user_id])
    friend = User.find_by(email: params[:email])

    if friend.nil?
      flash[:error] = 'That user has not yet registered with this platform.'
      redirect_to '/dashboard'
    elsif !friend.nil? && !user.friends.where('email = ?', friend.email).nil?
      flash[:error] = 'You are already friends with that user'
      redirect_to '/dashboard'
    elsif !friend.nil? && !user.friends.include?(friend.email)
      UserFriendship.create(user: user, friend: friend)
      redirect_to '/dashboard'
    end
  end
end
