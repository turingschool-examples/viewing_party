class MoviesController < ApplicationController
  def index
  end

  def top_movies
    page=1
    movies = []
    conn = Faraday.new(url: 'https://api.themoviedb.org') do |f|
      f.params['api_key'] = ENV['TMDB_API_KEY']
    end
    until movies.flatten.length >= 40
      response = conn.get('/3/movie/top_rated') do |f|
        f.params['page'] = page
        f.params['language'] = 'en-US'
      end
      json = JSON.parse(response.body, symbolize_names: true)
      movies << json[:results]
      page += 1
    end
    @movies = movies.flatten.first(40)
  end

  def top_search
    keyword = params[:find_movies]
    page=1
    movies = []
    conn = Faraday.new(url: 'https://api.themoviedb.org') do |f|
      f.params['api_key'] = ENV['TMDB_API_KEY']
    end

    until movies.flatten.length >= 40
      response = conn.get('/3/search/movie') do |f|
        f.params['page'] = page
        f.params['language'] = 'en-US'
        f.params['query'] = keyword
        f.params['include_adult'] = false
      end
      json = JSON.parse(response.body, symbolize_names: true)
      movies << json[:results]
      page += 1
      break if page == 3
    end
    @movies = movies.flatten.first(40)
    if @movies.empty?
      flash[:notice] = "No Movies Match Your Search"
    end
  end
end
