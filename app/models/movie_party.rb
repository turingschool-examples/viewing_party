class MovieParty < ApplicationRecord
  validates :movie_title, presence: true
  validates :duration, presence: true
  validates :date, presence: true
  validates :start_time, presence: true
  belongs_to :user
  has_many :party_users, dependent: :destroy
  has_many :users, through: :party_users
end
