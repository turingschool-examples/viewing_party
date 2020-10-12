class Movie
  attr_reader :movie_id,
              :title,
              :vote_avg,
              :runtime,
              :genres,
              :summary,
              :cast,
              :review_count,
              :reviews

  def initialize(movie_data, cast_data = nil, review_data = nil)
    @movie_id = movie_data[:id]
    @title = movie_data[:title]
    @vote_avg = movie_data[:vote_average]
    @runtime = movie_data[:runtime]
    @genres = movie_data[:genres]
    @summary = movie_data[:overview]
    @cast = cast_data
    @reviews = review_data
  end

  def formatted_runtime
    hours = @runtime / 60
    minutes = @runtime % 60
    "#{hours} hour(s) and #{minutes} minutes"
  end
end
