class Authenticated::DashboardController < Authenticated::BaseController

  def show
    @friends = friends_list
  end
  
end