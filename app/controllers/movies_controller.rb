class MoviesController < ApplicationController
  def index
    if params[:search].present?
      @movies = MoviesFacade.new.search(params[:search])
    else
    @movies = MoviesFacade.new.top_40_movies
  end
  end
end
