class MovieDetails
  attr_reader :title,
              :vote_average,
              :runtime,
              :genres,
              :overview,
              :cast,
              :reviews,
              :id

  def initialize(movie_details)
    @title = movie_details[:title]
    @vote_average = movie_details[:vote_average]
    @runtime = movie_details[:runtime]
    @genres = movie_details[:genres]
    @overview = movie_details[:overview]
    @cast = movie_details[:cast]
    @reviews = movie_details[:results]
    @id = movie_details[:id]
  end
end
