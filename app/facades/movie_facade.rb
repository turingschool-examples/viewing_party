class MovieFacade
  attr_reader :service

  def initialize
    @service = MovieService.new
  end

  def create_movie(id)
    json = @service.get_movie(id)

    Movie.new(json)
  end

  def top_movies
    @service.get_popular_movies('1') + @service.get_popular_movies('2')
  end
end
