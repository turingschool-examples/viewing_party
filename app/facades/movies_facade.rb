class MoviesFacade
  def top_40_movies
    movie_data = MoviesService.new.top_40
  @movies =  movie_data.map do |data|
      Movie.new(data)
    end
  end
end
