class PartyFriend < ApplicationRecord
  belongs_to :user
  belongs_to :party

  validates :party, presence: true
  validates :user, presence: true
end
