class MoviesFacade
  def top_40
    movies = MovieService.new.top_40
    movies.map do |data|
      Movie.new(data)
  end
end
