class DiscoverController < ApplicationController
  before_action :require_current_user

  def index
    # binding.pry
    @user = User.find(session[:user_id])
  end

  private

  def require_current_user
    render file: '/public/401' unless current_user
  end
end
