class MoviesController < ApplicationController
  before_action :require_user_logged_in!

  def index
    movie = params[:movie]
    @movies = MoviesFacade.get_movies(movie)
    @top_movies = MoviesFacade.get_top_movies
    @reviews = ReviewsFacade.get_reviews(movie)
    # require 'pry'; binding.pry
  end

# movie show, movie_id passed as argument via params
  def show
  end

end
