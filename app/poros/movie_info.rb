class MovieInfo
  attr_reader :popular_movies,
              :search_results

  def initialize(search_params= nil)
    movie_service = MovieService.new
    @popular_movies = movie_service.get_popular_movies
    @search_results = movie_service.get_search_results(search_params)
  end
end

# response[0][:title]
# response[0][:vote_average]
