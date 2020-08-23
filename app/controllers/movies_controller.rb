class MoviesController < ApplicationController
  def index
    if params[:search]
      @movies = MovieFacade.get_top_movies
    elsif params[:search_terms]
      keywords = params[:search_terms].gsub(' ', '+')
      @movies = MovieFacade.movies_from_search(keywords)
    end
  end

  def show
    id = params[:id]
    url = 'https://api.themoviedb.org'
    connection = Faraday.new(url)

    response = connection.get("/3/movie/#{id}") do |f|
      f.headers['Content-Type'] = 'application/json'
      f.params['api_key']       = ENV['TMDB_API_KEY']
    end
    parsed = JSON.parse(response.body, symbolize_names: true)
    # require "pry"; binding.pry
    @movie = Movie.new(parsed)

    response_cast = connection.get("/3/movie/#{id}/credits") do |f|
      f.headers['Content-Type'] = 'application/json'
      f.params['api_key']       = ENV['TMDB_API_KEY']
    end
    parsed_cast = JSON.parse(response_cast.body, symbolize_names: true)
    @cast = Cast.new(parsed_cast[:cast])

    response_review = connection.get("/3/movie/#{id}/reviews") do |f|
      f.headers['Content-Type'] = 'application/json'
      f.params['api_key']       = ENV['TMDB_API_KEY']
    end
    parsed_review = JSON.parse(response_review.body, symbolize_names: true)
    @review = Review.new(parsed_review[:results])
  end
end
