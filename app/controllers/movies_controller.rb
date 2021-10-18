class MoviesController < ApplicationController
  def index
    if params[:search].present?
      @movies = MoviesFacade.search(params[:search])
    else
    @movies = MoviesFacade.top_40_movies
  end
  end
end
