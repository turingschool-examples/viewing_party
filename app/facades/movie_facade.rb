class MovieFacade
  attr_reader :service


    @@service = MovieService.new


  def self.cast_information(id)
    cast = @@service.get_cast(id)
    cast.map do |hash|
      {name: hash[:name], character: hash[:character]}
    end
  end

  def self.movie_review_info(id)
    reviews = @@service.get_review(id)
    reviews.map do |hash|
      {author: hash[:author], review: hash[:content]}
    end
  end

  def self.movie_information(id)
    json = @@service.get_movie(id)
    {
      original_title: json[:original_title],
      overview: json[:overview],
      vote_average: json[:vote_average],
      genres: json[:genres].map { |a| a[:name]},
      cast: cast_information(id),
      reviews: movie_review_info(id),
      runtime: json[:runtime],
      id: json[:id],
      image_url: "https://image.tmdb.org/t/p/w500#{json[:poster_path]}"
    }
  end

  def self.create_movie(id)
    Movie.new(movie_information(id))
  end
end
