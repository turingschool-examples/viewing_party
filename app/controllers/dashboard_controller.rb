class DashboardController < ApplicationController
  def index

  end

  def discover
    @user = current_user
  end
end
