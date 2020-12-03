class MoviesController < ApplicationController
  def index
    @titles = MovieApiService.movie_search(params[:movie_title])
  end

  def top_rated
    @top_movies = MovieApiService.top_rated_movies
  end
end
