class MoviesController < ApplicationController
  before_action :initialize_movie_prosessing, only: [:index, :show]

  def index
    if current_user
      if params[:search] == "Top Rated"
        @results = @movie.top_rated_movies
      elsif params[:search]
        @results = @movie.search(params[:search])
      end
    else
      flash[:error] = "You must be logged in to view this page"
      redirect_to root_path
    end
  end

  def show
    @results = @movie.movie_info(550)
  end

  private
  def initialize_movie_prosessing
    @movie = MovieProsessing.new
  end
end
