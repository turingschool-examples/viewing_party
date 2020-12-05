class MoviesController < ApplicationController
  def index
    conn = Faraday.new(url: 'https://api.themoviedb.org')
    uri = params[:query].nil? ? 'movie/top_rated' : 'search/movie'

    @movies = []
    2.times do |n|
      response = conn.get("/3/#{uri}") do |rec|
        rec.params[:api_key] = ENV['TMDB_API_KEY']
        rec.params[:query] = params[:query] if params[:query]
        rec.params[:language] = 'en-US'
        rec.params[:page] = 1 + n
        rec.params[:include_adult] = false
      end.body
      @movies << JSON.parse(response, symbolize_names: true)[:results]
    end
    @movies.flatten!
  end
end
