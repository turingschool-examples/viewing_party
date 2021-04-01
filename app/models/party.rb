class Party < ApplicationRecord
  belongs_to :movie
  belongs_to :user

  has_many :party_friends, dependent: :destroy
  has_many :friendships, through: :party_friends

  validates :duration, numericality: { greater_than: 0 }
  validates :date, presence: true
  validates :duration, presence: true
end
