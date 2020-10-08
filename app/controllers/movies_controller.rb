class MoviesController < ApplicationController
  def index; end

  def search
    @api_key = ENV['MOVIEDB_API_KEY']
    if params[:keywords].nil? || params[:keywords] == ''
      top_40
    else
      keywords
    end
  end

  def keywords
    keywords = params[:keywords]

    conn = Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.headers['X-API-Key'] = @api_key
    end

    page1 = conn.get("3/search/movie?api_key=#{@api_key}&language=en-US&query=#{keywords}&page=1&include_adult=false&page=1")
    page2 = conn.get("3/search/movie?api_key=#{@api_key}&language=en-US&query=#{keywords}&page=1&include_adult=false&page=2")

    json1 = JSON.parse(page1.body, symbolize_names: true)
    json2 = JSON.parse(page2.body, symbolize_names: true)

    movies = json1[:results] + json2[:results]

    @movies_info = movies.pluck(:title).zip(movies.pluck(:vote_average))
  end

  def top_40
    conn = Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.headers['X-API-Key'] = @api_key.to_s
    end

    page1 = conn.get("/3/movie/top_rated?api_key=#{@api_key}&language=en-US&page=1")
    page2 = conn.get("/3/movie/top_rated?api_key=#{@api_key}&language=en-US&page=2")

    json1 = JSON.parse(page1.body, symbolize_names: true)
    json2 = JSON.parse(page2.body, symbolize_names: true)
    movies = json1[:results] + json2[:results]

    @movies_info = movies.pluck(:title).zip(movies.pluck(:vote_average))
  end
end
