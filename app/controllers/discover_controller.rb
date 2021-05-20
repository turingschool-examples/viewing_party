class DiscoverController < ApplicationController
  def index
    if params[:upcoming]
      @upcoming = MovieFacade.fetch_upcoming_movies
    end
  end
end
