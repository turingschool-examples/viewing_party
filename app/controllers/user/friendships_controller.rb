class User::FriendshipsController < User::BaseController
  def create
    friend = User.find_by(email: params[:friends_email])
    if friend
      Friendship.create(user_id: current_user.id, friend_id: friend.id)
      redirect_to user_dashboard_path
    else
      flash[:error] = 'Sorry, I cannot find your friend.'
      render 'user/dashboard/show'
    end
  end
end
