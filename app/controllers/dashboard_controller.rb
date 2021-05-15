class DashboardController < ApplicationController
  def index
    @friends = current_user.followers
  end
end
