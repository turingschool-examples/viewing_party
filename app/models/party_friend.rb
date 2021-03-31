class PartyFriend < ApplicationRecord
  belongs_to :party
  belongs_to :friendship#, class_name: 'User'

  def self.make_multiple_friends(ids, party_id, user_id)
    return '' if ids.nil?

    friendships_ids = Friendship.find_friendships(user_id, ids)

    friendships_ids.each do |friendship_id|
      PartyFriend.create!({friendship_id: friendship_id, party_id: party_id})
    end
    # friend = Friendship.where(friend_id: ids)
    #
    # friend.each do |friendship|
    #   party_friend = PartyFriend.create!(friendship_id: friendship.id, party_id: party_id)
    #   party_friend.save
    # end
  end

  def self.find_invited_parties(user_id)
    friendships_ids = Friendship.find_user_friendships(user_id)
    Party.joins(:party_friends).where('party_friends.friendship_id = ?', friendships_ids)
  end
end
