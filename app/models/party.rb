class Party < ApplicationRecord
  has_many :user_parties
  has_many :users, through: :user_parties

  validates :duration, presence: true
  validates :scheduled_date, presence: true
  validates :start_time, presence: true
  validates :movie_id, presence: true
  validates :movie_title, presence: true
end
