class MovieFacade
  attr_reader :service

  def initialize
    @service = MovieService.new
  end

  def cast_information(id)
    cast = @service.get_cast(id)
    cast.map do |hash|
      {name: hash[:name], character: hash[:character]}
    end
  end

  def movie_review_info(id)
    reviews = @service.get_review(id)
    reviews.map do |hash|
      {author: hash[:author], review: hash[:content]}
    end
  end

  def movie_information(id)
    json = @service.get_movie(id)
    {
      original_title: json[:original_title],
      overview: json[:overview],
      vote_average: json[:vote_average],
      genres: json[:genres].map { |a| a[:name]},
      cast: cast_information(id),
      reviews: movie_review_info(id),
      runtime: json[:runtime],
      id: json[:id]
    }
  end

  def create_movie(id)
    Movie.new(movie_information(id))
  end

  def top_movies
    @service.get_popular_movies('1') + @service.get_popular_movies('2')
  end
end
