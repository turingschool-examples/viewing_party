class MoviesFacade
  class << self
    def get_movies(movie)
      create_movies(MoviesService.search_by_movie(movie))
    end

    def get_top_movies
      create_movies(MoviesService.top_rated_movies)
    end

    def get_movie(movie)
      movie_data = MoviesService.find_movie(movie)
      Film.new(movie_data)
    end

  private

    def create_movies(movies_data)
      movies_data.map do |movie_data|
        Film.new(movie_data)
      end
    end
  end

end
