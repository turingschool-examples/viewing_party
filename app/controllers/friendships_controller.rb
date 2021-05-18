class FriendshipsController < ApplicationController
  def create
    @user = current_user
    friend = User.search(params[:search]).first

    if friend.nil?
      flash[:error] = 'No user found'
      redirect_to dashboard_path
    else
      @user.friends << friend
      flash[:notice] = 'You made a friend!'
      redirect_to dashboard_path

    end
  end
end
