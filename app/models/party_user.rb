class PartyUser < ApplicationRecord
  validates_presence_of :user_id, :party_id

  belongs_to :user
  belongs_to :party
end
