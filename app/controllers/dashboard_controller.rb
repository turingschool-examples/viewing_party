class DashboardController < ApplicationController
  def discover
    ## TEMP:
    @user = User.last
  end
end
