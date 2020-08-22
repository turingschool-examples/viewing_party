class Movie
  attr_reader :title, :vote_avg

  def initialize(movie_info)
    @title    = movie_info[:title]
    @vote_avg = movie_info[:vote_average].to_f
  end
end
