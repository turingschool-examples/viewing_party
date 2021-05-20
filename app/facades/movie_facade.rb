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
    json[:cast].map do |actor|
      Cast.new(actor)
    end.first(10)
  end

  def self.fetch_movie_reviews(movie_id)
    json = MovieService.reviews_query(movie_id)
    json[:results].map do |review|
      Review.new(review)
    end
  end

  def self.fetch_similar_movies(movie_id)
    json = MovieService.similar_movies_query(movie_id)
    json[:results].map do |movie|
      Similar.new(movie)
    end.first(5)
  end
end
