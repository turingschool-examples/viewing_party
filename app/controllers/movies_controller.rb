class MoviesController < ApplicationController
  def index
    @movies = MoviesFacade.movies
  end
end
