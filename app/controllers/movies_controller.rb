class MoviesController < ApplicationController
  def search
    @movies = Movie.search(params[:find_movies])
  end

  def top_rated
    @movies = Movie.get_movies
  end

  private

  def movies_search_params
    params.require(:movie).permit(:find_movies)
  end
end
