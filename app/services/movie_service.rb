class MovieService
  def self.title_query(movie_title)
    response = conn.get("/3/search/movie?api_key=#{ENV['MOVIE_KEY']}&language=en-US&page=1&include_adult=false") do |req|
      req.params['query'] = movie_title
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.top40_query
    page1 = conn.get("/3/movie/top_rated?api_key=#{ENV['MOVIE_KEY']}&language=en-US&page=1")
    page2 = conn.get("/3/movie/top_rated?api_key=#{ENV['MOVIE_KEY']}&language=en-US&page=2")

    page_1_response = JSON.parse(page1.body, symbolize_names: true)
    page_2_response = JSON.parse(page2.body, symbolize_names: true)
    page_1_response[:results] + page_2_response[:results]
  end

  def self.movie_query(movie_id)
    response = conn.get("/3/movie/#{movie_id}?api_key=#{ENV['MOVIE_KEY']}&language=en-US")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.cast_query(movie_id)
    cast_response = conn.get("/3/movie/#{movie_id}/credits?language=en-US&api_key=#{ENV['MOVIE_KEY']}")
    JSON.parse(cast_response.body, symbolize_names: true)
  end

  def self.reviews_query(movie_id)
    reviews_response = conn.get("/3/movie/#{movie_id}/reviews?language=en-US&page=1&api_key=#{ENV['MOVIE_KEY']}")
    JSON.parse(reviews_response.body, symbolize_names: true)
  end

  private

  def self.conn
    Faraday.new('https://api.themoviedb.org')
  end
end
