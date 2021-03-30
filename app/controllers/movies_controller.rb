class MoviesController < ApplicationController

  def index
    if current_user
      if params[:search] == "Top Rated"
        @results = MovieFacade.top_rated(40)
      elsif params[:search] && params[:search] != ""
        @results = MovieFacade.search(params[:search], 40)
      end
    end
  end

  def show
    @movie = MovieFacade.movie_info(params[:id])
  end
end
