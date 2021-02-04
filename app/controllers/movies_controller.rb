class MoviesController < ApplicationController
  def index
    movie = params[:movie]
    @movie = MoviesFacade.get_a_movie(movie)
    
  end
end
