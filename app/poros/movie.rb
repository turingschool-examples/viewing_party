class Movie
  attr_reader :id, :title, :description, :vote_average, :runtime, :genres, :cast

  def initialize(info, cast)
    @id = info[:id]
    @title = info[:title]
    @description = info[:overview]
    @vote_average = info[:vote_average]
    @runtime = info[:runtime]
    @genres = genres_formatting(info[:genres])
    @cast = formatted_cast(cast)
  end

  def genres_formatting(genres)
    genres.map { |genre| genre[:name] }.join(', ')
  end

  def runtime_formatted
    "#{@runtime / 60}hr #{@runtime % 60}min"
  end

  def formatted_cast(cast)
    cast.map { |member| "#{member[:name]} as #{member[:character]}" }[0..9]
  end
end
