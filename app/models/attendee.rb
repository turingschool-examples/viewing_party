class Attendee

  belongs_to :user
  belongs_to :viewing_party

  validates_presence_of :user, :viewing_party
  validate :user_id, uniqueness: {scope: :viewing_party_id}

end
