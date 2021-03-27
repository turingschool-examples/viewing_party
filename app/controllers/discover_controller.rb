class DiscoverController < ApplicationController
  before_action :require_current_user

  def index
    # @films = FilmSearch.new.top_40_films if params[:button_clicked]
    @user = current_user
  end

  private

  def require_current_user
    render file: '/public/401' unless current_user
  end
end
