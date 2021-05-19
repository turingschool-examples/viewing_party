require 'faraday'
require 'json'
require 'pry'
require 'figaro'

class MovieFacade
  def self.popular_movies
    json = MovieService.get_popular_movies
    json.map { |movie_info| MovieInfo.new(movie_info) }
  end

  def self.search_results(search_params)
    json = MovieService.get_search_results(search_params)
    json.map { |search_results| MovieInfo.new(search_results) }
  end

  def self.movie_details(search_params)
    json = MovieService.get_movie_details(search_params)
    MovieInfo.new(json)
  end

  def self.movie_cast_details(search_params)
    json = MovieService.get_movie_cast_details(search_params)
    json.map { |cast| MovieCast.new(cast) }
  end

  def self.movie_review_details(search_params)
    json = MovieService.get_movie_review_details(search_params)
    json.map { |review| MovieReview.new(review) }
  end
end
