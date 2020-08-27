class FriendshipsController < ApplicationController
  before_action :require_authenticated_user

  def create
    friend = User.find_by(email: params[:friend_email])
    if friend && friend != current_user
      Friendship.create_mutual_friendship(current_user.id, friend.id)
      flash[:success] = 'You have a new friend!'
    else
      flash[:error] = 'Sorry, your friend cannot be found.'
    end
    redirect_to request.referer
  end
end
