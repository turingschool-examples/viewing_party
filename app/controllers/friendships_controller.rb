class FriendshipsController < ApplicationController
  def create
    @user = current_user
    friend = User.search(params[:search].downcase).first

    if friend.nil?
      flash[:error] = 'No user found'
      redirect_to dashboard_path
    elsif @user.friends.include?(friend)
      flash[:notice] = 'You are already friends'
      redirect_to dashboard_path
    elsif friend == @user
      flash[:notice] = "That's you silly"
      redirect_to dashboard_path
    else
      @user.friends << friend
      flash[:notice] = 'You made a friend!'
      redirect_to dashboard_path
    end
  end
end
