require 'faraday'
require 'json'
require 'figaro'

class MovieService
  def conn
    Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      # faraday.headers["Authorization"] = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3ZmZhODk2N2Q3NGE0ZGZkYWQyZDUyZGM1Yjk4ZGM0OCIsInN1YiI6IjVmN2JhNWM2OWE2NDM1MDAzNmE4YWM4MyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.lXSxQj059-ewywC8SfzpoCdaB8zvWob3IQ923kQl59U'
      # faraday.headers["Content-Type"] = 'application/json;charset=utf-8'
    end
  end

  def top_40_first_half
    connection = conn.get("/3/movie/top_rated?api_key=#{ENV['MOVIE_API_KEY']}&language=en-US&page=1")
    JSON.parse(connection.body, symbolize_names: true)
  end

  def top_40_second_half
    connection = conn.get("/3/movie/top_rated?api_key=#{ENV['MOVIE_API_KEY']}&language=en-US&page=2")
    JSON.parse(connection.body, symbolize_names: true)
  end

  def example_movie_request
    connection = conn.get("/3/movie/76341?api_key=#{ENV['MOVIE_API_KEY']}")
    JSON.parse(connection.body, symbolize_names: true)
  end
end
