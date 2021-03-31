class Movie < ApplicationRecord
  has_many :viewing_events

  def self.find_or_create(movie_info)
    movie = Movie.find_by(movie_db_id: movie_info[:movie_db_id])
    if movie.nil?
      Movie.create!(movie_info)
    else
      movie
    end
  end
end
