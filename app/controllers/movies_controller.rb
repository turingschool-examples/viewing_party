class MoviesController < ApplicationController
  before_action :require_user

  def index
    if params[:search]
      api_key = ENV['MOVIE_API_KEY']
      conn = Faraday.new(url: 'https://api.themoviedb.org')
      response = conn.get("/3/search/movie?api_key=#{api_key}&language=en-US&query=#{params[:search]}&page=1&include_adult=false")
      response2 = conn.get("/3/search/movie?api_key=#{api_key}&language=en-US&query=#{params[:search]}&page=2&include_adult=false")
      json = JSON.parse(response.body, symbolize_names: true)
      json2 = JSON.parse(response2.body, symbolize_names: true)
      first20 = json[:results]
      first20 << json2[:results]
      @results = first20.flatten
    else
      @results = Movie.new.get_movies(40)
    end
    # api_key = ENV['MOVIE_API_KEY']
    # conn = Faraday.new(url: 'https://api.themoviedb.org')
    # response = conn.get("/3/movie/top_rated?api_key=#{api_key}&language=en-US&page=1")
    # response2 = conn.get("/3/movie/top_rated?api_key=#{api_key}&language=en-US&page=2")
    # @json = JSON.parse(response.body, symbolize_names: true)
    # @json2 = JSON.parse(response2.body, symbolize_names: true)
  end
end
