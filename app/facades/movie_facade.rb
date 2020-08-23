class MovieFacade
  def self.get_top_movies
    top_40 = MovieService.new.top_40

    top_40.map do |movie_info|
      Movie.new(movie_info)
    end
  end
end
