class Attendee < ApplicationRecord

  belongs_to :user
  belongs_to :movie_party

  validates_presence_of :user, :movie_party
  # validates :user_id, uniqueness: {scope: :viewing_party_id}

end
