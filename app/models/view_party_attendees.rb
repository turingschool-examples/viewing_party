class ViewPartyAttendees < ApplicationRecord
  belongs_to :view_party
  belongs_to :user
end
