class Movie
  attr_reader :movie_id,
              :title,
              :vote_avg,
              :runtime,
              :genres,
              :summary,
              :cast,
              :review_count,
              :review

  def initialize(attributes)
    @movie_id = attributes[:id]
    @title = attributes[:title]
    @vote_avg = attributes[:vote_average]
    @runtime = attributes[:runtime]
    @genres = attributes[:genres]
    @summary = attributes[:overview]
    # @cast
    # @review_count
    # @review
  end

end
