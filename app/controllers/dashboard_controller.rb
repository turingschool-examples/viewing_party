class DashboardController < ApplicationController
  before_action :require_user_logged_in!

  def index
    @user = Current.user
    @friends = Current.user.friends
    @viewing_parties = Current.user.parties
  end
end
