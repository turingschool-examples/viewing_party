class PartyGuest < ApplicationRecord
  belongs_to :view_party
  belongs_to :user

  def self.create_invites(party, friends)
    friends.delete("")
    friends.each do |friend|
      PartyGuest.create!(view_party_id: party, user_id: friend.to_i)
    end
  end
end
