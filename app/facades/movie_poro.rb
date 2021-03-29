class MoviePoro
  attr_reader :movie_id, :title, :vote_average, :poster_path

  def initialize(info)
    @movie_id = info[:movie_id]
    @title = info[:title]
    @vote_average = info[:vote_average]
    @poster_path = info[:poster_path]
  end
end
