class MoviesController < ApplicationController
  def index
    query = params[:movie_title]
    conn = Faraday.new('https://api.themoviedb.org') do |f|
      f.params['api_key'] = '4e19f98a2287c879dc085f2087b387e5'
    end

    response = conn.get('/3/search/movie?') do |req|
      req.params[:query] = query
    end

    @titles = JSON.parse(response.body, symbolize_names: true)
  end
end
