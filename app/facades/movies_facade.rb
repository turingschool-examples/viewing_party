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
      # cast_data = MoviesService.find_cast(movie)
      # reviews = MoviesService.retrieve_reviews(movie)
      Film.new(movie_data, cast_data, reviews)
    end

  private

    def create_movies(movies_data)
      movies_data.map do |movie_data|
        Film.new(movie_data)
      end
    end
  end

end
