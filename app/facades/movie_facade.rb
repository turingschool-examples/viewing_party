class MovieFacade
  def self.search_by_title(movie_title)
    response = conn.get("/3/search/movie?api_key=#{ENV['MOVIE_KEY']}&language=en-US&page=1&include_adult=false") do |req|
      req.params['query'] = movie_title
    end

    parsed = JSON.parse(response.body, symbolize_names: true)

    parsed[:results].map do |result|
      Film.new(result)
    end.first(40)
  end

  def self.top40
    page1 = conn.get("/3/movie/top_rated?api_key=#{ENV['MOVIE_KEY']}&language=en-US&page=1")
    page2 = conn.get("/3/movie/top_rated?api_key=#{ENV['MOVIE_KEY']}&language=en-US&page=2")

    page_1_response = JSON.parse(page1.body, symbolize_names: true)
    page_2_response = JSON.parse(page2.body, symbolize_names: true)
    @results = page_1_response[:results] + page_2_response[:results]

    @results.map do |result|
      Film.new(result)
    end
  end

  def self.fetch_movie_details(movie_id)
    response = conn.get("/3/movie/#{movie_id}?api_key=#{ENV['MOVIE_KEY']}&language=en-US")
    details = JSON.parse(response.body, symbolize_names: true)
    Film.new(details)
  end

  def self.fetch_movie_cast(movie_id)
    cast_response = conn.get("/3/movie/#{movie_id}/credits?language=en-US&api_key=#{ENV['MOVIE_KEY']}")
    cast_details = JSON.parse(cast_response.body, symbolize_names: true)
    Film.new(cast_details).cast(cast_details)
  end

  def self.fetch_movie_reviews(movie_id)
    reviews_response = conn.get("/3/movie/#{movie_id}/reviews?language=en-US&page=1&api_key=#{ENV['MOVIE_KEY']}")
    reviews_details = JSON.parse(reviews_response.body, symbolize_names: true)
    Film.new(reviews_details).reviews(reviews_details)
  end

  private

  def self.conn
    Faraday.new('https://api.themoviedb.org')
  end
end
