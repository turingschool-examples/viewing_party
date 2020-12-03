class MoviesController < ApplicationController
  def top_rated
    @array = MovieApiService.top_rated_movies
  end
end
