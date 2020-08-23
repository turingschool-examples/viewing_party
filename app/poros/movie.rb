class Movie
  attr_reader :id, :title, :vote_avg

  def initialize(movie_info)
    # genre_array = parsed[:genres].map do |genre|
    #   genre[:name]
    # end
    require "pry"; binding.pry
    @id       = movie_info[:id]
    @runtime = movie_info[:runtime]
    @title    = movie_info[:title] || movie_info[:original_title]
    @vote_avg = movie_info[:vote_average].to_f
  end
end
