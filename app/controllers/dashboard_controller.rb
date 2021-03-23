class DashboardController < ApplicationController
  before_action :set_host, :require_user, :require_same_user

  def index
    @host = User.find(params[:user_id])
    @parties = Party.where(user_id: params[:user_id])
  end

  private
  def set_host
    @host = User.find(params[:user_id])
  end
end
