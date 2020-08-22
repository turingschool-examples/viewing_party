class MoviesController < ApplicationController
  def index
    if params[:search] == 'top_rated'
      url = 'https://api.themoviedb.org'
      connection = Faraday.new(url)

      response_1 = connection.get('/3/movie/top_rated') do |f|
        f.headers['Content-Type'] = 'application/json'
        f.params['api_key']       = ENV['TMDB_API_KEY']
      end

      response_2 = connection.get('/3/movie/top_rated') do |f|
        f.headers['Content-Type'] = 'application/json'
        f.params['api_key']       = ENV['TMDB_API_KEY']
        f.params['page']          = '2'
      end

      parsed_1 = JSON.parse(response_1.body, symbolize_names: true)
      parsed_2 = JSON.parse(response_2.body, symbolize_names: true)

      top_40 = parsed_1[:results] << parsed_2[:results]

      @movies = top_40.flatten.map do |movie_info|
        Movie.new(movie_info)
      end
    end
  end
end