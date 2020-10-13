class MoviesController < ApplicationController
  def index
    if params[:title]
      @movies = MovieFacade.find(params[:title])
      redirect_to '/discover' if @movies == []
      flash[:alert] = 'Sorry, no movies were found.' if @movies == []
    else
      @movies = MovieFacade.top_40
    end
  end

  def show
    @movie = MovieFacade.movie_details(params[:id])
    session[:movie_id] = @movie.movie_id
  end
end
