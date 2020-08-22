class Movie
  attr_reader :id, :title, :vote_avg

  def initialize(movie_info)
    @id       = movie_info[:id]
    @title    = movie_info[:title]
    @vote_avg = movie_info[:vote_average].to_f
  end
end
