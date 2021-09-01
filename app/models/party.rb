class Party < ApplicationRecord
  belongs_to :user
  has_many :attendees
  has_many :users, through: :attendees

  validates :user_id, :time, :movie, :duration, presence: true
  validates :duration, numericality: { only_integer: true }
end
