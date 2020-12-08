class Viewing < ApplicationRecord
  belongs_to :movie
  has_many :guests, dependent: :destroy
  has_many :users, through: :guests

  validates :date, :start_time, presence: true
  validates :duration, numericality: { greater_than: 0 }

  def user_hosting?(user_id)
    guests.find_by(user_id: user_id).hosting
  end
end