class SearchController < ApplicationController
  def index
    title = params["Search by movie title"]

    conn = Faraday.new("https://api.themoviedb.org") do |f|
      f.params[:api_key] = ENV["MOVIE_SEARCH_API_KEY"]
    end

    suffix = "/3/search/movie?"

    response = conn.get("#{suffix}&language=en-US&query=#{title}&page=1&include_adult=false")

    @movies = JSON.parse(response.body, symbolize_names: true)
    @search = @movies[:results].map do |search_data|
      Search.new(search_data)
    end
  end
end
