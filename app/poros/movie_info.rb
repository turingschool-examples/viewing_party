class MovieInfo
  attr_reader :title,
              :vote_average,
              :runtime,
              :overview,
              :genres,
              :id,
              :poster_path

  def initialize(attributes)
    @title = attributes[:title]
    @vote_average = attributes[:vote_average]
    @runtime = attributes[:runtime]
    @overview = attributes[:overview]
    @genres = attributes[:genres]
    @id = attributes[:id]
    @poster_path = attributes[:poster_path]
  end
end
