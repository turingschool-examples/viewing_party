class MoviesController < ApplicationController
  def index
    movie = params[:movie]
    # movie = "Fight Club"
    conn = Faraday.new("https://api.themoviedb.org")
    response = conn.get("/3/search/movie?api_key=f54bbd3f0b8d80da437d651c3c2f00b1&query=#{movie}")
    # https://api.themoviedb.org search/movie?api_key=f54bbd3f0b8d80da437d651c3c2f00b1&query=unbroken
    @movie = JSON.parse(response.body, symbolize_names: true)
    # require 'pry'; binding.pry
    
  end
end
