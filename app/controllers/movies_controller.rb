class MoviesController < ApplicationController
  def index
    @movies = Movie.search(params[:search])
  end

  def self.search
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

  def find_movies_by_name(search)
    name_search = params(:search).gsub(" ", "%20")
    titles = []
    response = Faraday.get("https://api.themoviedb.org/3/search/movie?api_key=54db8c6468269696f6e3cf41f6f27821&language=en-US&query=#{name_search}&page=1&include_adult=false")

    JSON.parse(response.body)["results"].each do |movie|
      titles < movie["title"]
    end
    titles
  end

  def find_vote_average_by_name(search)
    name_search = params(:search).gsub(" ", "%20")

    va = []

    response = Faraday.get("https://api.themoviedb.org/3/search/movie?api_key=54db8c6468269696f6e3cf41f6f27821&language=en-US&query=#{name_search}&page=1&include_adult=false")

    JSON.parse(response.body)["results"].each do |movie|
      va < movie["vote_average"]
    end
    va
  end

  def movie_params
    params.require(:movie).permit(:name, :super_name, :superpower_id, :search)
  end
end
