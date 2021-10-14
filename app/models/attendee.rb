class Attendee < ApplicationRecord
  belongs_to :user
  belongs_to :party

  validates :status, presence: true

  enum status: ["host", "invited", "available"]
end
