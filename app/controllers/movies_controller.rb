class MoviesController < ApplicationController
  def index
    @movies = MovieFacade.search(params[:query])
  end

  def show
    @movie = MovieFacade.details(params[:id])
    # WTF should we do about this???
    @cast = @movie.cast[0..9]
    @reviews = @movie.reviews
  end
end
