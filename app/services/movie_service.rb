require 'rails_helper'

class MovieService
  def conn
    Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
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
