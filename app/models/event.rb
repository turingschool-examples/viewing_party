class Event < ApplicationRecord
  belongs_to :user
  has_many :attendees
  has_many :users, through: :attendees

  validates_presence_of :title, :user_id, :duration, :day, :start_time
  validates_numericality_of :duration  
end
