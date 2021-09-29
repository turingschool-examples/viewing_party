class Event < ApplicationRecord
  has_many :attendees, dependent: :destroy
  belongs_to :user
  has_many :users, through: :attendees 
  validates :movie_title, presence: true
  validates :movie_id, presence: true
  validates :event_date, presence: true
  validates :event_time, presence: true
  validates :runtime, presence: true

end
