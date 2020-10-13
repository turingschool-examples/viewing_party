class Movie
  attr_reader :title,
              :vote_average,
              :runtime,
              :genres,
              :overview,
              :cast,
              :reviews

  def initialize(attributes, cast, reviews)
    @title = attributes[:title]
    @vote_average = attributes[:vote_average]
    @runtime = attributes[:runtime]
    @genres = get_genres(attributes[:genres])
    @overview = attributes[:overview]
    @cast = cast
    @reviews = reviews
  end

  def translate_runtime
    hours = @runtime / 60
    minutes = ((@runtime.to_f / 60 - @runtime / 60) * 60).to_i
    @runtime = "#{hours}hrs, #{minutes} minutes"
  end

  def get_genres(genre_hashes)
    genre_hashes.map do |hash|
      hash[:name]
    end
  end
end
