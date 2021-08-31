class Party < ApplicationRecord
  belongs_to :user
  has_many :attendees
  has_many :users, through: :attendees

  validates_presence_of :user_id, :time, :movie, :duration
  validates :duration, numericality: { only_integer: true }
end
