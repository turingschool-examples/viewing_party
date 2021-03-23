class DashboardController < ApplicationController

  def index
    @host = User.find(params[:user_id])
    @parties = Party.where(user_id: params[:user_id])
  end
end