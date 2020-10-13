class MoviesController < ApplicationController
  def index
    if params[:title]
      search_by_title
    else
      @movies = MovieFacade.top_40
    end
  end

  def show
    @movie = MovieFacade.movie_details(params[:id])
  end

  def search_by_title
    if params[:title] == ""
      flash[:alert] = "Please enter a title"
      redirect_to '/discover'
    else
      find_movies
    end
  end

  def find_movies
    @movies = MovieFacade.find(params[:title])
    if @movies == []
      flash[:alert] = 'Sorry, no movies were found.'
      redirect_to '/discover'
    end
  end
end
