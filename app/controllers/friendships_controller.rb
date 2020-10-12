class FriendshipsController < ApplicationController
  def create
    user = User.find(current_user.id)
    friend = User.find_by(email: params[:email])
    friendship1 = Friendship.new(user: user, friend: friend)
    friendship2 = Friendship.new(user: friend, friend: user)
    if friendship1.save && friendship2.save
      flash[:success] = 'Friend has been added'
    else
      flash[:notice] = 'Sorry, friend cannot be found'
    end
    redirect_to '/dashboard'
  end
end
