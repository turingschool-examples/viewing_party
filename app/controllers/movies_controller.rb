class MoviesController < ApplicationController
  def index; end

  def show
    @movie = SearchFacade.find_movie(params[:id])
  end

  def search
    if params[:keywords].nil? || params[:keywords] == ''
      top_40
    else
      @movies_info = get_movies(2).flatten
    end
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
    @movies_info = results.flatten
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
  end
end
