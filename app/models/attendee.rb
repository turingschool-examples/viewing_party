class Attendee < ApplicationRecord
  belongs_to :watch_party
  belongs_to :user

  enum status: { 'hosting' => 0, 'invited' => 1 }
end
