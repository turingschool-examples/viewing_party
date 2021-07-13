class MovieData
  attr_reader :title, 
              :vote_average, 
              :runtime, 
              :genres, 
              :overview, 
              :vote_count

  def initialize(movie_hash)
    @title = movie_hash[:title]
    @vote_average = movie_hash[:vote_average]
    @runtime = movie_hash[:runtime]
    @genres = movie_hash[:genres]
    @overview = movie_hash[:overview]
    @vote_count = movie_hash[:vote_count] 
  end

end