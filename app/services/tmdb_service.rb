class TMDBService
  def initialize(token, movie_info)
    @token = token
    @movie_info = movie_info
  end

  def conn
    Faraday.new(url: 'https://api.themoviedb.org')
  end

  def get_movie_info
    resp = conn.get("/3/movie/#{@movie_info}?api_key=#{@token}")
    JSON.parse(resp.body, symbolize_names: true)
  end

  def get_first_10_credits
    resp = conn.get("/3/movie/#{@movie_info}/credits?api_key=#{@token}")
    JSON.parse(resp.body, symbolize_names: true)[:cast][0..9]
  end

  def get_movie_reviews
    resp = conn.get("/3/movie/#{@movie_info}/reviews?api_key=#{@token}")
    JSON.parse(resp.body, symbolize_names: true)
  end

  def top_movies
    top_page1 + top_page2
  end

  def top_page1
    resp = conn.get("/3/movie/top_rated?api_key=#{@token}")
    JSON.parse(resp.body, symbolize_names: true)[:results]
  end

  def top_page2
    resp = conn.get("/3/movie/top_rated?api_key=#{@token}&page=2")
    JSON.parse(resp.body, symbolize_names: true)[:results]
  end

  def movie_search
    search_page1 + search_page2
  end

  def search_page1
    resp = conn.get("/3/search/movie?api_key=#{@token}&query=#{@movie_info}")
    JSON.parse(resp.body, symbolize_names: true)[:results]
  end

  def search_page2
    resp = conn.get("/3/search/movie?api_key=#{@token}&query=#{@movie_info}&page=2")
    JSON.parse(resp.body, symbolize_names: true)[:results]
  end
end
