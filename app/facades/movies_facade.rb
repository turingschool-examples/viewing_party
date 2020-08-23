class MoviesFacade
  attr_reader :movie_service

  def initialize
    @movie_service ||= MovieService.new
  end

  def top_40_movies
    top_40 = @movie_service.get_top_40
    top_40.map { |movie_info| Movie.new(movie_info) }
  end

  def movies_from_search(keywords)
    terms = keywords.gsub(' ', '+')
    results = @movie_service.from_search(terms)
    results.map { |movie_info| Movie.new(movie_info) }
  end
end
