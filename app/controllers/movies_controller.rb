class MoviesController < ApplicationController
  def index
    query = params[:movie_title]
    conn = Faraday.new('https://api.themoviedb.org') do |f|
      f.params['api_key'] = ENV['MOVIE_DB_API_KEY']
    end

    @titles = []
    page_number = 0
    2.times do
      page_number += 1
      response = conn.get("/3/search/movie?&page=#{page_number}") do |req|
        req.params[:query] = query
      end

      title_data = JSON.parse(response.body, symbolize_names: true)

      @titles << title_data[:results]
    end

    @titles = @titles.flatten
  end
end
