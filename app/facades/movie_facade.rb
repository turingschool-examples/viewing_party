class MovieFacade
  def self.search(query, limit)
    MovieSearchService.movie_search(query, limit)
  end

  def self.top_movies(limit)
    MovieSearchService.top_movies(limit)
  end

  def self.movie_information(api_movie_id)
    MovieSearchService.movie_information(api_movie_id)
  end

  def self.create_movie(api_id)
    Movie.find_or_create_by!(api_id: api_id)
  end

  def self.trending_movies(limit)
    MovieSearchService.trending_movies(limit)
  end
end
