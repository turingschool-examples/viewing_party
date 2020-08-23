class Movie
  attr_reader :id,
              :title,
              :genres,
              :runtime,
              :vote_avg,
              :overview

  def initialize(movie_info)
    @id       = movie_info[:id]
    @title    = movie_info[:title]
    @genres   = get_genres(movie_info)
    @runtime  = movie_info[:runtime] if movie_info[:runtime]
    @vote_avg = movie_info[:vote_average].to_f
    @overview = movie_info[:overview]
  end

  def get_genres(movie_info)
    movie_info[:genres].map { |genre| genre[:name] } if movie_info[:genres]
  end
end
