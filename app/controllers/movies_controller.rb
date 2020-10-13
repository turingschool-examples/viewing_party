class MoviesController < ApplicationController
  def show

    @movie = SearchFacade.find_movie(params[:id])
    @nyt_review = SearchFacade.find_nyt_review(@movie[:original_title])
  end

  def search
    if current_user.nil?
      flash[:notice] = 'Movies Page Only Accessible by Authenticated Users. Please Log In.'
      redirect_to root_path
    else
      @movies_info = get_movies(2).flatten
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
