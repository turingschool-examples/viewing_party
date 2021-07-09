class MovieParty < ApplicationRecord


  has_many :attendees, dependent: :destroy
  has_many :users, through: :attendees

  belongs_to :user

  validates_presence_of :user_id, :movie_title, :date_time
end
