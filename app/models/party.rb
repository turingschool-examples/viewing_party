class Party < ApplicationRecord
  validates :movie_title, presence: true
  validates :date, presence: true
  validates :start_time, presence: true
  validates :duration, presence: true

  has_many :attendees
  has_many :users, through: :attendees
end
