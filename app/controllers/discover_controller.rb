class DiscoverController < ApplicationController
  def index
    unless current_user
      flash[:error] = "You must be logged in to view this page"
      redirect_to root_path
    end
  end
end
