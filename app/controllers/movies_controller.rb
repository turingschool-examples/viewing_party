class MoviesController < ApplicationController
  def search
    @movies = Movie.search(params[:find_movies])
  end

  def top_rated
    @movies = Movie.get_movies
  end

  def show
    @movie = Movie.details(params[:id])
    @cast = Movie.cast(params[:id])
    @reviews = Movie.reviews(params[:id])
    @trailer = Movie.videos(params[:id])
    @recommended = Movie.recommended(params[:id])
  end

  private

  def movies_search_params
    params.require(:movie).permit(:find_movies, :id)
  end
end
