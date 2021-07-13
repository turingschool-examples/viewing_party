class Authenticated::DashboardController < Authenticated::BaseController

  def show
    @friends = Friend.where('friender_id = ?', current_user.id)
  end
  
end