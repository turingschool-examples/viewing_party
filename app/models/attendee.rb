class Attendee < ApplicationRecord
  belongs_to :watch_party
  belongs_to :user
end
