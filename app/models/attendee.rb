class Attendee < ApplicationRecord

  belongs_to :user
  belongs_to :movie_party

  validates_presence_of :user, :movie_party
  validates_uniqueness_of :user, scope: :movie_party #, allow_nil: true

end
