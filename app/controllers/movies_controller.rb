class MoviesController < ApplicationController
  def index; end

  def show
    conn = Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.headers['X-API-Key'] = ENV['MOVIEDB_API_KEY']
    end
    
    movie = conn.get("/3/movie/#{params[:id]}?api_key=#{ENV['MOVIEDB_API_KEY']}&language=en-US")
    @movie_details = JSON.parse(movie.body, symbolize_names: true)

<<<<<<< HEAD
    @runtime = "#{@movie_details[:runtime] / 60}hrs, #{((@movie_details[:runtime].to_f / 60 - @movie_details[:runtime] / 60) * 60).to_i} minutes"

    credits = conn.get("/3/movie/#{params[:id]}/credits?api_key=#{ENV['MOVIEDB_API_KEY']}")
    credits_details = JSON.parse(credits.body, symbolize_names: true)
    @actors = credits_details[:cast].take(10)

    reviews = conn.get("/3/movie/#{params[:id]}/reviews?api_key=#{ENV['MOVIEDB_API_KEY']}&language=en-US&page=1")
    @reviews_details = JSON.parse(reviews.body, symbolize_names: true)[:results]
=======
    movie = conn.get("/3/movie/#{params[:id]}?api_key=#{ENV['MOVIEDB_API_KEY']}&language=en-US")
    @movie_details = JSON.parse(movie.body, symbolize_names: true)

>>>>>>> 6372146da6456d33cfdabc8552797114345fe7be
  end

  def search
    if params[:keywords].nil? || params[:keywords] == ''
      top_40
    else
      @movies_info = get_movies(2).flatten
      # keywords
    end
  end

  # def keywords
  #   @movies_info = get_movies(2).flatten
  # end

  def top_40
    page = 1
    results = []
    conn = Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.headers['X-API-Key'] = ENV['MOVIEDB_API_KEY']
    end
<<<<<<< HEAD

    page1 = conn.get("/3/search/movie?api_key=#{ENV['MOVIEDB_API_KEY']}&language=en-US&query=#{keywords}&page=1")
    page2 = conn.get("/3/search/movie?api_key=#{ENV['MOVIEDB_API_KEY']}&language=en-US&query=#{keywords}&page=2")

    json1 = JSON.parse(page1.body, symbolize_names: true)
    json2 = JSON.parse(page2.body, symbolize_names: true)

    make_movies(json1, json2)

    @movies_info = Movie.all
=======
    until results.length >= 2
      res = conn.get("/3/movie/top_rated?api_key=#{ENV['MOVIEDB_API_KEY']}&language=en-US&page=#{page}") do |f|
        f.params['page'] = page
      end
      json1 = JSON.parse(res.body, symbolize_names: true)
      results << json1[:results]
      page += 1
    end
    @movies_info = results.flatten
>>>>>>> 6372146da6456d33cfdabc8552797114345fe7be
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
