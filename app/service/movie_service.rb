require 'faraday'
require 'json'

class MovieService
  def get_movie_data
    response1 = Faraday.get("https://api.themoviedb.org/3/movie/popular?api_key=7de6854d5aec975cccb0997bfb31ca9d&language=en-US&page=1")
    response2 = Faraday.get("https://api.themoviedb.org/3/movie/popular?api_key=7de6854d5aec975cccb0997bfb31ca9d&language=en-US&page=2")
    json1 = JSON.parse(response1.body, symbolize_names: true)
    json2 = JSON.parse(response2.body, symbolize_names: true)
    response = json1[:results] + json2[:results] # 40 movies returned
  end
end
