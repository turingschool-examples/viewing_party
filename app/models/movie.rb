class Movie < ApplicationRecord
  validates :title,
            :vote_average,
            :genre,
            :summary,
            :total_reviews, presence: true
end
