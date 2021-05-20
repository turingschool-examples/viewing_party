class Party < ApplicationRecord
  validates :movie_title, presence: true
  validates :date, presence: true
  validates :start_time, presence: true
  validates :duration, presence: true
  validates :movie_api_id, presence: true

  has_many :attendees, dependent: :destroy
  has_many :users, through: :attendees

  def host
    attendees.find_by(status: 1).user.email
  end

  def invited_email
    users.joins(:attendees).where('attendees.status = ?', 0).pluck('users.email')
  end
end
