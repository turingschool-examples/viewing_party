class MovieInfo
  attr_reader :title,
              :vote_average,
              :runtime,
              :genres,
              :overview,
              :cast,
              :reviews,
              :id

  def initialize(movie, cast = no_cast, reviews = no_reviews)
    @title = movie[:title]
    @vote_average = movie[:vote_average]
    @runtime = movie[:runtime]
    @genres = movie[:genres]
    @overview = movie[:overview]
    @cast = cast[:cast]
    @reviews = reviews[:results]
    @id = movie[:id]
  end

  def no_cast
    {cast: nil}
  end

  def no_reviews
    {results: nil}
  end
end
