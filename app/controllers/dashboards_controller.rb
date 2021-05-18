class DashboardsController < ApplicationController
  def index
    @users_friends = current_user.friends
  end
end
