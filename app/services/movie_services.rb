require 'faraday'
require 'json'
require 'pry'

class MovieService
  def films
    huh = [1,2].reduce([]) do |memo, page|
      response = Faraday.get "https://api.themoviedb.org/3/movie/top_rated?api_key=a244b7764edb56d5c37b7b47b5ab9e43&language=en-US&page=#{page}"
      parsed = JSON.parse(response.body, symbolize_names: true)
      films = parsed[:results]
      memo << films
    end.flatten(1)
  end
end
