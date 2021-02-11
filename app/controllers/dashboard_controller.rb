class DashboardController < ApplicationController
  def index
    @friends = current_user.get_friends
  end
end
