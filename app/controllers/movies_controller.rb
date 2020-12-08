class MoviesController < ApplicationController
  def index
    @movies = MovieFacade.search(params[:query])
  end

  def show
    @movie = MovieFacade.details(params[:id])
    @cast = @movie.cast[0..9]
    @reviews = @movie.reviews
  end
end
