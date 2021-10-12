class Attendee < ApplicationRecord
  belongs_to :user
  belongs_to :party

  validates_presence_of :status, require: true
end
