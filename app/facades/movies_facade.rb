class MoviesFacade
  def top_40_movies
    movie_data = MoviesService.new.top_40
  @movies =  movie_data[:results].map do |result|
      Movie.new(result)
    end
  end
end
