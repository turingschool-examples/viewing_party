class MoviesController < ApplicationController
  def show
    if current_user.nil?
      flash[:notice] = 'Movies Show Page Only Accessible by Authenticated Users. Please Log In.'
      redirect_to root_path
    else
      # conn = Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      #   faraday.headers['X-API-Key'] = ENV['MOVIEDB_API_KEY']
      # end
      #
      # movie = conn.get("/3/movie/#{params[:id]}?api_key=#{ENV['MOVIEDB_API_KEY']}&language=en-US")
      # movie_details = JSON.parse(movie.body, symbolize_names: true)
      @movie = SearchFacade.find_movie(params[:id])
      @actors = SearchFacade.find_actors(params[:id])
      @reviews = SearchFacade.find_reviews(params[:id])
      @nyt_review = SearchFacade.find_nyt_review(@movie[:original_title])

      find_runtime(@movie[:runtime])
      #
      # credits = conn.get("/3/movie/#{params[:id]}/credits?api_key=#{ENV['MOVIEDB_API_KEY']}")
      # #maybe this instead of the next two lines: @actors = JSON.parse(credits.body, symbolize_names: true)[:cast].take(10)
      # credits_details = JSON.parse(credits.body, symbolize_names: true)
      # @actors = credits_details[:cast].take(10)
      #
      # reviews = conn.get("/3/movie/#{params[:id]}/reviews?api_key=#{ENV['MOVIEDB_API_KEY']}&language=en-US&page=1")
      # @reviews_details = JSON.parse(reviews.body, symbolize_names: true)[:results]
    end
  end

  def find_runtime(runtime)
    hours = runtime / 60
    minutes = ((runtime.to_f / 60 - runtime / 60) * 60).to_i
    @runtime = "#{hours}hrs, #{minutes} minutes"
  end

  def search
    if current_user.nil?
      flash[:notice] = 'Movies Page Only Accessible by Authenticated Users. Please Log In.'
      redirect_to root_path
    else
      if params[:keywords].nil? || params[:keywords] == ''
        top_40
      else
        @movies_info = get_movies(2).flatten
        # keywords
      end
    end
  end

  def top_40
    key = ENV['MOVIEDB_API_KEY']
    uri ="/3/movie/top_rated?api_key=#{ENV['MOVIEDB_API_KEY']}&language=en-US"
    url = 'https://api.themoviedb.org'
    @movies_info = api_call(2, uri, url, key).flatten
  end

  def get_movies(pages)
    keywords = params[:keywords]
    key = ENV['MOVIEDB_API_KEY']
    uri = "3/search/movie?api_key=#{key}&language=en-US&query=#{keywords}"
    url = 'https://api.themoviedb.org'
    @movies_info = api_call(pages, uri, url, key).flatten
  end

  def get_conn(url, key)
    Faraday.new(url: url) do |faraday|
      faraday.headers['X-API-Key'] = key
    end
  end

  def api_call(length, uri, url, key)
    results = []
    conn = get_conn(url, key)
    page = 1
    until results.length >= length
      uri_with_page = uri + "&page=#{page}"
      res = conn.get(uri_with_page) do |f|
        f.params['page'] = page
      end
      results << JSON.parse(res.body, symbolize_names: true)[:results]
      page += 1
    end
    results
  end
end
