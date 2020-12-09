class Movie < ApplicationRecord
  has_many :viewings, dependent: :destroy

  validates :title, :api_id, presence: true
  validates :duration_of_movie, numericality: { greater_than: 0 }
end
