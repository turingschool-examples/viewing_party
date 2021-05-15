class MoviesController < ApplicationController
  def index
    @top_20_movies = MoviedbService.new.get_popular_movies
  end

  def show
  end
end
