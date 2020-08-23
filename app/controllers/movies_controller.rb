class MoviesController < ApplicationController
  def index
    if params[:search]
      @movies = MovieFacade.get_top_movies
    elsif params[:search_terms]
      keywords = params[:search_terms].gsub(' ', '+')
      url = 'https://api.themoviedb.org'
      connection = Faraday.new(url)

      response_1 = connection.get('/3/search/movie') do |f|
        f.headers['Content-Type'] = 'application/json'
        f.params['api_key']       = ENV['TMDB_API_KEY']
        f.params['query']         = keywords
      end

      response_2 = connection.get('/3/search/movie') do |f|
        f.headers['Content-Type'] = 'application/json'
        f.params['api_key']       = ENV['TMDB_API_KEY']
        f.params['query']         = keywords
        f.params['page']          = '2'
      end

      parsed_1 = JSON.parse(response_1.body, symbolize_names: true)
      parsed_2 = JSON.parse(response_2.body, symbolize_names: true)

      parsed_movies = parsed_1[:results] << parsed_2[:results]

      @movies = parsed_movies.flatten.map do |movie_info|
        Movie.new(movie_info)
      end
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
