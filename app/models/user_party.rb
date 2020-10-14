class UserParty < ApplicationRecord
  belongs_to :party
  belongs_to :attendee, class_name: 'User'
end
