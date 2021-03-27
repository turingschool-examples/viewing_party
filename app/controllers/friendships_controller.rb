class FriendshipsController < ApplicationController
  before_action :find_friend, only: [:create]

  def create
    if @friend
      current_user.friends.push(@friend)
      flash[:success] = "You are now following #{@friend.email}!"
      redirect_to dashboard_path
    else
      flash[:error] = 'That user does not exist. Enter a valid email'
      redirect_to dashboard_path
    end
  end

  private

  def find_friend
    @friend = User.find_by(email: params[:email])
  end
end
