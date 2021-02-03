class MoviesController < ApplicationController
  def index
    movie = params[:movie_title]
    movie = "Fight Club"
    conn = Faraday.new("https://api.themoviedb.org")
    require 'pry'; binding.pry
    response = conn.get("/search/movies/#{movie}/550?api_key=f54bbd3f0b8d80da437d651c3c2f00b1")
    data = JSON.parse(response.body, symbolize_names: true)
  end
end
