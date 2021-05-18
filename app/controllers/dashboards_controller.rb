class DashboardsController < ApplicationController

  def index
    unless current_user == nil
      @users_friends = current_user.friends
    end
    # binding.pry
  end

end
