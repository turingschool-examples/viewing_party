class PartyGuest < ApplicationRecord
  belongs_to :party
  belongs_to :guest, class_name: :User  # as :guest_id
end
