class MovieFacade
  attr_reader :info, :cast, :reviews

  def initialize(movie_id)
    @movie_service ||= MovieService.new
    @info    = movie_details(movie_id)
    @cast    = cast_details(movie_id)
    @reviews = movie_reviews(movie_id)
  end

  def movie_details(movie_id)
    movie_info = @movie_service.movie_details(movie_id)
    Movie.new(movie_info)
  end

  def cast_details(movie_id)
    cast_info = @movie_service.cast_details(movie_id)
    Cast.new(cast_info)
  end

  def movie_reviews(movie_id)
    reviews_info = @movie_service.reviews_details(movie_id)
    reviews_info.map { |review_info| Review.new(review_info) }
  end
end
