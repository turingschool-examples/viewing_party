class DashboardController < ApplicationController
  def index
    if current_user
      @followers = current_user.followers
      @followees = current_user.followees
    else
      redirect_to new_user_path
    end
  end
end
