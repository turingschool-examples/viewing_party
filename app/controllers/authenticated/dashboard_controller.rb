class Authenticated::DashboardController < Authenticated::BaseController

  def show
    @friends = current_user.friends_list
  end
  
end