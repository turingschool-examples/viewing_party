class MoviesController < ApplicationController
  def index
    conn = Faraday.new("https://api.themoviedb.org") do |f|
      f.params[:api_key] = ENV["MOVIE_SEARCH_API_KEY"]
    end

    suffix = "/3/movie/top_rated?"
    @movie_results = []
    page = 1

    until @movie_results.length == 40
      response = conn.get("#{suffix}&language=en-US&page=#{page}")
      @json = JSON.parse(response.body, symbolize_names: true)
      @json[:results].each { |f| @movie_results << f }
      page += 1
    end
    @movie_results
  end

  def show

    # https://api.themoviedb.org/3/movie/230/credits?api_key=3f3f1b6bf5a188108490867c4c43f1e4&language=en-US
    id = params["id"].to_i
    conn = Faraday.new("https://api.themoviedb.org") do |f|
      f.params[:api_key] = ENV["MOVIE_SEARCH_API_KEY"]
    end

    suffix = "/3/movie/#{id}"

    credits_response = conn.get("#{suffix}/credits?")
    @credits = JSON.parse(credits_response.body, symbolize_names: true)

    details_response = conn.get("#{suffix}?")
    @details = JSON.parse(details_response.body, symbolize_names: true)

    reviews_response = conn.get("#{suffix}/reviews?")
    @reviews = JSON.parse(reviews_response.body, symbolize_names: true)
  end
end
