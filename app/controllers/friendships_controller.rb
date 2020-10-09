class FriendshipsController < ApplicationController

  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    if @friendship.save
      flash[:success] = "Friend has been added"
      redirect_to '/dashboard'
    else
      flash[:notice] = "Please enter a valid user email"
      redirect_to '/dashboard'
    end
  end

  def destroy
    @friendship = Friendship.find(params[:id])
    @friendship.destroy
    flash[:notice]
    redirect
  end

end
