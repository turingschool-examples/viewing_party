class MoviesController < ApplicationController
  def index
    data = MoviedbService.new.get_popular_movies
    @top_20_movies = data[:results].map do |movie|
      Movie.new(movie)
    end
  end

  def show
  end
end
