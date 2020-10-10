class MoviesController < ApplicationController
  def index; end

  def show

  end

  def search
    if params[:keywords].nil? || params[:keywords] == ''
      top_40
    else
      keywords
    end
  end

  def keywords
    keywords = params[:keywords]

    conn = Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.headers['X-API-Key'] = ENV['MOVIEDB_API_KEY']
    end

    page1 = conn.get("3/search/movie?api_key=#{ENV['MOVIEDB_API_KEY']}&language=en-US&query=#{keywords}&page=1")
    page2 = conn.get("3/search/movie?api_key=#{ENV['MOVIEDB_API_KEY']}&language=en-US&query=#{keywords}&page=2")

    json1 = JSON.parse(page1.body, symbolize_names: true)
    json2 = JSON.parse(page2.body, symbolize_names: true)

    movies = json1[:results] + json2[:results]

    movies.each do |movie|
      Movie.create(title: movie[:title], vote_average: movie[:vote_average], genre: movie[:genre_ids], summary: movie[:overview], total_reviews: movie[:vote_count])
    end

    @movies_info = Movie.all
  end

  def top_40
    conn = Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.headers['X-API-Key'] = ENV['MOVIEDB_API_KEY']
    end

    page1 = conn.get("/3/movie/top_rated?api_key=#{ENV['MOVIEDB_API_KEY']}&language=en-US&page=1")
    page2 = conn.get("/3/movie/top_rated?api_key=#{ENV['MOVIEDB_API_KEY']}&language=en-US&page=2")

    json1 = JSON.parse(page1.body, symbolize_names: true)
    json2 = JSON.parse(page2.body, symbolize_names: true)

    movies = json1[:results] + json2[:results]

    movies.each do |movie|
      Movie.create(title: movie[:title], vote_average: movie[:vote_average], genre: movie[:genre_ids], summary: movie[:overview], total_reviews: movie[:vote_count])
    end

    @movies_info = Movie.all


  end
end
