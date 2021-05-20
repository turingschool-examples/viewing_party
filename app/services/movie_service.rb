class MovieService
  def self.title_query(movie_title)
    response = conn.get("/3/search/movie?api_key=#{ENV['MOVIE_KEY']}&language=en-US&page=1&include_adult=false") do |req|
      req.params['query'] = movie_title
    end
    parse_json(response)
  end

  def self.top40_query
    page1 = conn.get("/3/movie/top_rated?api_key=#{ENV['MOVIE_KEY']}&language=en-US&page=1")
    page2 = conn.get("/3/movie/top_rated?api_key=#{ENV['MOVIE_KEY']}&language=en-US&page=2")

    page_1_response = parse_json(page1)
    page_2_response = parse_json(page2)
    page_1_response[:results] + page_2_response[:results]
  end

  def self.movie_query(movie_id)
    response = conn.get("/3/movie/#{movie_id}?api_key=#{ENV['MOVIE_KEY']}&language=en-US")
    parse_json(response)
  end

  def self.cast_query(movie_id)
    response = conn.get("/3/movie/#{movie_id}/credits?language=en-US&api_key=#{ENV['MOVIE_KEY']}")
    parse_json(response)
  end

  def self.reviews_query(movie_id)
    response = conn.get("/3/movie/#{movie_id}/reviews?language=en-US&page=1&api_key=#{ENV['MOVIE_KEY']}")
    parse_json(response)
  end

  def self.upcoming
    response = conn.get("/3/movie/upcoming?api_key=#{ENV['MOVIE_KEY']}&language=en-US&page=1")
    parse_json(response)
  end

  def self.similar_movies_query(movie_id)
    response = conn.get("/3/movie/#{movie_id}/similar?api_key=#{ENV['MOVIE_KEY']}&language=en-US&page=1")
    parse_json(response)
  end

  def self.conn
    Faraday.new('https://api.themoviedb.org')
  end

  def self.parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
