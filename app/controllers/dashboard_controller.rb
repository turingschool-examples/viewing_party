class DashboardController < ApplicationController
  def index

    @parties = !!current_user ? current_user.get_parties : {invited: [], hosting: []}
  end
end
