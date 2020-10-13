class MovieDataBaseFacade

  def self.top_rated_movies
    MovieService.top_rated_movies.map do |movie|
      Movie.new(movie)
    end
  end

  def self.movies_search(keyword)
    MovieService.movies_search(keyword).map do |movie|
      Movie.new(movie)
    end
  end

  def self.movie_details(id)
    Movie.new(MovieService.movie_details(id))
  end

  def self.movie_cast(id)
    MovieService.cast(id).map do |cast|
      CastMember.new(cast)
    end
  end

  def self.movie_reviews(id)
    MovieService.reviews(id).map do |review|
      Review.new(review)
    end
  end
end
