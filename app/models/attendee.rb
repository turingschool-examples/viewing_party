class Attendee < ApplicationRecord
  belongs_to :user
  belongs_to :party

  validates :status, presence: true

  enum status: { 'host' => 0, 'invited' => 1, 'available' => 2 }
end
