class DiscoverController < ApplicationController
  def index
    @upcoming = MovieFacade.fetch_upcoming_movies if params[:upcoming]
  end
end
