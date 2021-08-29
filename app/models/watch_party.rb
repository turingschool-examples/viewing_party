class WatchParty < ApplicationRecord
  has_many :attendees
  has_many :users, through: :attendees
  validates :movie, presence: true
  validates :date, presence: true
  validates :start_time, presence: true
  validates :duration, presence: true

  belongs_to :user

  def chosen_movie
    MovieFacade.create_movie(self.movie_id)
  end
end
