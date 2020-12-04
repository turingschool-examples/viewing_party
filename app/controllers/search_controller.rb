class SearchController < ApplicationController
  def index
    title = params["Search by movie title"]

    conn = Faraday.new("https://api.themoviedb.org")
    suffix = "/3/search/movie?api_key="
    
    response = conn.get("#{suffix}3f3f1b6bf5a188108490867c4c43f1e4&language=en-US&query=#{title}&page=1&include_adult=false")

    @movies = JSON.parse(response.body, symbolize_names: true)
  end
end
