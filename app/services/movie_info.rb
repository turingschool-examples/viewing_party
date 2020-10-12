class MovieInfo
  def self.search_movies(keyword, api)
    page = 1
    movie_results = []
    until page == 2
      conn = Faraday.new(url: 'https://api.themoviedb.org')
      response = conn.get("/3/search/movie?api_key=#{api}&language=en-US&query=#{keyword}&page=1&include_adult=false")
      json = JSON.parse(response.body, symbolize_names: true)
      movie_results << json[:results]
      page += 1
    end
    movie_results.flatten
  end

  def self.get_40_movies(movie_count, api)
    page = 1
    movie_results = []
    until movie_results.length >= movie_count
      conn = Faraday.new(url: 'https://api.themoviedb.org')
      response = conn.get("/3/movie/top_rated?api_key=#{api}&language=en-US&page=#{page}")
      json = JSON.parse(response.body, symbolize_names: true)
      json[:results].each { |f| movie_results << f }
      page += 1
    end
    movie_results
  end

  def self.get_specific_movie(id, api_key)
    conn = Faraday.new(url: 'https://api.themoviedb.org')
    response = conn.get("/3/movie/#{id}?api_key=#{api_key}&language=en-US")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.find_cast(id, api_key)
    conn = Faraday.new(url: 'https://api.themoviedb.org')
    response = conn.get("/3/movie/#{id}/credits?api_key=#{api_key}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.find_reviews(id, api_key)
    conn = Faraday.new(url: 'https://api.themoviedb.org')
    response = conn.get("/3/movie/#{id}/reviews?api_key=#{api_key}&language=en-US&page=1")
    JSON.parse(response.body, symbolize_names: true)
  end
end
