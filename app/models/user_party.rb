class UserParty < ApplicationRecord
  belongs_to :viewing_party
  belongs_to :user

  def self.create_invites(party, friends)
    friends.delete("")
    friends.each do |friend|
      UserParty.create!(viewing_party_id: party, user_id: friend.to_i)
    end
    require "pry"; binding.pry
  end
end
