class DashboardController < ApplicationController
  def index
    if current_user
      flash[:success] = "Welcome, #{current_user.name}"
    else
      flash[:notice] = "You Must Log In To Visit Your Dashboard"
      redirect_to login_path
    end
  end
end
