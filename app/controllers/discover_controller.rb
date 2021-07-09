class DiscoverController < ApplicationController

  def index
    @top_movies = ImdbService.top_movies
  end
  
end