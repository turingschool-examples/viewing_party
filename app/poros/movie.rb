class Movie
  attr_reader :title,
              :description,
              :rating,
              :genres,
              :runtime,
              :cast,
              :id,
              :reviews

  def initialize(movie_info)
    @title = movie_info[:original_title]
    @description = movie_info[:overview]
    @rating = movie_info[:vote_average]
    @genres = movie_info[:genres]
    @runtime = movie_info[:runtime]
    @id = movie_info[:id]
    @cast = movie_info[:cast]
    @reviews = movie_info[:reviews]
  end
end
