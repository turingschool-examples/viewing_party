class FriendshipsController < ApplicationController
  def create
    new_friend = User.find_by(email: params['email'])

    if params['email'] && new_friend
      Friendship.create(user_id: session[:user_id], friend_id: new_friend.id)
      redirect_to dashboard_path
    else
      flash[:notice] = 'That user does not exist'
      redirect_to dashboard_path
    end
  end
end
