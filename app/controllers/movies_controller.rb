class MoviesController < ApplicationController
  def index
    if params[:title]
      @movies = MovieFacade.find(params[:title])
      flash[:alert] = 'Sorry, no movies were found.' if @movies == []
    else
      @movies = MovieFacade.top_40
    end
  end

  def show
    @movie = MovieFacade.movie_details(params[:id]).first
  end
end
