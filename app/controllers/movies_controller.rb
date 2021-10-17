class MoviesController < ApplicationController
  def index
    @movies = MoviesFacade.new.top_40_movies
  end
end
