class Attendee < ApplicationRecord
  validates :status, presence: true

  belongs_to :user
  belongs_to :party
end
