class MoviesController < ApplicationController
  def index
    url = "https://api.themoviedb.org/3/discover/movie?api_key=#{ENV['TMDB_API_KEY']}"
    response = Faraday.get(url)
    json = JSON.parse(response.body, symbolize_names: true)
  end

  def search

  end
end