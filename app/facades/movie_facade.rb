class MovieFacade

  def self.search(query, limit)
    movie_service = MovieService.movie_search(query, limit)
  end
end
