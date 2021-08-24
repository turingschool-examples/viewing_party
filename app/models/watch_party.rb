class WatchParty < ApplicationRecord
  has_many :attendees
  has_many :users, through: :attendees
  validates :movie, presence: true
end