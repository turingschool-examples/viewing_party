class Party < ApplicationRecord
  belongs_to :user

  validates :duration, presence: true
  validates :scheduled_date, presence: true
  validates :start_time, presence: true
  validates :movie_id, presence: true
  validates :movie_title, presence: true
end
