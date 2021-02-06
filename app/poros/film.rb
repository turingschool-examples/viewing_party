class Film
  attr_reader :id,
              :title,
              :vote_average,
              :runtime,
              :genres

  def initialize(attributes)
    @id = attributes[:id]
    @title = attributes[:title]
    @vote_average = attributes[:vote_average]
    @runtime = attributes[:runtime]
    @genres = attributes[:genres].map { |genre| genre[:name] }.join(', ')
  end
end
