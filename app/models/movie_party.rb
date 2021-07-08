class MovieParty < ApplicationRecord


  has_many :attendees, dependent: :destroy
  has_many :users, through: :attendees

  validates_presence_of :user_id, :movie_title, :date_time
end
