class Movie < ApplicationRecord
  validates :title,
            :vote_average,
            :movie_db_id, presence: true
end
