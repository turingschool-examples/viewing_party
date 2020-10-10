class MoviesController < ApplicationController
  def index; end

  def show
    conn = Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.headers['X-API-Key'] = ENV['MOVIEDB_API_KEY']
    end

    movie = conn.get("/3/movie/#{params[:id]}?api_key=#{ENV['MOVIEDB_API_KEY']}&language=en-US")
    @movie_details = JSON.parse(movie.body, symbolize_names: true)

    credits = conn.get("/3/movie/#{params[:id]}/credits?api_key=#{ENV['MOVIEDB_API_KEY']}")
    credits_details = JSON.parse(credits.body, symbolize_names: true)
    @actors = credits_details[:cast].take(10)

    reviews = conn.get("/3/movie/#{params[:id]}/reviews?api_key=#{ENV['MOVIEDB_API_KEY']}&language=en-US&page=1")
    @reviews_details = JSON.parse(reviews.body, symbolize_names: true)[:results]

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

    page1 = conn.get("/3/search/movie?api_key=#{ENV['MOVIEDB_API_KEY']}&language=en-US&query=#{keywords}&page=1")
    page2 = conn.get("/3/search/movie?api_key=#{ENV['MOVIEDB_API_KEY']}&language=en-US&query=#{keywords}&page=2")

    json1 = JSON.parse(page1.body, symbolize_names: true)
    json2 = JSON.parse(page2.body, symbolize_names: true)

    make_movies(json1, json2)

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

    make_movies(json1, json2)

    @movies_info = Movie.all
  end

  def make_movies(json1, json2)
    movies = json1[:results] + json2[:results]
    movies.each do |movie|
      Movie.create(title: movie[:title], vote_average: movie[:vote_average], movie_db_id: movie[:id])
    end
  end
end
