class MoviesController < ApplicationController
  before_action :require_user
  def index
    if params[:search]
      # api_key = ENV['MOVIE_API_KEY']
      # conn = Faraday.new(url: 'https://api.themoviedb.org')
      # response = conn.get("/3/search/movie?api_key=#{api_key}&language=en-US&query=#{params[:search]}&page=1&include_adult=false")
      # response2 = conn.get("/3/search/movie?api_key=#{api_key}&language=en-US&query=#{params[:search]}&page=2&include_adult=false")
      # json = JSON.parse(response.body, symbolize_names: true)
      # json2 = JSON.parse(response2.body, symbolize_names: true)
      # first20 = json[:results]
      # first20 << json2[:results]
      # @results = first20.flatten
      @results = SearchFacade.search_movies(params[:search], ENV['MOVIE_API_KEY'])
    else
      @results = SearchFacade.get_40_movies(40, ENV['MOVIE_API_KEY'])
    end
  end

  def show
    # @movie = Movie.new.get_specific_movie(params[:id].to_i)
    @movie = SearchFacade.get_specific_movie(params[:id].to_i, ENV['MOVIE_API_KEY'])
    @runtime = MovieStats.calculate_time(@movie)
    cast = SearchFacade.find_cast(params[:id].to_i, ENV['MOVIE_API_KEY'])
    @cast = if cast.length >= 10
              SearchFacade.find_cast(params[:id].to_i, ENV['MOVIE_API_KEY'])[0..9]
            else
              SearchFacade.find_cast(params[:id].to_i, ENV['MOVIE_API_KEY'])
            end
    @reviews = SearchFacade.find_reviews(params[:id].to_i, ENV['MOVIE_API_KEY'])
  end
end
