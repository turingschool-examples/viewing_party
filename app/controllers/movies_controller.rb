class MoviesController < ApplicationController
  before_action :require_current_user

  def index
    @movies = MoviesFacade.top40
  end

  def search
    if params[:find_movie] == ''
      flash.now[:message] = 'Please enter a search term'
      @movies = MoviesFacade.top40
    elsif @movies.nil?
      @movies = MoviesFacade.movie_search(params[:find_movie])
      flash.now[:message] = 'Your search returned 0 results'
    else
      @movies = MoviesFacade.movie_search(params[:find_movie])
    end

    render :index
  end

  def show
    @movie = MoviesFacade.movie_info(params[:id])
    @cast = MoviesFacade.cast_info(params[:id])
    @reviews = MoviesFacade.movie_reviews(params[:id])
  end

  private

  def require_current_user
    render file: '/public/401' unless current_user
  end
end
