class PartyGuest < ApplicationRecord
  belongs_to :view_party
  belongs_to :user

  def self.create_invites(party_id, friends_ids)
    friends_ids.delete('')
    friends_ids.each do |friend_id|
      PartyGuest.create!(view_party_id: party_id, user_id: friend_id.to_i)
    end
  end
end
