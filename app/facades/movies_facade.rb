class MoviesFacade
  attr_reader :movie_service

  def initialize
    @movie_service = MovieService.new
  end

  def top_40
    top40 = @movie_service.top_40
    top40.map { |movie_info| Movie.new(movie_info) }
  end

  def movies_from_search(keywords)
    terms = keywords.gsub(' ', '+')
    results = @movie_service.from_search(terms)
    results.map { |movie_info| Movie.new(movie_info) }
  end
end
