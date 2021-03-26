class MoviesController < ApplicationController
  before_action :current_user

  def index
    if params[:search]
      @movies = MovieService.movie_search_objects(params[:search])
    elsif params[:top_40]
      @movies = MovieService.top_40_objects
    else
      redirect_to discover_index_path
    end
  end

  def show
    @movie ||= MovieService.movie_object(params[:id])
    @genres = @movie.genres
    @cast = @movie.first_10_cast_members
    @reviews = @movie.review_authors
  end
end
