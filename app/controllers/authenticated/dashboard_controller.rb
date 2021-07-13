class Authenticated::DashboardController < Authenticated::BaseController
  def show
    @user = current_user
  end
  
end
