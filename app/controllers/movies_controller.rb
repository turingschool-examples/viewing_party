class MoviesController < ApplicationController
  def index; end

  def show
    conn = Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.headers['X-API-Key'] = ENV['MOVIEDB_API_KEY']
    end

    movie = conn.get("3/movie/#{params[:id]}?api_key=#{ENV['MOVIEDB_API_KEY']}&language=en-US")

    @movie = JSON.parse(movie.body, symbolize_names: true)
  end

  def search
    if params[:keywords].nil? || params[:keywords] == ''
      top_40
    else
      keywords
    end
  end

  def keywords
    movies = get_movies(2).flatten
    @movies_info = movies.pluck(:title).zip(movies.pluck(:vote_average))
  end

  def top_40
    page = 1
    results = []
    conn = Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.headers['X-API-Key'] = ENV['MOVIEDB_API_KEY']
    end
    until results.length >= 2
      res = conn.get("/3/movie/top_rated?api_key=#{ENV['MOVIEDB_API_KEY']}&language=en-US&page=#{page}") do |f|
        f.params['page'] = page
      end
      json1 = JSON.parse(res.body, symbolize_names: true)
      results << json1[:results]
      page += 1
    end
    movies = results.flatten
    @movies_info = movies.pluck(:title).zip(movies.pluck(:vote_average))

    # make_movies(json1, json2)
    #
    # @movies_info = Movie.all
  end

  def get_movies(movie_count_limit)
    keywords = params[:keywords]
    page = 1
    results = []
    conn = Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.headers['X-API-Key'] = ENV['MOVIEDB_API_KEY']
    end
    until results.length >= movie_count_limit
      res = conn.get("3/search/movie?api_key=#{ENV['MOVIEDB_API_KEY']}&language=en-US&query=#{keywords}&page=#{page}") do |f|
        f.params['page'] = page
      end
      json1 = JSON.parse(res.body, symbolize_names: true)
      results << json1[:results]
      page += 1
    end
    results

    # make_movies(json1, json2)
    #
    # @movies_info = Movie.all
  end

  def make_movies(json1, json2)
    movies = json1[:results] + json2[:results]
    movies.each do |movie|
      Movie.create(title: movie[:title], vote_average: movie[:vote_average], movie_db_id: movie[:id])
    end
  end
end
