class FriendsController < ApplicationController
  def create
    friend = User.find_by(email: params[:friend])
    new_friend = Friend.new(user: current_user, friend: friend)
    if friend && friend.id == current_user.id
      sad_path('You cant be friends with yourself!')
    elsif new_friend.save
      redirect_to dashboards_path
    else
      sad_path('This user does not exist, or you are already their friend')
    end
  end

  private

  def sad_path(message)
    redirect_to dashboards_path
    flash[:error] = message
  end
end
