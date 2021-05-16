class MoviesController < ApplicationController
  def index
    if params['movie_title'] == ''
      flash[:error] = 'Search field cannot be blank.'
      redirect_to discover_path
    elsif params['movie_title']
      movie_keyword = params['movie_title']

      response = conn.get("/3/search/movie?api_key=#{ENV['MOVIE_KEY']}&language=en-US&page=1&include_adult=false") do |req|
        req.params['query'] = movie_keyword
      end
      parsed = JSON.parse(response.body, symbolize_names: true)
      @search_results = parsed[:results].map do |result|
        Film.new(result)
      end.first(40)
    else
      page1 = conn.get("/3/movie/top_rated?api_key=#{ENV['MOVIE_KEY']}&language=en-US&page=1")
      page2 = conn.get("/3/movie/top_rated?api_key=#{ENV['MOVIE_KEY']}&language=en-US&page=2")

      page_1_response = JSON.parse(page1.body, symbolize_names: true)
      page_2_response = JSON.parse(page2.body, symbolize_names: true)
      @results = page_1_response[:results] + page_2_response[:results]

      @top40 = @results.map do |result|
        Film.new(result)
      end
    end
  end

  def show
    response = conn.get("/3/movie/#{params["id"]}?api_key=#{ENV['MOVIE_KEY']}&language=en-US")
    details = JSON.parse(response.body, symbolize_names: true)
    @movie = Film.new(details)

    cast_response = conn.get("/3/movie/#{params["id"]}/credits?language=en-US&api_key=#{ENV['MOVIE_KEY']}")
    cast_details = JSON.parse(cast_response.body, symbolize_names: true)
    @cast_members = @movie.cast(cast_details)

    reviews_response = conn.get("/3/movie/#{params["id"]}/reviews?language=en-US&page=1&api_key=#{ENV['MOVIE_KEY']}")
    reviews_details = JSON.parse(reviews_response.body, symbolize_names: true)
    @reviews = @movie.reviews(reviews_details)
  end

  def conn
    Faraday.new('https://api.themoviedb.org')
  end
end
