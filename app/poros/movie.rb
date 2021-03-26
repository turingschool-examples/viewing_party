class Movie
  attr_reader :title, :id, :vote_average, :genres, :description, :review_count
  def initialize(data)
    require "pry"; binding.pry
    @adult = data[:adult]
      @title = data[:original_title]
      @id = data[:id]
      @vote_average = data[:vote_average]
      @genres = data[:genre_ids]
      @review_count = data[:vote_count]
      @description = data[:overview]
  end
end
