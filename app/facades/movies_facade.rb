class MoviesFacade
  def self.movies
    json = MovieDbService.top_40_movies
    @movies = json[:results].map do |movie_data|
      Movie.new(movie_data)
    end
  end
end
