class MovieInfo
  attr_reader :title,
              :vote_average,
              :runtime,
              :genres,
              :overview,
              :cast,
              :reviews,
              :id

  def initialize(movie, cast, reviews)
    @title = movie[:title]
    @vote_average = movie[:vote_average]
    @runtime = movie[:runtime]
    @genres = movie[:genres]
    @overview = movie[:overview]
    @cast = movie[:cast]
    @reviews = movie[:results]
    @id = movie[id]
  end
