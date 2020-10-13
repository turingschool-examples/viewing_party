class MovieDatabase
  def self.movie_details(movie_id)
    conn = Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.headers['X-API-Key'] = ENV['MOVIEDB_API_KEY']
    end
    movie = conn.get("/3/movie/#{movie_id}?api_key=#{ENV['MOVIEDB_API_KEY']}&language=en-US")
    JSON.parse(movie.body, symbolize_names: true)
  end

  def self.movie_actors(movie_id)
    conn = Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.headers['X-API-Key'] = ENV['MOVIEDB_API_KEY']
    end
    credits = conn.get("/3/movie/#{movie_id}/credits?api_key=#{ENV['MOVIEDB_API_KEY']}")
    credits_details = JSON.parse(credits.body, symbolize_names: true)
    credits_details[:cast].take(10)
  end

  def self.movie_reviews(movie_id)
    conn = Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.headers['X-API-Key'] = ENV['MOVIEDB_API_KEY']
    end
    reviews = conn.get("/3/movie/#{movie_id}/reviews?api_key=#{ENV['MOVIEDB_API_KEY']}&language=en-US&page=1")
    JSON.parse(reviews.body, symbolize_names: true)[:results]
  end

  def conn
    Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.headers['X-API-Key'] = ENV['MOVIEDB_API_KEY']
    end
  end
end
