class MovieFacade
  def self.search_by_title(movie_title)
    json = MovieService.title_query(movie_title)

    json[:results].map do |result|
      Film.new(result)
    end.first(40)
  end

  def self.top40
    json = MovieService.top40_query

    json.map do |result|
      Film.new(result)
    end
  end

  def self.fetch_movie_details(movie_id)
    json = MovieService.movie_query(movie_id)
    Film.new(json)
  end

  def self.fetch_movie_cast(movie_id)
    json = MovieService.cast_query(movie_id)
    Film.new(json).cast(json)
  end

  def self.fetch_movie_reviews(movie_id)
    json = MovieService.reviews_query(movie_id)
    Film.new(json).reviews(json)
  end

  private

  def self.conn
    Faraday.new('https://api.themoviedb.org')
  end
end
