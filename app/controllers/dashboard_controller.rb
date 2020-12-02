class DashboardController < ApplicationController
  def index

  end
  
  def discover
    ## TEMP:
    @user = User.last
  end
end
