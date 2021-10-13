class Party < ApplicationRecord
  validates :movie_title, presence: true
  validates :duration, presence: true
  validates :time, presence: true
  validates :date, presence: true
end
