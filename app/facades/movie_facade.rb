class MovieFacade
  def self.movie_details(movie_id)
    details_json = MovieService.get_details(movie_id)
    cast_json = MovieService.get_cast(movie_id)
    reviews_json = MovieService.get_reviews(movie_id)
    @movie = Movie.new(details_json, cast_json, reviews_json)
  end

  def self.top_40
    json = MovieService.find_top_40
    @movies = json.map do |movie_data|
      Movie.new(movie_data)
    end
  end

  def self.find(title)
    if json = MovieService.find_title(title)
      @movies = json.map do |movie_data|
        Movie.new(movie_data)
      end
    end
  end
end
