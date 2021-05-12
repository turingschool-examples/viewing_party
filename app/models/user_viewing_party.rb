class UserViewingParty < ApplicationRecord
  validates :party_id, presence: true, numericality: true
  validates :user_id, presence: true, numericality: true

  belongs_to :party
  belongs_to :user
end
