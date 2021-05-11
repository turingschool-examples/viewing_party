class Movie < ApplicationRecord
  has_many :parties, dependent: :destroy
  has_many :party_viewers, through: :parties, dependent: :destroy

  validates :api_id, presence: true
  validates :title, presence: true
end
