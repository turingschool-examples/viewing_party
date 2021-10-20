class MoviesController < ApplicationController
  def index
    @user = current_user

    @movies = if params[:query].nil?
                MovieFacade.forty_top_rated_movies
              else
                params[:query].present?
                MovieFacade.search_movie_title(params[:query])
              end
  end

  def show
    @movie = MovieFacade.movie_info_by_id(params[:movie_id])
  end

  def discover
    @user = current_user
  end
end
