class LocalMovie
  attr_reader :title, :id, :vote_average, :runtime, :genres, :overview, :cast, :reviews

  def initialize(data, cast = nil, reviews = nil)

    @id = data[:id]
    @title = data[:title]
    @vote_average = data[:vote_average]
    @runtime = data[:runtime]
    @genres = data[:genres]
    @overview = data[:overview]
    @cast = cast
    @reviews = reviews
  end

  def runtime_conversion
    '%d:%02d' % runtime.divmod(60)
  end

end
