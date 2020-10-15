class User::DashboardController < ApplicationController
  def index
    @invited_parties = current_user.invited_parties
    @host_parties = current_user.host_parties
  end
end
