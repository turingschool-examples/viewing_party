class SearchFacade
  def self.find_movie(movie_id)
    MovieDatabase.movie_details(movie_id)
  end

  def self.find_actors(movie_id)
    MovieDatabase.movie_actors(movie_id)
  end

  def self.find_reviews(movie_id)
    MovieDatabase.movie_reviews(movie_id)
  end
end
