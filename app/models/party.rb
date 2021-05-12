class Party < ApplicationRecord
  validates :movie_title, presence: true
  validates :viewing_party_duration, presence: true
  validates :viewing_party_date, presence: true
  validates :start_time, presence: true
  validates :host_id, presence: true, numericality: true

  has_many :user_viewing_parties
  has_many :users, through: :user_viewing_parties
end
