class MoviesController < ApplicationController
  def index
      @movies = MoviesFacade.find_movies_by_name(params[:query])
  end

  def show
    @movie = MoviesFacade.get_movie_info(params[:id])
  end
end
