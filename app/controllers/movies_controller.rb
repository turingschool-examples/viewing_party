class MoviesController < ApplicationController

  def index
    @movie_search = ImdbService.top_movies_search(params[:movie_title])
  end
  
  def show
    @movie = ImdbService.movie_data(params[:id])
    @cast = ImdbService.movie_cast(params[:id])
    @reviews = ImdbService.movie_reviews(params[:id])
  end
end