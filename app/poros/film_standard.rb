class FilmStandard
  attr_reader :id,
              :title,
              :vote_average,
              :popularity,
              :overview
  def initialize(movie_data)
    @id = movie_data[:id]
    @title = movie_data[:title] #check to see if we'll need to capitalize, etc.
    @vote_average = movie_data[:vote_average]
    @popularity = movie_data[:popularity]
    @overview = movie_data[:overview]
  end
end
