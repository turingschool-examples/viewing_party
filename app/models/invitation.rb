class Invitation < ApplicationRecord
  belongs_to :party
  belongs_to :invitee, class_name: 'User'
end
