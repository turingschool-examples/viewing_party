class MoviesController < ApplicationController
  def index
  end

  def find_top_movie_titles
    response = Faraday.get("https://api.themoviedb.org/3/discover/movie?api_key=54db8c6468269696f6e3cf41f6f27821")
    top_titles = []
    JSON.parse(response.body)["results"].each do |movie|
      top_titles < movie["title"]
    end
    top_titles
  end

  def find_top_movie_vote_average
    response = Faraday.get("https://api.themoviedb.org/3/discover/movie?api_key=54db8c6468269696f6e3cf41f6f27821")
    top_va = []
    JSON.parse(response.body)["results"].each do |movie|
      top_va < movie["vote_average"]
    end
    top_va
  end
end
