class Guest < ApplicationRecord
  validates :party_id, :user_id, :status, presence: true
  belongs_to :party
  belongs_to :user

  def rsvp_yes
    update(status: "I'm in!")
  end

  def rsvp_no
    update(status: 'Hard Pass')
  end
end
