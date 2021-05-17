class TMDBService
  def initialize(token, movie_id)
    @token = token
    @movie_id = movie_id
  end

  def conn
    Faraday.new(url: 'https://api.themoviedb.org')
  end

  def get_movie_info
    resp = conn.get("/3/movie/#{@movie_id}?api_key=#{@token}")
    JSON.parse(resp.body, symbolize_names: true)
  end

  def get_first_10_credits
    resp = conn.get("/3/movie/#{@movie_id}/credits?api_key=#{@token}")
    JSON.parse(resp.body, symbolize_names: true)[:cast][0..9]
  end

  def get_movie_reviews
    resp = conn.get("/3/movie/#{@movie_id}/reviews?api_key=#{@token}")
    JSON.parse(resp.body, symbolize_names: true)
  end
end
