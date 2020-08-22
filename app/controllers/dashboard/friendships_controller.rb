class Dashboard::FriendshipsController < Dashboard::BaseController
  def create
    friend = User.find_by(email: params[:email])
    if friend.nil?
      flash[:error] = "User not found"
      redirect_to '/dashboard'
    else
      current_user.friends << friend
      flash[:success] = "You are now friends with #{friend.username}"
      redirect_to '/dashboard'
    end
  end
end
