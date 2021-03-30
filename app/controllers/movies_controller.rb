class MoviesController < ApplicationController
  def index
    if current_user
      @results = MovieFacade.search_results(params[:search], 40)
    else
      flash[:error] = 'You must be logged in to view this page'
      redirect_to root_path
    end
  end

  def show
    @movie = MovieFacade.movie_info(params[:id])
  end
end
