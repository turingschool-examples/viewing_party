class DiscoverController < ApplicationController
  def index
    conn = Faraday.new(url: 'https://api.themoviedb.org/3')
    # movie_id = params[:movie_id]
    response = conn.get("discover/movie?api_key=#{ENV["TMDB_API_KEY"]}&sort_by=popularity.desc&page=1")
    json = JSON.parse(response.body, symbolize_names: true)
    @movies = json[:results].map do |movie_data|
      Movie.new(movie_data)
    end
  end
end
