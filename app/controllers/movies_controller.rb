class MoviesController < ApplicationController
  def index
    conn = Faraday.new(url: "https://api.themoviedb.org")

    response = conn.get("/3/search/movie") do |rec|
      rec.params[:api_key] = ENV['TMDB_API_KEY']
      rec.params[:query] = params[:query]
      rec.params[:language] = 'en-US'
      rec.params[:page] = 1
      rec.params[:include_adult] = false
    end

    @movies = (JSON.parse(response.body, symbolize_names: true))[:results]
  end
end
