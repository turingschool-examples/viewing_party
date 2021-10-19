class MoviesController < ApplicationController
  def index
    @movies = if params[:search].present?
                MoviesFacade.search(params[:search])
              else
                MoviesFacade.top_40_movies
              end
  end
end
