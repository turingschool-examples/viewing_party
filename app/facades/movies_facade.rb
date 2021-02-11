class MoviesFacade
  def self.find_movies_by_name(search)
    response = MoviesService.find_movies_by_name(search)
    get_movies(response)
  end

  private

  def self.movie_params
    params.require(:movie).permit(:name, :super_name, :superpower_id, :search)
  end

  def self.get_movie_info(id)
    movie = MoviesService.get_movie_info(id)
    cast = MoviesService.get_cast(id)
    reviews = MoviesService.get_reviews(id)
    LocalMovie.new(movie, cast, reviews)
  end

  def self.get_movies(results)
    results.map do |movie_data|
      LocalMovie.new(movie_data)
    end
  end
end
