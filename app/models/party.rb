class Party < ApplicationRecord
  validates :start_time_day, presence: true
  validates :movie_api_id, :duration, presence: true, numericality: true

  belongs_to :host, class_name: :User
  has_many :party_guests, dependent: :destroy
  has_many :guests, class_name: :User, through: :party_guests
end
