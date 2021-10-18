class MoviesFacade
  def top_40_movies
    movie_data = MoviesService.new.top_40
      movie_data.map do |data|
      Movie.new(data)
    end
  end

  def search(title)
    data = MoviesService.new.movie_search(title)
    data.map do |data|
      Movie.new(data)
    end
  end
end
