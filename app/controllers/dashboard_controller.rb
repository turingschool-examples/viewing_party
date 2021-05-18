class DashboardController < ApplicationController
  def index
    @user = current_user
    @friends = @user.friends
    # guests?
  end
end
