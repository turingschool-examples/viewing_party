
class DashboardController < ApplicationController
  def index
    @user = User.find_by(params[:id])
    @user_email = params[:user_email]
  end
end