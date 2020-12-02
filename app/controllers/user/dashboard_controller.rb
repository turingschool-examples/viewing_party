class User::DashboardController < User::BaseController
  def show
    current_user
  end
end
