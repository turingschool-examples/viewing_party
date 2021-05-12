class DashboardController < ApplicationController
  def index
    @user_email = params[:user_email]
  end
end
