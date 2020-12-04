class User::FriendshipsController < User::BaseController
  def create
    friend = User.find_by(email: params[:friends_email])
    if friend
      new_friend = Friendship.new(user_id: current_user.id, friend_id: friend.id)
      flash[:error] = 'You have already added that friend.' unless new_friend.save
    else
      flash[:error] = 'Sorry, I cannot find your friend.'
    end
    redirect_to user_dashboard_path
  end
end
