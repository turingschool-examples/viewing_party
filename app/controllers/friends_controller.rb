class FriendsController < ApplicationController

  def create
    friend = User.find_by(email: params[:friend_email])
    if friend == nil
      flash[:error] = 'Error, friend does not have an account'
    elsif friend.email == current_user.email
      flash[:error] = 'Error, cannot friend yourself'
    else
      friend_add = Friend.new(friender: current_user, friendee: friend)
      if friend_add.save
        flash[:error] = 'Friend Added!'
      else
        flash[:error] = friend_add.errors.full_messages
      end
    end
    redirect_to '/dashboard'
  end
end