class Authenticated::DashboardController < Authenticated::BaseController
  def show
    # require "pry"; binding.pry
    @user = current_user
    @friend_list = @user.friendships.map do |friend|
      User.find(friend.friend_id)
    end
    # require "pry"; binding.pry
  end

end
