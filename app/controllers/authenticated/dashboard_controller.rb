class Authenticated::DashboardController < Authenticated::BaseController
  def show
    @user = current_user
    # @friend_list
  end
  
end
