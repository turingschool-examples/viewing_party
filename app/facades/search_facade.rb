class SearchFacade
  def self.find_movie(movie_id)
    attributes = MovieDatabase.movie_details(movie_id)
    cast = MovieDatabase.movie_actors(movie_id)
    reviews = MovieDatabase.movie_reviews(movie_id)
    Movie.new(attributes, cast, reviews)
  end

  def self.find_nyt_review(movie_title)
    MovieDatabase.nyt_movie_review(movie_title)
  end
end
