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

  def self.nyt_movie_review(movie_title)
    title = movie_title.parameterize(separator: '_')
    conn = Faraday.new(url: 'https://api.nytimes.com') do |faraday|
      faraday.headers['X-API-Key'] = ENV['NYT_MOVIE_REVIEWS_API_KEY']
    end
    review = conn.get("/svc/movies/v2/reviews/search.json?api-key=#{ENV['NYT_MOVIE_REVIEWS_API_KEY']}&query=#{title}")

    response = JSON.parse(review.body, symbolize_names: true)[:results]

    response.map do |review_data|
      NytReview.new(review_data)
    end
  end
end
