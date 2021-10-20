class MoviesController < ApplicationController
  def index
    @user = current_user
    # binding.pry
    @movies = if params[:top_forty].present?
                MovieFacade.forty_top_rated_movies
              elsif params[:query].present?
                MovieFacade.search_movie_title(params[:query])
              elsif params[:now_playing].present?
                MovieFacade.now_playing
              elsif params[:coming_soon].present?
                MovieFacade.upcoming
              end
  end

  def show
    @movie = MovieFacade.movie_info_by_id(params[:movie_id])
  end

  def discover
    @user = current_user
  end
end
