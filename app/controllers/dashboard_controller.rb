class DashboardController < ApplicationController

  def index
    @user = Current.user
    @friends = Current.user.friends
    @viewing_parties = Current.user.parties
  end

end
