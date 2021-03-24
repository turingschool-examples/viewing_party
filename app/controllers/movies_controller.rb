class MoviesController < ApplicationController
  before_action :initialize_movie_prosessing, only: [:index]

  def index
    if params[:search] == "Top Rated"
      @results = @movie.top_rated_movies
    elsif params[:search]
      @results = @movie.search(params[:search])
    end
  end

  private
  def initialize_movie_prosessing
    @movie = MovieProsessing.new
  end
end
