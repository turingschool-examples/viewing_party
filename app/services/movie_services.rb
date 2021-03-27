require 'faraday'
require 'json'
require 'pry'
require 'figaro'

class MovieService

  def get_data(arg)
    response = Faraday.get("https://api.themoviedb.org/3/#{arg}") do |request|
      request.params['api_key'] = ENV['MOVIE_API']
      request.params['language'] = 'en-US'
    end
  end

  def films(page)
    response = get_data("movie/top_rated?page=#{page}")
    parsed = JSON.parse(response.body, symbolize_names: true)
  end

  def film_finder(query)
    response = Faraday.get "https://api.themoviedb.org/3/search/movie?api_key=#{ENV['MOVIE_API']}&language=en-US&query=#{query}&page=1&include_adult=false"
  end
end
