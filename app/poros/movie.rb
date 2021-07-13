class Movie
  attr_reader :title, :vote, :id

  def initialize(movie_info)
    @title = movie_info[:title]
    @vote = movie_info[:vote_average]
    @id = movie_info[:id]
  end
  
end