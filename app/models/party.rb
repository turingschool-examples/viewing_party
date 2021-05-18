class Party < ApplicationRecord
  validates :movie_title, presence: true
  validates :date, presence: true
  validates :start_time, presence: true
  validates :duration, presence: true

  has_many :attendees
  has_many :users, through: :attendees

  def host
    users.joins(:attendees).select('users.email').where('attendees.status = ?', 1)
  end
end
