class MovieDataBaseFacade

  def self.top_rated_movies
    MovieService.top_rated_movies.map do |movie|
      Movie.new(movie)
    end
  end

  def self.movies_search(keyword)
    MovieService.movies_search(keyword).map do |movie|
      Movie.new(movie)
    end
  end

  def self.movie_details(id)
    movie = Movie.new(MovieService.movie_details(id))
  end
end
