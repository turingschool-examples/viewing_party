class MoviesFacade
  class << self
    def top_40_movies
      movie_data = MoviesService.top_40
      movie_data.map do |data|
        Movie.new(data)
      end
    end

    def search(title)
      data = MoviesService.movie_search(title)
      data.map do |data|
        Movie.new(data)
      end
    end

    def details(movie_id)
      data = MoviesService.movie_details(movie_id)
      data.map do |data|
        Movie.new(data)
      end
    end
  end
end
