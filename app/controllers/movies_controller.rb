class MoviesController < ApplicationController
  def index
    @user = current_user

    if params[:query].nil?
      @movies = MovieFacade.forty_top_rated_movies
    elsif params[:query].present?
      @movies = MovieFacade.search_movie_title(params[:query])
    else
      @movies = []
    end
  end

  def show
    @movie = MovieFacade.movie_info_by_id(:movie_id)
  end

  def discover
    @user = current_user
  end
end
