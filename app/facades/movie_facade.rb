class MovieFacade

  def self.search(query, limit)
    MovieService.movie_search(query, limit)
  end

  def self.top_movies(limit)
    MovieService.top_movies(limit)
  end
end
