class WatchParty < ApplicationRecord
  has_many :attendees
  has_many :users, through: :attendees
  validates :movie, presence: true
  belongs_to :user

  # def movie
  #   MovieFacade.create_movie(self.movie_id)
  # end
end
