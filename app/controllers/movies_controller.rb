class MoviesController < ApplicationController
  def index
    if params[:title]
      @movies = MovieFacade.find(params[:title]) unless params[:title] == ''
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

  def search_by_title
    if params[:title] == ''
      flash[:alert] = 'Please enter a title'
      redirect_to '/discover'
    else
      find_movies
    end
  end

  def find_movies
    @movies = MovieFacade.find(params[:title])
    return unless @movies == []

    flash[:fail] = 'Sorry, no movies were found.'
    redirect_to '/discover'
  end
end
