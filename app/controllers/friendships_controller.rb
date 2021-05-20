class FriendshipsController < ApplicationController
  def create
    @user = current_user
    friend = User.search(params[:search].downcase).first
    if friend.nil?
      flash[:error] = 'No user found'
    elsif @user.friends.include?(friend)
      flash[:notice] = 'You are already friends'
    elsif friend == @user
      flash[:notice] = "That's you silly"
    else
      @user.friends << friend
      flash[:notice] = 'You made a friend!'
    end
    redirect_to dashboard_path
  end
end
