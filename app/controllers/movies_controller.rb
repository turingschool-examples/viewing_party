class MoviesController < ApplicationController
  def index
    conn = Faraday.new(url: "https://api.themoviedb.org/3/movie/76341?api_key=#{ENV['MOVIE_DATA_BASE_API_KEY']}")

    response = conn.get
    json = JSON.parse(response.body, symbolize_names: true)
    @movie = json
  end

  def top_rated

  end
end
