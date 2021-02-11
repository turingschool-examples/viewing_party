class DashboardController < ApplicationController
  def index
    @parties = current_user.get_parties
  end
end
