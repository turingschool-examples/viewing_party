class DashboardController < ApplicationController
  def index
    return not_logged_in_notice unless current_user

    flash[:success] = "Welcome, #{current_user.name}"
  end

  private

  def not_logged_in_notice
    flash[:notice] = 'You Must Log In To Visit Your Dashboard'
    redirect_to login_path
  end
end
