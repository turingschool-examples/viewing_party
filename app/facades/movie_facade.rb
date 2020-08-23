class MovieFacade
  def self.get_top_movies
    top_40 = MovieService.new.top_40

    top_40.map { |movie_info| Movie.new(movie_info) }
  end

  def self.movies_from_search(keywords)
    results = MovieService.new.from_search(keywords)

    results.map { |movie_info| Movie.new(movie_info) }
  end
end
