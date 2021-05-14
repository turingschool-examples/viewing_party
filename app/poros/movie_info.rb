class MovieInfo
  attr_reader :popular_movies

  def initialize
    movie_service = MovieService.new
    @popular_movies = movie_service.get_movie_data
  end
end

# response[0][:title]
# response[0][:vote_average]
