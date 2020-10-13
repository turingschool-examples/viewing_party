class MovieFacade
  def self.movie_details_for_party(movie_id)
    details_json = MovieService.get_details(movie_id)
    @movie = Movie.new(details_json)
  end

  def self.movie_details(movie_id)
    details_json = MovieService.get_details(movie_id)
    cast_json = MovieService.get_cast(movie_id)
    reviews_json = MovieService.get_reviews(movie_id)
    @movie = Movie.new(details_json, cast_json, reviews_json)
  end

  def self.top_40
    json = MovieService.find_top_40
    @movies = json.map { |movie_data| Movie.new(movie_data) }
  end

  def self.find(title)
    return unless MovieService.find_title(title)

    json = MovieService.find_title(title)
    @movies = json.map { |movie_data| Movie.new(movie_data) }
  end
end
