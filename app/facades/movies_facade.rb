class MoviesFacade
  class << self
    def get_a_movie(movie)
      movie_data = MoviesService.search_by_movie(movie)
      @movie = Movies.new(movie_data)
    end
  end
end